package dao;

import model.ChiTiet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ChiTietDAO extends DBconnection {
    public void themChiTiet(int donDatHangId, int sanPhamId, int soluong) {
        String query = "INSERT INTO orderdetail(orderID, productID, quantity) VALUES (?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1,donDatHangId);
            ps.setInt(2, sanPhamId);
            ps.setInt(3, soluong);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ChiTiet> getAllOrderDetail() {
        List<ChiTiet> chiTietList = new ArrayList<>();
        String query = "SELECT * FROM orderdetail";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChiTiet chiTiet = new ChiTiet();
                chiTiet.setDonDatHangId(rs.getInt("orderID"));
                chiTiet.setSanPhamId(rs.getInt("productID"));
                chiTiet.setSoluong(rs.getInt("quantity"));
                chiTietList.add(chiTiet);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return chiTietList;
    }

    public void xoaChiTiet(int id) {
        String sql = "DELETE FROM orderdetail WHERE orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
