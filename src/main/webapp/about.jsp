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
<%@include file="header.jsp" %>
<section id="about-head" class="phan-doan-p1">
        <img src="img/about/a6.jpg" alt="">
        <div>
            <h2>Chúng Tôi Là Ai?</h2>
            <p>Team 7 - Lập trình Web PTIT.</p>
            <br><br>
        </div>
    </section>
<%@include file="footer.jsp" %>
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