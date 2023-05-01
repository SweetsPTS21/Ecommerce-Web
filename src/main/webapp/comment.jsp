<%@ page import="model.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.CommentDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="model.SanPham" %><%--
  Created by IntelliJ IDEA.
  User: boixi
  Date: 5/1/2023
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Comments</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%
    try {
        int userId = Integer.parseInt(session.getAttribute("nguoiDungId").toString());
        SanPham product = (SanPham) request.getAttribute("sanpham");
        int productId = product.getId();

%>
<div class="container mt-5">
    <h1>Product Comments</h1>
    <form method="post" action="/comment">
        <div class="form-group">
            <%--@declare id="productId"--%><label for="productId">ProductId:</label>
            <input type="text" class="form-control" name="productId" value="<%=productId%>" disabled>
        </div>
        <div class="form-group">
            <%--@declare id="name"--%><label for="name">Name:</label>
            <input type="text" class="form-control" name="name" required>
        </div>
        <div class="form-group">
            <%--@declare id="comment"--%><label for="comment">Comment:</label>
            <textarea class="form-control" name="comment" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <hr>
    <h2>Conversation</h2>
    <% CommentDAO commentDAO = new CommentDAO();
        List<Comment> comments = null;
        try {
            comments = commentDAO.getCommentsForProduct(productId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } %>
    <ul class="list-group">
        <% for (Comment comment : comments) { %>
        <li class="list-group-item">
            <strong><%= comment.getName() %>
            </strong> says: <%= comment.getComment() %>
            <% if (userId == 1) { %>
            <button type="button" class="btn btn-sm btn-secondary float-right" data-toggle="collapse"
                    data-target="#replyForm<%= comment.getId() %>">Reply
            </button>
            <div class="collapse mt-3" id="replyForm<%= comment.getId() %>">
                <form method="post" action="/reply">
                    <div class="form-group">
                        <label for="productId">ProductId:</label>
                        <input type="text" class="form-control" name="productId" value="<%=productId%>" disabled>
                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="comment">Reply:</label>
                        <textarea class="form-control" name="reply" required></textarea>
                    </div>
                    <input type="hidden" name="commentId" value="<%= comment.getId() %>">
                    <button type="submit" class="btn btn-secondary">Submit</button>
                </form>
            </div>
            <% } %>
            <% List<Comment> replies = null;
                try {
                    replies = commentDAO.getRepliesForComment(comment.getId());
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } %>
            <% if (!replies.isEmpty()) { %>
            <ul class="list-group mt-3">
                <% for (Comment reply : replies) { %>
                <li class="list-group-item">
                    <strong><%= reply.getName() %>
                    </strong> replies: <%= reply.getComment() %>
                </li>
                <% } %>
            </ul>
            <% } %>
        </li>
        <% } %>
    </ul>
</div>
<% } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("/index.jsp");
    } %>
</body>
</html>
