package controller;

import dao.SanPhamDAO;
import dao.ThanhToanDAO;
import dao.ChiTietDAO;
import model.GioHang;
import model.SanPham;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ThanhToanControl", value = "/checkout")
public class ThanhToanControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int nguoiDungId = 1;

        if(session.getAttribute("nguoiDungId") != null) {
            nguoiDungId = (int) session.getAttribute("nguoiDungId");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        String taikhoan = request.getParameter("ten");
        String sodienthoai = request.getParameter("sodienthoai");
        String diachi = request.getParameter("diachi");

        ThanhToanDAO thanhToanDAO = new ThanhToanDAO();
        ArrayList<GioHang> gioHang = (ArrayList<GioHang>) session.getAttribute("cart");
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        SanPham sanPham = new SanPham();
        int total = 0;
        for(GioHang gioHangItem : gioHang) {
            sanPham = sanPhamDAO.getSanPhamById(gioHangItem.getId());
            total += gioHangItem.getSoLuongGioHang() * sanPham.getGia();
        }
        int orderID = thanhToanDAO.add(nguoiDungId, taikhoan, sodienthoai, diachi, total);
        for(GioHang gioHangItem : gioHang) {
            int quantity = gioHangItem.getSoLuongGioHang();
            int sanPhamId = gioHangItem.getId();
            ChiTietDAO chiTietDAO = new ChiTietDAO();
            chiTietDAO.themChiTiet(orderID,sanPhamId,quantity);
        }
        session.removeAttribute("cart");
        session.removeAttribute("cart-size");
        response.sendRedirect("index.jsp");
    }

}
