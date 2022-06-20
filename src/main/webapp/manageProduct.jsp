<%--
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : boixi
--%>
<%@ page import="dao.ProductDAO" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDetailDAO" %>
<%@ page import="model.OrderDetail" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý sản phẩm</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="style.css" rel="stylesheet" type="text/css"/>
<body>
<% try {
    int id = Integer.parseInt(session.getAttribute("isAdmin").toString());
    int deleteId = 0;

    if(id != 1 || session.getAttribute("isAdmin") == null) {
        response.sendRedirect("index.jsp");
    } else {
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getAllProducts();
        List<String> listCategory = productDAO.getAllCategory();

%>
<section id="dautrang">
    <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>

    <div>
        <ul id="thanh-dieu-huong">
            <li><a href="index.jsp" id="1"   class="actived">Trang chủ</a></li>
            <li><a href="manageProduct.jsp" id="2"  class="actived">Quản lý sản phẩm</a></li>
            <li><a href="manageOrder.jsp" id="3"  class="actived">Quản lý đơn đặt hàng</a></li>
        </ul>
    </div>
</section>
<section id="cart" class="phan-doan-p1">
    <div id="quan-ly-dau">
        <div class="row">
            <div class="row">
                <h2>Quản lý <b>sản phẩm</b></h2>
            </div>
            <div class="dau-nut">
                <a href="add.jsp" class="but" id="nut2"><span>Thêm mói</span></a>
            </div>
        </div>
    </div>
    <table width="100%">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Ảnh</th>
            <th>Giá</th>
            <th>Sửa/Xóa</th>
        </tr>
        </thead>
        <tbody>
        <% for (Product product : products) { %>
        <tr>
            <td><%=product.getId()%></td>
            <td><%=product.getName()%></td>
            <td>
                <img src="<%=product.getImage()%>">
            </td>
            <td><%=product.getPrice()%> $</td>
            <td>
                <%deleteId = product.getId();%>
                <a href="editProduct?productId=<%=product.getId()%>" class="edit" id="edit"><i class="material-icons" data-toggle="tooltip" title="Sửa">&#xE254;</i></a>
                <a href="#" class="delete" id="delete" onclick="function xacnhan() {
                        if(confirm('Xóa sản phẩm này nhé!!!') == true) {
                        window.location.href='deleteProduct?productId=<%=deleteId%>';
                        }
                        } xacnhan()"><i class="material-icons" data-toggle="tooltip" title="Xóa">&#xE872;</i></a>
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
    var idpage = 2;
    let element = document.getElementsByClassName("actived");
    console.log(element)
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");
</script>

</html>