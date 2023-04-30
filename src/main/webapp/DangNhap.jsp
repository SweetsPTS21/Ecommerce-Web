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


<section id="trang-chu">
    <div class="chieu-rong-lon-nhat">
        <div class="noi-dung-trang-chu">
            <h3>Quản lý <br>Tài khoản</h3>
            <p>Đăng nhập để lưu những món hàng bạn yêu thích và
                địa chỉ giao hàng thường xuyên của bạn.</p>
        </div>
        <div class="dang-nhap">
            <div class="bao-quanh">
                <h1>Đăng nhập</h1>
                <%if(request.getAttribute("xacthuc") != null && (int) request.getAttribute("xacthuc") == 1 ) {%>
                <h3 style="color: red">Email/mật khẩu không đúng</h3>
                <% request.removeAttribute("xacthuc"); } else  {%>
                <% } %>
                <form action="/dangNhap" method="post">
                    <input type="email" name="email" placeholder="Email"><br>
                    <input type="password" name="matkhau" placeholder="Mật khẩu"><br>
                    <input type="submit" class="nut" value="Đăng nhập" >
                </form>
                <button type="text" onclick="window.location.href='https://accounts.google.com/o/oauth2/auth?scope=email' +
                 '&redirect_uri=https://web-team-ptit.herokuapp.com/login-google&response_type=code&client_id=477256026930-5hdsip1i8lvklgf77qek3jqnep0v9d2j.apps.googleusercontent.com' +
                  '&approval_prompt=force'" class="nut nut-google">
                    <i class="fab fa-google"></i>
                    Đăng nhập với Google
                </button>
                <p class="chua-dang-ky">
                    <a href="DangKy.jsp">Đăng ký ngay</a>
                </p>
            </div>
        </div>
    </div>
</section>

<%@include file="ChanTrang.jsp" %>
</body>

</html>

