<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.SanPham" %>
<%@ page import="dao.SanPhamDAO" %>
<%@ page import="java.util.List" %>
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
<div class="tim-kiem">
    <form action="timKiem" method = "post">
        <input value="${tukhoa}" type="text" name="tukhoa" placeholder="Tìm kiếm">
        <i class="ti-search"></i><i class="far fa-search"></i>
    </form>
</div>
<div class="phan-loai">
    <table>
        <thead><h3 style="color: #088178">Danh mục sản phẩm</h3></thead>
        <thead><h4><a href="loaiSanPham?loai=Laptop">Laptop</a></h4></thead>
        <thead><h4><a href="loaiSanPham?loai=Phone">Phone</a></h4></thead>
    </table>
</div>
<section id="sanpham1" class="phan-doan-p1">
    <div class="ngan-san-pham">
        <c:forEach items="${list}" var='o'>
            <div class="san-pham" onclick="window.location.href='chiTiet?sanPhamId=${o.id}';">
                <img src="${o.anh}" alt="">
                <div class="mo-ta">
                    <span>${o.loai}</span>
                    <h5>${o.ten}</h5>
                    <h4>$${o.gia}</h4>
                </div>
                <a href="chiTiet?sanPhamId=${o.id}"><i class="fal fa-shopping-cart gio-hang"></i></a>
            </div>
        </c:forEach>
    </div>
</section>
<footer class="phan-doan-p1">
    <div class="cot">
        <img class="logo" src="img/logo.png" alt="">
    </div>
    <div class="cot">
        <a href="ThongTin.jsp">Về chúng tôi</a>
        <a href="LienHe.jsp">Liên hệ</a>
    </div>
    <div class="cot">
        <a href="DangNhap.jsp">Đăng nhập</a>
        <a href="GioHang.jsp">Giỏ hàng</a>
    </div>
</footer>
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