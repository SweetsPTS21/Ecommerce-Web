package controller;

import dao.SanPhamDAO;
import model.SanPham;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChiTietDonHangControl", value = "/chiTietDonHang")
public class ChiTietDonHangControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String oid = request.getParameter("oid");
        SanPhamDAO productDAO = new SanPhamDAO();
        List<SanPham> products = productDAO.getProductByOrderID(oid);
        request.setAttribute("products",products);
        request.getRequestDispatcher("ChiTietDonHang.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String oid = request.getParameter("oid");
        SanPhamDAO productDAO = new SanPhamDAO();
        List<SanPham> products = productDAO.getProductByOrderID(oid);
        request.setAttribute("products",products);
        request.getRequestDispatcher("ChiTietDonHang.jsp").forward(request,response);
    }
}
