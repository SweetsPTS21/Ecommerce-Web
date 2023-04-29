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
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Ecommerce Website</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="css/jumbotron-narrow.css" rel="stylesheet">
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
<% }
    if(request.getAttribute("daDatHang") != null) { %>
<script>
    if(confirm('Đặt hàng thành công!!!')) {
        window.location.href = 'GioHang.jsp';
    }
</script>
<% } %>

<%@include file="DauTrang.jsp" %>

<section id="gio-hang" class="phan-doan-p1">
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
                    <a href="/xoaSoLuong?xoaSanPhamId=<%=sanPham.getId()%>" class="so-luong"><span class="tru">-</span></a>
                    <input type="text" value="<%=gioHangItem.getSoLuongGioHang()%>"/>
                    <a href="/themSoLuong?themSanPhamId=<%=sanPham.getId()%>" class="so-luong"><span class="cong">+</span></a>
                </div>
            </td>
            <td>$<%= totalPrice %></td>
        </tr>
        <% } } %>
        </tbody>
    </table>
</section>

<section id="them-gio-hang" class="phan-doan-p1">
    <div id="tong-tien">
        <h3>Tổng hoá đơn</h3>
        <table>
            <tr>
                <td>Tổng giỏ hàng</td>
                <td>$<%= total %></td>
            </tr>
            <tr>
                <td>Phí vận chuyển</td>
                <td class="van-chuyen">$0</td>
            </tr>
            <tr>
                <td><strong>Tổng phải thanh toán</strong></td>
                <td class="tong"><strong>$<%= total %></strong></td>
            </tr>
        </table>
    </div>
</section>
<section class="thong-tin">
    <div class="row">
    <div class="col-md-3">
        <h3>Thông tin giao hàng</h3>
        <% if(session.getAttribute("cart-size") == null ||session.getAttribute("cart-size").toString().equalsIgnoreCase("0") ) {  %>
        <form action="index.jsp" method="post" id="formThanhToan" accept-charset="UTF-8">
            <% } else {%>
        <form action="/thanhToan" method="post" id="formThanhToan"  accept-charset="UTF-8">
            <% } %>
            <div class="form-group">
                <label>Họ và tên</label>
                <input required  class="form-control" type="text" name="ten" placeholder = "Họ và tên">
            </div>
            <div class="form-group">
                <label>Số điện thoại</label>
                <input required class="form-control" type="text" name="sodienthoai" placeholder = "Số điện thoại">
            </div>

            <div class="form-group">
                <label>Tỉnh</label>
                <select class="form-select" name="ten_tinh" id="tinh" aria-label="Mặc định"></select>
            </div>
            <div class="form-group">
                <label>Huyện</label>
                <select class="form-select" name="ten_huyen" id="huyen" aria-label="Mặc định"></select>
            </div>
            <div class="form-group">
                <label>Xã</label>
                <select class="form-select" name="ten_xa" id="xa" aria-label="Mặc định"></select>
            </div>
            <div class="form-group">
                <label>Địa chỉ cụ thể</label>
                <input required class="form-control" type="text" name="diachi" placeholder = "Địa chỉ cụ thể">
            </div>
            <div class="form-group">
                <label>Amount</label>
                <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="<%=total * 23000%>" disabled/>
            </div>
            <input type="submit" id="COD" class="btn btn-success" value="Đặt hàng" >
            <h4>Hoặc</h4>
            <button type="button" class="btn btn-success" id="VNPay">Thanh toán bằng VNPay</button>
        </form>

    </div>
    </div>
    <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#VNPay").click(function () {
                $("#COD").click();
                const amount = $("input[name='amount']").val();
                const postData = "amount="+ amount + "&bankCode=&language=vn";
                const submitUrl = "vnpayAjax";
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                                console.log(x.data);
                            } else {
                                location.href = x.data;
                                console.log(x.data);
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                console.log(postData);
                return false;

            });
        });
    </script>
</section>



<%@include file="ChanTrang.jsp" %>
<script src="js/script.js"></script>
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



