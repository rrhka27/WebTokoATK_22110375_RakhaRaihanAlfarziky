package tokoatk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SalesDetail {
    public Integer id;
    public String salesId;
    public String barangId;
    public Integer qty;
    public Integer harga;
    
    public Integer getId() {
        return id;
    }
    
    public String getBarangId() {
        return barangId;
    }
            
    public String getBarangNama() {
        Barang barang = new Barang();
        return barang.baca(barangId) ? barang.getNama() : "Barang tidak ditemukan";
    }
            
    public Integer getQty() {
        return qty == null ? 0 : qty;
    }
        
    public Integer getHarga() {
        return harga == null ? 0 : harga;
    }
            
    public Integer getTotal() {
        return harga * qty;
    }
    
    public boolean tambah() {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "INSERT INTO salesd (salesId,barangId,qty,harga) VALUES (?,?,?,?)";
            st = conn.prepareStatement(sql);
            st.setString(1, salesId);
            st.setString(2, barangId);
            st.setInt(3, qty);
            st.setInt(4, harga);
            st.executeUpdate();
            conn.close();
            
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
            
    public boolean baca(Integer id) {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;

    try {
        conn = DbConnection.connect();

        // Ambil juga nama barang dari tabel barang
        String sql = "SELECT s.*, b.nama as barangNama FROM salesd s LEFT JOIN barang b ON s.barangId = b.id WHERE s.id=?";
        st = conn.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();

        if (rs.next()) {
            this.id = id;
            this.salesId = rs.getString("salesId");
            this.barangId = rs.getString("barangId");           
            this.qty = rs.getObject("qty", Integer.class); // Aman untuk null
            this.harga = rs.getObject("harga", Integer.class); // Aman untuk null
            return true;
        } else {
            System.out.println("SalesDetail tidak ditemukan untuk ID: " + id);
            return false;
        }
    } catch (Exception ex) {
        ex.printStackTrace(); // Tambahkan log
        return false;
    }
    }
            
            
    public boolean hapus() {
        Connection conn = null;
        PreparedStatement st;
        
        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "DELETE FROM salesd where id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);

            st.executeUpdate();

            conn.close();

            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}