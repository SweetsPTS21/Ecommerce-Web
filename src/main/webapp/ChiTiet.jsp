<%@ page import="model.SanPham" %>
<%@ page import="dao.CommentDAO" %>
<%@ page import="model.Comment" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>Ecommerce Website</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        i.fas.fa-reply {
            transform: rotate(180deg);
        }
    </style>
</head>

<body>

<% SanPham sanPham = (SanPham) request.getAttribute("sanpham");
    int nguoiDungId = 0;
    int sanPhamId = sanPham.getId();
    if(session.getAttribute("nguoiDungId") != null) {
        nguoiDungId = (int) session.getAttribute("nguoiDungId");
    }
%>
<%@include file="DauTrang.jsp" %>

<section id="chitiet-sanpham" class="phan-doan-p1">
    <div class="anh-san-pham">
        <img src="<%= sanPham.getAnh() %>" width="100%" id="MainImg" alt="">
    </div>
    <div class="anh-chi-tiet">
        <h4><%= sanPham.getLoai() %> </h4>
        <h4><%= sanPham.getTen() %></h4>
        <h2>$<%= sanPham.getGia() %></h2>
        <br>
        <a href="/themVaoGioHang?sanPhamId=<%= sanPhamId %>">
            <button class="binh-thuong">Thêm vào giỏ hàng</button>
        </a>
        <h4>Mô tả sản phẩm</h4>
        <span><%= sanPham.getMota() %></span>
    </div>
</section>
<br>
<div class="container mt-5">
    <div class="comment">
        <h1>Gửi đánh giá</h1>
        <form method="post" action="/comment">
            <div class="form-group">
                <input type="hidden" class="form-control" name="productId" value="<%=sanPhamId%>" >
            </div>
            <div class="form-group">
                <%--@declare id="name"--%><label for="name">Name:</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="form-group">
                <%--@declare id="comment"--%><label for="comment">Comment:</label>
                <textarea class="form-control" id="comment" name="comment" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <hr>
    <h2>Đánh giá sản phẩm</h2>
    <% CommentDAO commentDAO = new CommentDAO();
        List<Comment> comments = null;
        try {
            comments = commentDAO.getCommentsForProduct(sanPhamId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } %>
    <ul class="list-group">
        <% for (Comment comment : comments) { %>
        <li class="list-group-item">
            <strong><%= comment.getName() %></strong> [<%=comment.getTimestamp()%>]<br>
            <%= comment.getComment() %>
            <button type="button" class="btn btn-sm btn-secondary float-right" id="btnReply" data-toggle="collapse"
                    data-target="#replyForm<%=comment.getId()%>">Reply
            </button>
            <div class="collapse mt-3" id="replyForm<%=comment.getId()%>">
                <form method="post" action="/reply">
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="productId" value="<%=sanPhamId%>" readonly>
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
                    <i class="fas fa-reply"></i><strong><%= reply.getName() %></strong> [<%=reply.getTimestamp()%>]<br>
                    <%= reply.getComment() %>
                </li>
                <% } %>
            </ul>
            <% } %>
        </li>
        <% } %>
    </ul>
</div>
<%@include file="ChanTrang.jsp" %>
</body>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        $('#btnReply').click(function(){
            $(this).closest('.list-group-item').find('#replyForm').toggle();
        });
    });
</script>
</html>