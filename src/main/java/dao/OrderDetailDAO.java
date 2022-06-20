package dao;

import model.Order;
import model.OrderDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO extends DBconnection {
    public void add(int orderID, int productID, int quantity) {
        String query = "INSERT INTO orderdetail(orderID, productID, quantity) VALUES (?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1,orderID);
            ps.setInt(2, productID);
            ps.setInt(3, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<OrderDetail> getAllOrderDetail() {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String query = "SELECT * FROM orderdetail";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(rs.getInt("orderID"));
                orderDetail.setProductId(rs.getInt("productID"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetails.add(orderDetail);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }


        return orderDetails;

    }
}
