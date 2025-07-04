package tokoatk;

import java.sql.*;
import java.util.ArrayList;

public class Barang {

    public String id;
    public String nama;
    public String jenis;
    public Integer harga;

    public boolean baca(String id) {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;

        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "SELECT * from barang where id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();

            if (rs.next()) {
                this.id = id;
                this.nama = rs.getString("nama");
                this.jenis = rs.getString("jenis");
                this.harga = rs.getInt("harga");
                return true;
            } else {
                System.out.println("Barang tidak ditemukan dengan ID: " + id);
                return false;
            }
        } catch (Exception ex) {
            return false;
        }
    }

    public String getId() {
        return id;
    }

    public String getNama() {
        return nama;
    }

    public String getJenis() {
        return jenis;
    }

    public Integer getHarga() {
        return harga == null ? 0 : harga;
    }
    

    public boolean update() {
       
        Connection conn = null;
        PreparedStatement st;
        
        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "UPDATE barang set nama=?, jenis=?, harga=? where id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, this.nama);
            st.setString(2, this.jenis);
            st.setInt(3, this.harga);
            st.setString(4, this.id);

            st.executeUpdate();

            conn.close();

            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    
    
    public boolean hapus() {
        Connection conn = null;
        PreparedStatement st;
        
        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "DELETE FROM barang where id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, id);

            st.executeUpdate();

            conn.close();

            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean tambah() {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "INSERT INTO barang (id,nama,jenis,harga) values (?,?,?,?)";
            st = conn.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, nama);
            st.setString(3, jenis);
            st.setInt(4, harga);
            st.executeUpdate();
            conn.close();
            
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public static ArrayList<Barang> getList() {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;
        ArrayList<Barang> result = new ArrayList<Barang>();

        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "SELECT * from barang";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();

            while(rs.next()) {
                Barang entry = new Barang();
                entry.baca(rs.getString("id"));
                result.add(entry);
            }
            conn.close();

            return result;
        } catch (Exception ex) {
            return null;
        }
    }
}