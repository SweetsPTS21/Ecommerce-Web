<%@ page import="model.Product" %>
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

    <% Product product = new Product();
        product = (Product) request.getAttribute("product");
        int productId = product.getId();
    %>
    <%@include file="header.jsp" %>

    <section id="chitiet-sanpham" class="phan-doan-p1">
        <div class="anh-san-pham">
            <img src="<%= product.getImage() %>" width="100%" id="MainImg" alt="">
        </div>
        <div class="anh-chi-tiet">
            <h4><%= product.getCategory() %> </h4>
            <h4><%= product.getName() %></h4>
            <h2>$<%= product.getPrice() %></h2>
            <br>
            <a href="/add-to-cart?productId=<%= productId %>">
                <button class="normal">Thêm vào giỏ hàng</button>
            </a>
            <h4>Mô tả sản phẩm</h4>
            <span><%= product.getDescription() %></span>
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