package dao;

import model.ChiTiet;
import model.DonDatHang;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DonDatHangDAO extends DBconnection{

    public List<DonDatHang> getDonHangByNguoiDungId(String nguoiDungId) {
        List<DonDatHang> orders = new ArrayList<>();
        String query = "SELECT * FROM order where userId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1,nguoiDungId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DonDatHang donDatHang = new DonDatHang();
                donDatHang.setId(rs.getInt("orderID"));
                donDatHang.setNguoiDungId(rs.getInt("userID"));
                donDatHang.setTen(rs.getString("name"));
                donDatHang.setSodienthoai(rs.getString("phone"));
                donDatHang.setDiachi(rs.getString("address"));
                donDatHang.setTongTien(rs.getInt("totalPrice"));
                donDatHang.setTrangthai(rs.getString("status"));
                donDatHang.setNgay(rs.getString("date"));
                orders.add(donDatHang);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
}
