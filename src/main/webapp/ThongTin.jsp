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
<%@include file="DauTrang.jsp" %>
<section id="doan-gioi-thieu" class="phan-doan-p1">
        <img src="img/about/a6.jpg" alt="">
        <div>
            <h2>Chúng Tôi Là Ai?</h2>
            <p>Team 6 - Hướng dịch vụ PTIT.</p>
            <br><br>
            <p>Nguyễn Văn Bách - B19DCCN056</p>
            <br>
            <p>Phạm Thanh Sơn - B19DCCN559</p>
            <br>
            <p>Nguyễn Ngọc Duy - B19DCCN140</p>
            <br>
            <p>Phí Minh Quang - B19DCCN523</p>
            <br>
            <p>Hoàng Duy Đông - B19DCCN184</p>
            <br>
        </div>
    </section>
<%@include file="ChanTrang.jsp" %>
</body>

<script>
    var idpage = 3;
    let element = document.getElementsByClassName("actived");
    console.log(element)
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");
</script>

</html>