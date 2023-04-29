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

<section id="chitiet-lienlac" class="phan-doan-p1">
    <div class="chi-tiet">
        <span>LIÊN LẠC VỚI CHÚNG TÔI</span>
        <h2>Ghé thăm chúng tôi</h2>
        <h3>Văn phòng </h3>
        <div>
            <li>
                <i class="fal fa-map"></i>
                <p>Học viện Công nghệ Bưu Chính Viễn Thông </p>
            </li>
            <li>
                <i class="far fa-envelope"></i>
                <p>youngbach.315@gmail.com </p>
            </li>
            <li>
                <i class="fas fa-phone-alt"></i>
                <p>0986853388</p>
            </li>
        </div>
    </div>

    <div id="ban-do">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1566.2919878305736!2d105.78595569968203!3d20.980963078103887!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135accdd8a1ad71%3A0xa2f9b16036648187!2zSOG7jWMgdmnhu4duIEPDtG5nIG5naOG7hyBCxrB1IGNow61uaCB2aeG7hW4gdGjDtG5n!5e0!3m2!1svi!2s!4v1655601616661!5m2!1svi!2s" width="600" height="450" style="border: 0;"
                allowfullscreen="" loading="lazy"></iframe>
    </div>

</section>
<section id="form-chi-tiet">
    <form method="post" action="/lienHe">
        <h2>Hãy để lại email của bạn tại đây</h2>
        <input type="text" name ="emailName"placeholder="Tên của bạn">
        <input type="text" name ="email" placeholder="E-mail">
        <button class="nut-mail">Xác nhận</button>
    </form>
</section>
<%@include file="ChanTrang.jsp" %>
</body>
<script>
    var idpage = 4;
    let element = document.getElementsByClassName("actived");
    console.log(element)
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");
</script>
</html>