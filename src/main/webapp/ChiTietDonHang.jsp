<%@ page import="dao.SanPhamDAO" %>
<%@ page import="model.SanPham" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ChiTietDAO" %>
<%@ page import="model.ChiTiet" %>
<%@ page import="dao.DonDatHangDAO" %>
<%@ page import="model.DonDatHang" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý sản phẩm</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
<body>
<% try {
    int id = (int) session.getAttribute("nguoiDungId");
%>
<section id="dautrang">
    <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>
    <div>
        <ul id="thanh-dieu-huong">
            <li><a href="index.jsp" id="1"   class="actived">Trang chủ</a></li>
            <li><a href="DonDatHang.jsp" id="2" class="">Quay lại</a></li>
        </ul>
    </div>
</section>
<section id="cart" class="phan-doan-p1">
    <div id="quan-ly-dau">
        <div class="hang">
            <h2>Đơn hàng của tôi</h2>
        </div>
    </div>
    <table width="100%">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên</th>
            <th>Ảnh</th>
            <th>Giá</th>
            <th>Số lượng</th>
        </tr>
        </thead>
        <tbody>
        <%int i = 1;%>
        <c:forEach items="${products}" var = "o">
            <tr>
                <td><%=i++%></td>
                <td>${o.ten}</td>
                <td><img src="${o.anh}"></td>
                <td>$${o.gia}</td>
                <td>${o.soluong}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>

<%  } catch(NullPointerException e) {
    e.printStackTrace();
    response.sendRedirect("index.jsp");
} %>
</body>
<script>
    var idpage = 2;
    let element = document.getElementsByClassName("actived");
    console.log(element)
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");
</script>

</html>