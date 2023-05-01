package dao;

import model.DonDatHang;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ThanhToanDAO extends DBconnection{
    public int themDonDatHang(int nguoiDungId, String username, String phonenumber, String address, int total) {
        String sql = "INSERT INTO order (userID, name, phone, address,totalPrice, date, status) VALUES (?, ?, ?, ?, ?, current_date, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, nguoiDungId);
            ps.setString(2, username);
            ps.setString(3, phonenumber);
            ps.setString(4, address);
            ps.setInt(5, total);
            ps.setString(6, "0");
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next()) {
                return rs.getInt(1);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }

    public List<DonDatHang> getTatCaDonDatHang() {
        String sql = "SELECT * FROM order";
        List<DonDatHang> donDatHangList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DonDatHang donDatHang = new DonDatHang();
                donDatHang.setId(rs.getInt("orderId"));
                donDatHang.setNguoiDungId(rs.getInt("userId"));
                donDatHang.setTen(rs.getNString("name"));
                donDatHang.setSodienthoai(rs.getString("phone"));
                donDatHang.setDiachi(rs.getNString("address"));
                donDatHang.setTongTien(rs.getInt("totalPrice"));
                donDatHang.setNgay(rs.getString("date"));
                donDatHang.setTrangthai(rs.getString("status"));
                donDatHangList.add(donDatHang);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return donDatHangList;
    }


    public DonDatHang getDonDatHangById(int id) {
        String sql = "SELECT * FROM order WHERE orderId = ?";
        DonDatHang donDatHang = new DonDatHang();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                donDatHang.setId(rs.getInt("orderId"));
                donDatHang.setNguoiDungId(rs.getInt("userId"));
                donDatHang.setTen(rs.getNString("orderName"));
                donDatHang.setSodienthoai(rs.getString("phone"));
                donDatHang.setDiachi(rs.getNString("address"));
                donDatHang.setTongTien(rs.getInt("totalPrice"));
                donDatHang.setNgay(rs.getString("orderDate"));
                donDatHang.setTrangthai(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return donDatHang;
    }

    public void capNhatTrangThai(int id, int trangthai) {
        String sql = "UPDATE order SET status = ? WHERE orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, trangthai);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void xoaDonHang(int id) {
        String sql = "DELETE FROM order WHERE orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
