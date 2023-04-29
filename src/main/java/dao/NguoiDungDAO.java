package dao;


import model.NguoiDung;
import ultilities.Tags;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static AES.AES.giaiMa;
import static AES.AES.maHoa;

public class NguoiDungDAO extends DBconnection {
    public String tenNguoiDung;
    public int nguoiDungId;


    public String getTaiKhoan() {
        return tenNguoiDung;
    }
    public int getNguoiDungID() { return nguoiDungId;}

    public boolean kiemTraEmail(String email) {
        boolean ketqua = false;
        String sql = "SELECT * FROM users WHERE userEmail = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                ketqua = true;
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    public void themNguoiDung(String ten, String email, String matkhau) {
        String sql = "INSERT INTO users (userName, userEmail, userPassword, isAdmin) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, ten);
            ps.setString(2, email);
            ps.setString(3, matkhau);
            ps.setInt(4, 0);
            ps.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public NguoiDung getNguoiDungByEmail(String email) {
        NguoiDung nguoiDung = new NguoiDung();
        String sql = "SELECT * FROM users WHERE userEmail = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                nguoiDung.setId(rs.getInt("userId"));
                nguoiDung.setTaikhoan(rs.getString("userName"));
                nguoiDung.setEmail(rs.getString("userEmail"));
                nguoiDung.setMatkhau(rs.getString("userPassword"));
                nguoiDung.setSodienthoai(rs.getString("userPhoneNumber"));
                nguoiDung.setDiachi(rs.getString("userAddress"));
                nguoiDung.setVaitro(Integer.parseInt(rs.getString("isAdmin")));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return nguoiDung;
    }

    public boolean kiemTraNguoiDung(String email, String matkhau) {
        boolean ketqua = false;
        String sql = "SELECT * FROM users WHERE userEmail = ? AND userPassword = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, maHoa(matkhau, Tags.ENCRYPT_KEY)); // encrypt matkhau
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                NguoiDung nguoiDung = new NguoiDung();
                nguoiDung.setId(rs.getInt("userId"));
                nguoiDung.setTaikhoan(rs.getString("userName"));
                nguoiDung.setEmail(rs.getString("userEmail"));
                String a = giaiMa(rs.getString("userPassword"),"WeBteaM07"); // decrypt matkhau
                nguoiDung.setMatkhau(a);
                nguoiDung.setSodienthoai(rs.getString("userPhoneNumber"));
                nguoiDung.setDiachi(rs.getString("userAddress"));
                nguoiDung.setVaitro(Integer.parseInt(rs.getString("isAdmin")));
                tenNguoiDung = nguoiDung.getTaikhoan();
                if(a.equals(matkhau)) {
                    return true;
                }
                else return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    public NguoiDung loginWithGoogle(String googleUserId) {
        String sql = "SELECT * FROM users WHERE googleUserId = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, googleUserId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                NguoiDung nguoiDung = new NguoiDung();
                nguoiDung.setId(rs.getInt("userId"));
                nguoiDung.setTaikhoan(rs.getString("userName"));
                nguoiDung.setEmail(rs.getString("userEmail"));
                nguoiDung.setVaitro(Integer.parseInt(rs.getString("isAdmin")));
                tenNguoiDung = nguoiDung.getTaikhoan();
                return nguoiDung;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
