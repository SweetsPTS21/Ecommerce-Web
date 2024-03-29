<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
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
        <div class="trang-dang-ky">
            <div class="bao-quanh">
                <h1>Đăng ký</h1>
                <form method="post" action="/dangKy" accept-charset="UTF-8">
                    <input type="email" name="email" placeholder="Email"><br>
                    <input type="text" name="taikhoan" placeholder="Tên"><br>
                    <input type="password" name="matkhau" placeholder="Mật khẩu"><br>
                    <input type="password" name="re_matkhau" placeholder="Nhập lại mật khẩu"><br>
                    <input type="submit" class="but" value="Đăng ký" >
                </form>
                    <% String error = (String) session.getAttribute("error"); %>
                    <% if (error != null) { %>
                    <div class="loi">
                        <%= error %>
                    </div>
                    <% } %>
            </div>
        </div>
    </div>
</section>

<%@include file="ChanTrang.jsp" %>
</body>
<script>

</script>

</html>