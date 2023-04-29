package controller;

import dao.SanPhamDAO;
import dao.ThanhToanDAO;
import dao.ChiTietDAO;
import model.GioHang;
import model.SanPham;
import ultilities.Tags;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ThanhToanControl", value = "/thanhToan")
public class ThanhToanControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        try {
            int nguoiDungId = 1;
            nguoiDungId = (int) session.getAttribute("nguoiDungId");

            String taikhoan = request.getParameter("ten");
            String sodienthoai = request.getParameter("sodienthoai");
            String diachi = request.getParameter("diachi");

            String tinh = request.getParameter("ten_tinh");
            String huyen = request.getParameter("ten_huyen");
            String xa = request.getParameter("ten_xa");

            diachi = diachi + ", " + xa + ", " + huyen + ", " + tinh;

            ThanhToanDAO thanhToanDAO = new ThanhToanDAO();
            ArrayList<GioHang> gioHang = (ArrayList<GioHang>) session.getAttribute("cart");
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            SanPham sanPham = new SanPham();
            int total = 0;
            for (GioHang gioHangItem : gioHang) {
                sanPham = sanPhamDAO.getSanPhamById(gioHangItem.getId());
                total += gioHangItem.getSoLuongGioHang() * sanPham.getGia();
            }
            int orderID = thanhToanDAO.themDonDatHang(nguoiDungId, taikhoan, sodienthoai, diachi, total);
            Tags.setOrderId(orderID);

            for (GioHang gioHangItem : gioHang) {
                int quantity = gioHangItem.getSoLuongGioHang();
                int sanPhamId = gioHangItem.getId();
                ChiTietDAO chiTietDAO = new ChiTietDAO();
                chiTietDAO.themChiTiet(orderID, sanPhamId, quantity);
            }
            session.removeAttribute("cart");
            session.removeAttribute("cart-size");

            request.setAttribute("daDatHang", 1);
            request.getRequestDispatcher("GioHang.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("chuaDangNhap", 1);
            request.getRequestDispatcher("GioHang.jsp").forward(request, response);
            e.printStackTrace();
        }
    }

}
