<%@ page import="model.GioHang" %>
<%@ page import="model.SanPham" %>
<%@ page import="dao.SanPhamDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.SanPhamDAO" %>
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
<%
    ArrayList<GioHang> gioHang = (ArrayList<GioHang>) session.getAttribute("cart");
    SanPhamDAO sanPhamDAO = new SanPhamDAO();
    SanPham sanPham = new SanPham();
    int total = 0;
    int ship = 0;
    int temp = 0;
%>
<%@include file="header.jsp" %>


<section id="cart" class="phan-doan-p1">
    <table width="100%">
        <thead>
        <tr>
            <td>Xoá</td>
            <td>Ảnh</td>
            <td>Sản phẩm</td>
            <td>Giá</td>
            <td>Số lượng</td>
            <td>Tổng tiền</td>
        </tr>
        </thead>
        <tbody>
        <% if(gioHang != null) {%>
        <% for(GioHang gioHangItem : gioHang) {
            sanPham = sanPhamDAO.getSanPhamById(gioHangItem.getId());
            int totalPrice = gioHangItem.getSoLuongGioHang() * sanPham.getGia();
            total += totalPrice;
        %>
        <tr>
            <td><a href="/delete?sanPhamId=<%=sanPham.getId()%>"><i class="far fa-times-circle"></i></a></td>
            <td><img src="<%= sanPham.getAnh() %>" alt=""></td>
            <td><%= sanPham.getTen() %></td>
            <td>$<%= sanPham.getGia() %></td>
            <td>
                <div class="number">
                    <a href="/removequantity?xoaSanPhamId=<%=sanPham.getId()%>" class="quantity"><span class="minus">-</span></a>
                    <input type="text" value="<%=gioHangItem.getSoLuongGioHang()%>"/>
                    <a href="/addquantity?themSanPhamId=<%=sanPham.getId()%>" class="quantity"><span class="plus">+</span></a>
                </div>
            </td>
            <td>$<%= totalPrice %></td>
        </tr>
        <% } } %>
        </tbody>
    </table>
</section>

<section id="cart-add" class="phan-doan-p1">
    <div id="subtotal">
        <h3>Tổng hoá đơn</h3>
        <table>
            <tr>
                <td>Tổng giỏ hàng</td>
                <td>$<%= total %></td>
            </tr>
            <tr>
                <td>Phí vận chuyển</td>
                <td class="ship">$0</td>
            </tr>
            <tr>
                <td><strong>Tổng phải thanh toán</strong></td>
                <td class="total"><strong>$<%= total %></strong></td>
            </tr>
        </table>
    </div>
</section>
<section class="thong-tin">
    <div class="form-thong-tin">
        <form action="/checkout" method="post" accept-charset="UTF-8">
            <input required type="text"   name="ten" placeholder = "Họ và tên">
            <input required type="text"   name="sodienthoai" placeholder = "Số điện thoại">
            <input required type="text"   name="diachi" placeholder = "Địa chỉ">
            <input type="submit" class="but" value="Thanh toán" >
        </form>
    </div>

</section>


<%@include file="footer.jsp" %>
<script src="script.js"></script>
</body>

<script>
    var idpage = 5;
    let element = document.getElementsByClassName("actived");
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");


    var ship = document.getElementsByClassName("ship");
    var total = document.getElementsByClassName("total");
    var temp = 0;
    async function getData() {
        let apiURL = 'https://api.openweathermap.org/data/2.5/weather?q=ha noi&appid=7c186e6ad2a59dc9c66cfb11b00cb3cc';
        let data = await fetch(apiURL).then(res => res.json())

        temp = (data.main.feels_like - 273.15).toFixed(0)
        if(temp < 25) {
            ship[0].innerHTML = "$0";
        }
        else {

            ship[0].innerHTML = "$20";
            var totalPrice = <%= total %> + 20;
            total[0].innerHTML = "$" + totalPrice;
        }
    }
    getData()




</script>
</html>



