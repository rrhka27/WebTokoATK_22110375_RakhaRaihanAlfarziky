package tokoatk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Stock {
    public String id;
    public LocalDateTime waktu;
    public String username;

    public String getId() {
        return id;
    }

    public LocalDateTime getWaktu() {
        return waktu;
    }

    public String getUsername() {
        return username;
    }
    

    public boolean baca(String id) {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;

        try {
            conn = DbConnection.connect();
            String sql = "SELECT * FROM stockm WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();

            if (rs.next()) {
                this.id = rs.getString("id");
                this.waktu = rs.getTimestamp("waktu").toLocalDateTime();
                this.username = rs.getString("username");
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean tambah(String username) {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DbConnection.connect();
            LocalDateTime dt = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmssS");
            this.id = dt.format(formatter);

            String sql = "INSERT INTO stockm (id, username) VALUES (?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, this.id);
            st.setString(2, username);
            st.executeUpdate();
            conn.close();
            
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public static ArrayList<Stock> getList() {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;
        ArrayList<Stock> result = new ArrayList<>();

        try {
            conn = DbConnection.connect();
            String sql = "SELECT * FROM stockm";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                Stock entry = new Stock();
                entry.baca(rs.getString("id"));
                result.add(entry);
            }

            conn.close();
            return result;
        } catch (Exception ex) {
            return null;
        }
    }

    public ArrayList<StockDetail> getDetail() {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;
        ArrayList<StockDetail> result = new ArrayList<StockDetail>();

        try {
            conn = DbConnection.connect();
            String sql = "SELECT * FROM stockd WHERE stockId=?";
            st = conn.prepareStatement(sql);
            st.setString(1, this.id);
            rs = st.executeQuery();

            while (rs.next()) {
                StockDetail entry = new StockDetail();
                if (entry.baca(rs.getInt("id"))) {
                    result.add(entry);
                } else {
                    System.out.println("Gagal membaca detail ID: " + rs.getInt("id"));
                }
            }

            conn.close();
            return result;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    public boolean hapus() {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DbConnection.connect();
            String sql = "DELETE FROM stockm WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, this.id);
            
            st.executeUpdate();
            
            conn.close();
            
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public boolean addDetail(String barangId, Integer qty, Integer harga) {
        StockDetail detail = new StockDetail();
        detail.stockId = this.id;
        detail.barangId = barangId;
        detail.qty = qty;
        detail.harga = harga;
        return detail.tambah();
    }

}