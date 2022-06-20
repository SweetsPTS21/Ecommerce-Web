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

    <% SanPham sanPham = new SanPham();
        sanPham = (SanPham) request.getAttribute("sanpham");
        int sanPhamId = sanPham.getId();
    %>
    <%@include file="header.jsp" %>

    <section id="chitiet-sanpham" class="phan-doan-p1">
        <div class="anh-san-pham">
            <img src="<%= sanPham.getAnh() %>" width="100%" id="MainImg" alt="">
        </div>
        <div class="anh-chi-tiet">
            <h4><%= sanPham.getLoai() %> </h4>
            <h4><%= sanPham.getTen() %></h4>
            <h2>$<%= sanPham.getGia() %></h2>
            <br>
            <a href="/add-to-cart?sanPhamId=<%= sanPhamId %>">
                <button class="normal">Thêm vào giỏ hàng</button>
            </a>
            <h4>Mô tả sản phẩm</h4>
            <span><%= sanPham.getMota() %></span>
        </div>
    </section>
    <%@include file="footer.jsp" %>
    <script>

    </script>
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