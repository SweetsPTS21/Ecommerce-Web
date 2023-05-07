<%@ page import="dao.SanPhamDAO" %>
<%@ page import="model.SanPham" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <title>Ecommerce Website</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<%
    SanPhamDAO sanPhamDAO = new SanPhamDAO();
    List<SanPham> listSanPham = sanPhamDAO.getTatCaSanPham();
%>


<%@include file="DauTrang.jsp" %>

<section id="banner">
    <h2>TEAM 6</h2>

    <% if (session.getAttribute("email") == null) { %>
    <h1>Bán hàng công nghệ</h1>
    <% } else {  %>
    <h1>Xin chào
        <% String name = (String) session.getAttribute("tenNguoiDung");
            out.print(name);
        %>
    </h1>
    <% } %>
</section>

<section id="sanpham1" class="phan-doan-p1">
    <h2>Sản phẩm nổi bật</h2>
    <p>Bộ sưu tập Laptop</p>
    <div class="ngan-san-pham">
        <% for (SanPham sanPham : listSanPham) {
            int id = sanPham.getId();
            if(sanPham.getLoai().equalsIgnoreCase("Laptop")){ %>
        <div class="san-pham" onclick="window.location.href='chiTiet?sanPhamId=<%= id %>';">
            <img src="<%= sanPham.getAnh() %>" alt="">
            <div class="mo-ta">
                <span><%= sanPham.getLoai() %></span>
                <h5><%= sanPham.getTen() %></h5>
                <h4><%= sanPham.getGia() %>$</h4>
            </div>
            <a href="#"><i class="fal fa-shopping-cart gio-hang"></i></a>
        </div>
        <% } } %>
    </div>
</section>

<section id="sanpham2" class="phan-doan-p1">
    <h2>Sản phẩm nổi bật</h2>
    <p>Bộ sưu tập điện thoại</p>
    <div class="ngan-san-pham">
        <% for (SanPham sanPham : listSanPham) {
            int id = sanPham.getId();
            if(sanPham.getLoai().equalsIgnoreCase("Phone")){ %>
        <div class="san-pham" onclick="window.location.href='chiTiet?sanPhamId=<%= id %>';">
            <img src="<%= sanPham.getAnh() %>" alt="">
            <div class="mo-ta">
                <span><%= sanPham.getLoai() %></span>
                <h5><%= sanPham.getTen() %></h5>
                <h4>$<%= sanPham.getGia() %></h4>
            </div>
            <a href="chiTiet?sanPhamId=<%= id %>"><i class="fal fa-shopping-cart gio-hang"></i></a>
        </div>
        <% } } %>
    </div>
</section>

<%@include file="ChanTrang.jsp" %>

</body>

<script>
    var idpage = 1;
    let element = document.getElementsByClassName("actived");
    console.log(element)
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");
</script>


</html>

