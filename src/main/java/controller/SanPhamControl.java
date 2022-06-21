package controller;

import dao.SanPhamDAO;
import dao.SanPhamDAO;
import model.SanPham;
import model.SanPham;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SanPhamControl", value = "/cuaHang")
public class SanPhamControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        List<SanPham> list = sanPhamDAO.getTatCaSanPham();
        request.setAttribute("list", list);
        request.getRequestDispatcher("CuaHang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        List<SanPham> list = sanPhamDAO.getTatCaSanPham();
        request.setAttribute("list", list);
        request.getRequestDispatcher("CuaHang.jsp").forward(request, response);
    }
}