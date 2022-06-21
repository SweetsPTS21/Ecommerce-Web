package controller;

import model.GioHang;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ThemSoLuongControl", value = "/themSoLuong")
public class ThemSoLuongControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<GioHang> gioHang = new ArrayList<>();

        int addId = Integer.parseInt(request.getParameter("themSanPhamId"));
        GioHang gioHangItem = new GioHang();
        gioHangItem.setId(addId);

        ArrayList<GioHang> gioHangItems = (ArrayList<GioHang>) session.getAttribute("cart");
        gioHang = gioHangItems;
        int tongitem = 0;
        for(GioHang item: gioHangItems) {
            tongitem += item.getSoLuongGioHang();
        }
        for (GioHang item : gioHangItems) {
            if (item.getId() == gioHangItem.getId()) {
                item.setSoLuongGioHang(item.getSoLuongGioHang() + 1);
                tongitem += 1;
                session.setAttribute("cart-size", tongitem);
                response.sendRedirect("/GioHang.jsp");
                return;
            }
        }
        gioHang.add(gioHangItem);

        session.setAttribute("cart-size", tongitem);
        response.sendRedirect("/GioHang.jsp");



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
