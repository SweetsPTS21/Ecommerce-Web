package controller;

import model.GioHang;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "XoaSoLuongControl", value = "/xoaSoLuong")
public class XoaSoLuongControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        int removeId = Integer.parseInt(request.getParameter("xoaSanPhamId"));
        GioHang gioHangItem = new GioHang();
        gioHangItem.setId(removeId);
        int tongitem = 0;

        ArrayList<GioHang> gioHangItems = (ArrayList<GioHang>) session.getAttribute("cart");
        for(GioHang item: gioHangItems) {
            tongitem += item.getSoLuongGioHang();
        }
        for (GioHang item : gioHangItems) {
            if (item.getId() == gioHangItem.getId()) {
                if(item.getSoLuongGioHang() > 1) {
                    item.setSoLuongGioHang(item.getSoLuongGioHang() - 1);
                    tongitem -= 1;
                    session.setAttribute("cart-size", tongitem);
                    response.sendRedirect("/GioHang.jsp");
                    return;
                }
                else {
                    gioHangItems.remove(item);
                    session.setAttribute("cart", gioHangItems);
                    session.setAttribute("cart-size", gioHangItems.size());
                    response.sendRedirect("/GioHang.jsp");
                    return;
                }
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
