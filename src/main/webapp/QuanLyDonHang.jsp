<%@ page import="java.util.List" %>
<%@ page import="dao.ThanhToanDAO" %>
<%@ page import="model.DonDatHang" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý đơn hàng</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
<body>
<% try {
    int id = Integer.parseInt(session.getAttribute("isAdmin").toString());

    if(id != 1 || session.getAttribute("isAdmin") == null) {
        response.sendRedirect("index.jsp");
    } else {
        ThanhToanDAO thanhToanDAO = new ThanhToanDAO();
        List<DonDatHang> donDatHangList = thanhToanDAO.getTatCaDonDatHang();

%>

<section id="dautrang">
    <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>

    <div>
        <ul id="thanh-dieu-huong">
            <li><a href="index.jsp" id="1"   class="actived">Trang chủ</a></li>
            <li><a href="QuanLySanPham.jsp" id="2" class="actived">Quản lý sản phẩm</a></li>
            <li><a href="QuanLyDonHang.jsp" id="3" class="actived">Quản lý đơn đặt hàng</a></li>
        </ul>
    </div>
</section>
<section id="gio-hang" class="phan-doan-p1">
    <div id="quan-ly-dau">
        <div class="hang">
            <h2>Quản lý <b>đơn hàng</b></h2>
        </div>
    </div>
    <table width="100%">
        <thead>
        <tr>
            <th>ID đơn hàng</th>
            <th>ID nguoiDung</th>
            <th>Tên khách hàng</th>
            <th>Số điện thoại</th>
            <th>Địa chỉ</th>
            <th>Tổng tiền</th>
            <th>Ngày đặt</th>
            <th>Trạng thái</th>
        </tr>
        </thead>
        <tbody>
        <% for (DonDatHang donDatHang : donDatHangList) { %>
        <tr>
            <td><%=donDatHang.getId()%></td>
            <td><%=donDatHang.getNguoiDungId()%></td>
            <td><%=donDatHang.getTen()%></td>
            <td><%=donDatHang.getSodienthoai()%></td>
            <td><%=donDatHang.getDiachi()%></td>
            <td><%=donDatHang.getTongTien()%></td>
            <td><%=donDatHang.getNgay()%></td>
            <td>
                <% if(donDatHang.getTrangthai().equalsIgnoreCase("0")) { %>
                <button type="button" class="nut" id="nut2" onclick="function xacnhan() {
                        window.location.href = 'capNhatDonHang?donDatHangId=<%=donDatHang.getId()%>';
                        } xacnhan()">Xác nhận</button>
                <% } else { %>
                <button type="button" class="nut" id="nut4" disabled>Đã duyệt</button>
                <% }%>
                <button type="button" class="nut" id="nut5" onclick="function xoa() {
                        if(confirm('Bạn chắc chắn muốn xóa đơn hàng này!!!')) {
                        window.location.href = 'xoaDonHang?donDatHangId=<%=donDatHang.getId()%>';
                } } xoa();">Xóa</button>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

</section>

<% } } catch(NullPointerException e) {
    e.printStackTrace();
    response.sendRedirect("index.jsp");
} %>
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