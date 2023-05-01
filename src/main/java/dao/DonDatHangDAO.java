package dao;

import model.ChiTiet;
import model.DonDatHang;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DonDatHangDAO extends DBconnection{

    public List<DonDatHang> getDonHangByNguoiDungId(int nguoiDungId) {
        List<DonDatHang> orders = new ArrayList<>();
        String query = "SELECT * FROM orders where userId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1,nguoiDungId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DonDatHang donDatHang = new DonDatHang();
                donDatHang.setId(rs.getInt("orderId"));
                donDatHang.setNguoiDungId(rs.getInt("userId"));
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
