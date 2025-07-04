package tokoatk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StockDetail {
    public Integer id;
    public String stockId;
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
        barang.baca(barangId);
        return barang.getNama();
    }

    public Integer getQty() {
        return qty;
    }
    public Integer getHarga() {
        return harga;
}


    public boolean tambah() {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DbConnection.connect();
            String sql = "INSERT INTO stockd (stockId, barangId, qty, harga) VALUES (?, ?, ?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, stockId);
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
            String sql = "SELECT s.*, b.nama as barangNama FROM stockd s LEFT JOIN barang b ON s.barangId = b.id WHERE s.id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();

            if (rs.next()) {
                this.id = id;
                this.stockId = rs.getString("stockId");
                this.barangId = rs.getString("barangId");
                this.qty = rs.getObject("qty", Integer.class); 
                this.harga = rs.getObject("harga", Integer.class);
                return true;
            } else {
                System.out.println("StockDetail tidak ditemukan untuk ID: " + id);
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
    public boolean hapus() {
        Connection conn = null;
        PreparedStatement st;
        
        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "DELETE FROM stockd where id=?";
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