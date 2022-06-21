package controller;

import dao.SanPhamDAO;
import dao.SanPhamDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "XoaSanPhamControl", value = "/xoaSanPham")
public class XoaSanPhamControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF8");
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("sanPhamId"));

        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        sanPhamDAO.xoaSanPham(id);

        response.sendRedirect("quanLySanPham");
    }
}
