package controller;

import dao.SanPhamDAO;
import model.SanPham;
import model.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SuaSanPhamControl", value = "/suaSanPham")
public class SuaSanPhamControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("sanPhamId"));
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        SanPham sanPham = sanPhamDAO.getSanPhamById(id);
        List<String> listLoai = sanPhamDAO.getTatCaLoai();
        session.setAttribute("sanpham", sanPham);
        session.setAttribute("listLoai", listLoai);
        response.sendRedirect("/SuaSanPham.jsp");
    }
}
