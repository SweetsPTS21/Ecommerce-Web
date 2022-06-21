package controller;

import dao.SanPhamDAO;
import model.SanPham;
import model.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ThemSanPhamControl", value = "/themSanPham")
public class ThemSanPhamControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            String ten = request.getParameter("ten");
            String anh = request.getParameter("anh");
            int gia = Integer.parseInt(request.getParameter("gia"));
            int soluong = Integer.parseInt(request.getParameter("soluong"));
            String mota = request.getParameter("mota");
            String loai = request.getParameter("loai");

            SanPham sanPham = new SanPham();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            sanPham.setTen(ten);
            sanPham.setAnh(anh);
            sanPham.setGia(gia);
            sanPham.setSoluong(soluong);
            sanPham.setMota(mota);
            sanPham.setLoai(loai);

            sanPhamDAO.themSanPham(sanPham);

            response.sendRedirect("quanLySanPham");
        } catch (NullPointerException | NumberFormatException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
