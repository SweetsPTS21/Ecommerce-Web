<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.SanPham" %>
<%@ page import="dao.SanPhamDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.SanPham" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <title>Ecommerce Website</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
<%
    SanPhamDAO sanPhamDAO = new SanPhamDAO();
    List<SanPham> listSanPham = sanPhamDAO.getTatCaSanPham();
%>


<section id="dautrang">
    <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>

    <div>
        <ul id="thanh-dieu-huong">
            <li><a href="index.jsp">Trang chủ</a></li>
            <li><a href="shop" class="active">Cửa hàng</a></li>
            <li><a href="about.jsp">Về chúng tôi</a></li>
            <li><a href="contact.jsp">Liên hệ</a></li>
            <li id="lg-bag"><a href="cart.jsp"><i class="far fa-shopping-bag"></i> </a>
                <sub>
                    <% if(session.getAttribute("cart-size") != null) {%>
                    <%= session.getAttribute("cart-size") %></sub></li>
            <% } else {%>
            </sub></li>
            <% } %>
            <% if (session.getAttribute("email") == null) { %>
            <li><a href="login.jsp">Đăng nhập</a></li>
            <% }else{  %>
            <li><a href="/logout">Đăng xuất</a></li>
            <% } %>

        </ul>
    </div>
</section>
<div class="search-box">
    <form action="search" method = "post">
        <input value="${tukhoa}" type="text" name="tukhoa" placeholder="Tìm kiếm">
        <i class="ti-search"></i>
    </form>
</div>
<section id="sanpham1" class="phan-doan-p1">
    <div class="ngan-san-pham">
        <c:forEach items="${list}" var='o'>
            <div class="san-pham" onclick="window.location.href='detail?sanPhamId=${o.id}';">
                <img src="${o.anh}" alt="">
                <div class="mo-ta">
                    <span>${o.loai}</span>
                    <h5>${o.ten}</h5>
                    <h4>${o.gia}$</h4>
                </div>
                <a href="detail?sanPhamId=${o.id}"><i class="fal fa-shopping-cart cart"></i></a>
            </div>
        </c:forEach>
    </div>
</section>
<footer class="phan-doan-p1">
    <div class="cot">
        <img class="logo" src="img/logo.png" alt="">
    </div>
    <div class="cot">
        <a href="about.jsp">Về chúng tôi</a>
        <a href="contact.jsp">Liên hệ</a>
    </div>
    <div class="cot">
        <a href="login.jsp">Đăng nhập</a>
        <a href="cart.jsp">Giỏ hàng</a>
    </div>

</footer>
</body>
</html>