package controller;

import dao.SanPhamDAO;
import model.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CapNhatSanPhamControl", value = "/capNhatSanPham")
public class CapNhatSanPhamControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            int id = Integer.parseInt(request.getParameter("id"));
            String ten = request.getParameter("ten");
            String anh = request.getParameter("anh");
            int gia = Integer.parseInt(request.getParameter("gia"));
            int soluong = Integer.parseInt(request.getParameter("soluong"));
            String mota = request.getParameter("mota");
            String loai = request.getParameter("loai");

            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            SanPham sanPham = new SanPham();
            sanPham.setId(id);
            sanPham.setTen(ten);
            sanPham.setAnh(anh);
            sanPham.setGia(gia);
            sanPham.setSoluong(soluong);
            sanPham.setMota(mota);
            sanPham.setLoai(loai);

            sanPhamDAO.capNhatSanPham(sanPham);
            response.sendRedirect("quanLySanPham");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
