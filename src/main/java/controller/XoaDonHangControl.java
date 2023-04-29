package controller;

import dao.ThanhToanDAO;
import dao.ChiTietDAO;
import dao.VNPayDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "XoaDonHangControl", value = "/xoaDonHang")
public class XoaDonHangControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            ThanhToanDAO thanhToanDAO = new ThanhToanDAO();
            ChiTietDAO chiTietDAO = new ChiTietDAO();
            VNPayDAO vnpayDAO = new VNPayDAO();
            int donDatHangId = Integer.parseInt(request.getParameter("donDatHangId"));

            vnpayDAO.deleteVNPay(donDatHangId);
            chiTietDAO.xoaChiTiet(donDatHangId);
            thanhToanDAO.xoaDonHang(donDatHangId);
            response.sendRedirect("quanLyDonHang");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
