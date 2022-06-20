package dao;

import model.Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CheckoutDAO extends DBconnection{
    public int add(String userID, String username, String phonenumber, String address, String total) {
        String sql = "INSERT INTO webptit.order (userID, name, phone, address,totalPrice, date, status) VALUES (?, ?, ?, ?, ?, current_date, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, userID);
            ps.setString(2, username);
            ps.setString(3, phonenumber);
            ps.setString(4, address);
            ps.setString(5, total);
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

    public List<Order> getAllOrder() {
        String sql = "SELECT * FROM webptit.order";
        List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setName(rs.getNString("name"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getNString("address"));
                order.setTotalPrice(rs.getInt("totalPrice"));
                order.setDate(rs.getString("date"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }


    public Order getOrderById(int id) {
        String sql = "SELECT * FROM order WHERE orderId = ?";
        Order order = new Order();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order.setId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setName(rs.getNString("orderName"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getNString("address"));
                order.setTotalPrice(rs.getInt("totalPrice"));
                order.setDate(rs.getString("orderDate"));
                order.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    public void updateStatus(int id, int status) {
        String sql = "UPDATE webptit.order SET status = ? WHERE orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
