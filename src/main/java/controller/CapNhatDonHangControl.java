package controller;

import dao.ThanhToanDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "CapNhatDonHangControl", value = "/capNhatDonHang")
public class CapNhatDonHangControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            ThanhToanDAO thanhToanDAO = new ThanhToanDAO();
            int donDatHangId = Integer.parseInt(request.getParameter("donDatHangId"));

            thanhToanDAO.capNhatTrangThai(donDatHangId, 1);
            response.sendRedirect("quanLyDonHang");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
