<%@ page import="model.GioHang" %>
<%@ page import="model.SanPham" %>
<%@ page import="dao.SanPhamDAO" %>
<%@ page import="java.util.ArrayList" %>
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
    String tinh = "";
    String huyen = "";
    String xa = "";
%>

<%if(request.getAttribute("chuaDangNhap") != null) { %>
<script>
    if(confirm('Hãy đăng nhập để thanh toán!!!')) {
        window.location.href = 'DangNhap.jsp';
    }
</script>
<% }%>

<%@include file="DauTrang.jsp" %>

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
            <td><a href="/xoa?sanPhamId=<%=sanPham.getId()%>"><i class="far fa-times-circle"></i></a></td>
            <td><img src="<%= sanPham.getAnh() %>" alt=""></td>
            <td><%= sanPham.getTen() %></td>
            <td>$<%= sanPham.getGia() %></td>
            <td>
                <div class="number">
                    <a href="/xoaSoLuong?xoaSanPhamId=<%=sanPham.getId()%>" class="quantity"><span class="minus">-</span></a>
                    <input type="text" value="<%=gioHangItem.getSoLuongGioHang()%>"/>
                    <a href="/themSoLuong?themSanPhamId=<%=sanPham.getId()%>" class="quantity"><span class="plus">+</span></a>
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
        <% if(session.getAttribute("cart-size") == null ||session.getAttribute("cart-size").toString().equalsIgnoreCase("0") ) {  %>
        <form action="index.jsp" method="post" accept-charset="UTF-8">
            <% } else {%>
        <form action="/thanhToan" method="post" accept-charset="UTF-8">
            <% } %>
            <input required type="text"   name="ten" placeholder = "Họ và tên">
            <input required type="text"   name="sodienthoai" placeholder = "Số điện thoại">
            <div class="province-select">
                <select name="ten_tinh" id="tinh">
                </select>

                <select name="ten_huyen" id="huyen">
                </select>

                <select name="ten_xa" id="xa">
                </select>
            </div>
            <input required type="text"   name="diachi" placeholder = "Địa chỉ cụ thể">
            <input type="submit" class="but" value="Thanh toán" >
        </form>
    </div>

</section>


<%@include file="ChanTrang.jsp" %>
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

    var tinh = document.getElementById('tinh');
    var huyen = document.getElementById('huyen');
    var xa = document.getElementById('xa');
    var data
    var tinh_arr = [];
    var huyen_arr = [];
    for (let i = 0; i < 100; i++) {
        huyen_arr[i] = new Array(100);
    }
    var xa_arr = [];
    for (let i = 0; i < 100; i++) {
        xa_arr[i] = new Array(100);
    }
    for (let i = 0; i < 100; i++) {
        for (let j = 0; j < 100; j++) {
            xa_arr[i][j] = new Array(100);
        }
    }
    async function tinhss() {
        let apiURL = `https://provinces.open-api.vn/api/?depth=3`
        data = await fetch(apiURL).then(res => res.json())
        for (let i = 0; i < data.length; i++) {
            let option = document.createElement('option');
            option.value = data[i].name;
            option.innerText = data[i].name;
            tinh.appendChild(option);
            tinh_arr.push(data[i].name)
        }
        tinh.addEventListener("click", function () {
            let tinh_code = tinh.value;
            for (let i = 0; i < data.length; i++) {
                if (data[i].name == tinh_code) {
                    let huyen = document.getElementById('huyen');
                    huyen.innerHTML = '';
                    xa.innerHTML = '';
                    for (let j = 0; j < data[i].districts.length; j++) {
                        let option = document.createElement('option');
                        option.value = data[i].districts[j].name;
                        option.innerText = data[i].districts[j].name;
                        huyen.appendChild(option);
                        huyen_arr[i][j] = data[i].districts[j].name;
                    }
                }
            }
        })
        huyen.addEventListener("click", function () {
            let huyen_code = huyen.value;
            for (let i = 0; i < data.length; i++) {
                for (let j = 0; j < data[i].districts.length; j++) {
                    if (data[i].districts[j].name == huyen_code) {
                        let xa = document.getElementById('xa');
                        xa.innerHTML = '';
                        for (let k = 0; k < data[i].districts[j].wards.length; k++) {
                            let option = document.createElement('option');
                            option.value = data[i].districts[j].wards[k].name;
                            option.innerText = data[i].districts[j].wards[k].name;
                            xa.appendChild(option);
                            xa_arr[i][j][k] = data[i].districts[j].wards[k].name;
                        }
                    }
                }
            }
        })
    }
    tinhss()


</script>
</html>



