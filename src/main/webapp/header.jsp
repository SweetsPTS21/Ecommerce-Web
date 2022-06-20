<%@ page import="dao.ProductDAO" %>
<%@ page import="model.Product" %>
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
    <link rel="stylesheet" href="style.css">
</head>
<body>
<section id="dautrang">
    <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>

    <div>
        <ul id="thanh-dieu-huong">
            <%
                if(session.getAttribute("isAdmin") != null && Integer.parseInt(session.getAttribute("isAdmin").toString()) == 1) { %>
            <li><a href="manageProduct?isAdmin=1">Quản lý</a></li>
            <% } %>
            <li><a href="index.jsp" id="1"   class="actived">Trang chủ</a></li>
            <li><a href="shop" id="2"  class="actived">Cửa hàng</a></li>
            <li><a href="about.jsp" id="3"  class="actived">Về chúng tôi</a></li>
            <li><a href="contact.jsp" id="4"  class="actived">Liên hệ</a></li>
            <li id="lg-bag"><a href="cart.jsp" id="5"  class="actived"><i class="far fa-shopping-bag"></i> </a>
                <sub>
                    <% if(session.getAttribute("cart-size") != null) {%>
                    <%= session.getAttribute("cart-size") %></sub></li>
            <% } else {%>
            0</sub></li>
            <% } %>
            <% if (session.getAttribute("email") == null) { %>
            <li><a href="login.jsp">Đăng nhập</a></li>
            <% }else{  %>
            <li><a href="/logout">Đăng xuất</a></li>
            <% } %>
        </ul>
    </div>
</section>
</body>


</html>
