package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class GoogleUserDAO extends DBconnection{

    public void insertGoogleUser(String googleUserId, String googleUserName, String googleUserEmail) {
        String sql = "INSERT INTO users (userName, userEmail, isAdmin, isGoogleUser, googleUserId) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, googleUserName);
            ps.setString(2, googleUserEmail);
            ps.setInt(3, 0);
            ps.setInt(4, 1);
            ps.setString(5, googleUserId);
            ps.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean checkGoogleUser(String id) {
        String sql = "SELECT * FROM users WHERE googleUserId = ?";

        try {
            PreparedStatement  ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            return ps.executeQuery().next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
