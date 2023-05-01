package dao;

import model.Comment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO extends DBconnection{

    public void addComment(int productId, String name, String comment) throws SQLException {
        String sql = "INSERT INTO comments (productId, name, comment) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, productId);
            statement.setString(2, name);
            statement.setString(3, comment);
            statement.executeUpdate();
        }
    }

    public List<Comment> getCommentsForProduct(int productId) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE productId = ? ORDER BY timestamp DESC";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, productId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String comment = resultSet.getString("comment");
                    Timestamp timestamp = resultSet.getTimestamp("timestamp");
                    comments.add(new Comment(id, productId, name, comment, timestamp));
                }
            }
        }
        return comments;
    }

    public void addReply(int commentId, String name, String reply) throws SQLException {
        String sql = "INSERT INTO replies (commentId, name, reply) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, commentId);
            statement.setString(2, name);
            statement.setString(3, reply);
            statement.executeUpdate();
        }
    }

    public List<Comment> getRepliesForComment(int commentId) throws SQLException {
        List<Comment> replies = new ArrayList<>();
        String sql = "SELECT * FROM replies WHERE commentId = ? ORDER BY timestamp DESC";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, commentId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int productId = resultSet.getInt("commentId");
                    String name = resultSet.getString("name");
                    String reply = resultSet.getString("reply");
                    Timestamp timestamp = resultSet.getTimestamp("timestamp");
                    replies.add(new Comment(id, productId, name, reply, timestamp));
                }
            }
        }
        return replies;
    }
}
