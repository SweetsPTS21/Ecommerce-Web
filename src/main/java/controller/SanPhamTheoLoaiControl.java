package controller;

import dao.SanPhamDAO;
import model.SanPham;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SanPhamTheoLoaiControl", value = "/loaiSanPham")
public class SanPhamTheoLoaiControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SanPhamDAO productDAO = new SanPhamDAO();
        String loaiSanPham = request.getParameter("loai");
        List<SanPham> list = productDAO.timSanPhamTheoLoai(loaiSanPham);
        request.setAttribute("list", list);
        request.getRequestDispatcher("CuaHang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SanPhamDAO productDAO = new SanPhamDAO();
        String loaiSanPham = request.getParameter("loai");
        List<SanPham> list = productDAO.timSanPhamTheoLoai(loaiSanPham);
        request.setAttribute("list", list);
        request.getRequestDispatcher("CuaHang.jsp").forward(request, response);
    }
}
