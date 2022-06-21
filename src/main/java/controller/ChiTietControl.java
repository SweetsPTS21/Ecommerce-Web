package controller;

import dao.SanPhamDAO;
import dao.SanPhamDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChiTietControl", value = "/chiTiet")
public class ChiTietControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            if(request.getParameter("sanPhamId").matches("\\d+")) {
                int id = Integer.parseInt(request.getParameter("sanPhamId"));
                SanPhamDAO sanPhamDAO = new SanPhamDAO();

                if (sanPhamDAO.getSanPhamById(id).getTen() != null) {
                    request.setAttribute("sanpham", sanPhamDAO.getSanPhamById(id));
                    request.getRequestDispatcher("/ChiTiet.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
