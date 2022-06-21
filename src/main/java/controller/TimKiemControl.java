package controller;

import dao.SanPhamDAO;
import dao.SanPhamDAO;
import model.SanPham;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TimKiemControl", value = "/timKiem")
public class TimKiemControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String tukhoa = request.getParameter("tukhoa");
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        List<SanPham> list = sanPhamDAO.timSanPham(tukhoa);
        request.setAttribute("list", list);
        request.setAttribute("tukhoa", tukhoa);
        request.getRequestDispatcher("CuaHang.jsp").forward(request, response);
    }
}