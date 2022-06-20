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
