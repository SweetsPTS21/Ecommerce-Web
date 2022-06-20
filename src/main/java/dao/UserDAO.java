package dao;


import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static java.lang.System.out;

public class UserDAO extends DBconnection {
    public String userName;
    public int userID;

    public boolean checkUser(String email, String password) {
        boolean result = false;
        String sql = "SELECT * FROM users WHERE userEmail = ? AND userPassword = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("userId"));
                user.setUsername(rs.getString("userName"));
                user.setEmail(rs.getString("userEmail"));
                user.setPassword(rs.getString("userPassword"));
                user.setPhone(rs.getString("userPhoneNumber"));
                user.setAddress(rs.getString("userAddress"));
                user.setRole(Integer.parseInt(rs.getString("isAdmin")));
                userName = user.getUsername();
                userID = user.getId();
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public String getUserName() {
        return userName;
    }
    public int getUserID() { return userID;}

    public boolean checkUserEmail(String email) {
        boolean result = false;
        String sql = "SELECT * FROM users WHERE userEmail = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                result = true;
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void addUser(String name, String email, String password) {
        String sql = "INSERT INTO users (userName, userEmail, userPassword, isAdmin) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, "0");
            ps.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserById(int id) {
        User user = new User();
        String sql = "SELECT * FROM users WHERE userId = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                user.setId(rs.getInt("userId"));
                user.setUsername(rs.getString("userName"));
                user.setEmail(rs.getString("userEmail"));
                user.setPassword(rs.getString("userPassword"));
                user.setPhone(rs.getString("userPhoneNumber"));
                user.setAddress(rs.getString("userAddress"));
                user.setRole(Integer.parseInt(rs.getString("isAdmin")));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserByEmail(String email) {
        User user = new User();
        String sql = "SELECT * FROM users WHERE userEmail = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                user.setId(rs.getInt("userId"));
                user.setUsername(rs.getString("userName"));
                user.setEmail(rs.getString("userEmail"));
                user.setPassword(rs.getString("userPassword"));
                user.setPhone(rs.getString("userPhoneNumber"));
                user.setAddress(rs.getString("userAddress"));
                user.setRole(Integer.parseInt(rs.getString("isAdmin")));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
