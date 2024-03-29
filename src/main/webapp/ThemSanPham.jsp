<%@ page import="java.util.List" %>
<%@ page import="dao.SanPhamDAO" %>
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
  <link href="css/Sua.css" rel="stylesheet" type="text/css"/>

<body>
<% try {
  int id = Integer.parseInt(session.getAttribute("isAdmin").toString());
  if(id != 1 || session.getAttribute("isAdmin") == null) {
    response.sendRedirect("index.jsp");
  } else {

%>
<div class="tieu-de">
  <h2>Thêm <b>sản phẩm</b></h2>
</div>
<div id="sua-san-pham">
  <%  SanPhamDAO sanPhamDAO = new SanPhamDAO();
    List<String> listLoai = sanPhamDAO.getTatCaLoai(); %>
  <form action="themSanPham" method="post" class="form-sua">
    <div class="dau-form">
      <h4 class="tieu-de-form">Thêm sản phẩm mới</h4>
      <button onclick="window.location.href = 'quanLySanPham?isAdmin=1';" type="button" aria-hidden="true">&times;</button>
    </div>
    <div class="than-form">
      <div class="nhom-form">
        <label><p>Tên</p></label>
        <input name="ten" type="text" required>
      </div>
      <div class="nhom-form">
        <label><p>Ảnh</p></label>
        <input name="anh" type="text" placeholder="Nhập link ảnh" required>
      </div>
      <div class="nhom-form">
        <label><p>Giá($)</p></label>
        <input name="gia" type="text" required>
      </div>
      <div class="nhom-form">
        <label><p>Số lượng</p></label>
        <input name="soluong" required>
      </div>
      <div class="nhom-form">
        <label><p>Mô tả</p></label>
        <textarea name="mota" class="form-mo-ta" required></textarea>
      </div>
      <div class="chon-form">
        <label>Danh mục</label>
        <select name="loai" aria-label="Mặc định">
          <% for(String loai : listLoai) {%>
          <option><%=loai%></option>
          <% } %>
        </select>
      </div>

    </div>
    <div class="chan-form">
      <input type="submit" class="submit" value="Thêm">

    </div>
  </form>
</div>
<script src="js/manager.js" type="text/javascript"></script>
<% } } catch(NullPointerException e) {
  e.printStackTrace();
  response.sendRedirect("index.jsp");
} %>
</body>
</html>