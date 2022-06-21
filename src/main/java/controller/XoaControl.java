package controller;

import model.GioHang;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "XoaControl", value = "/xoa")
public class XoaControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("sanPhamId"));
        System.out.println(id);
        HttpSession session = request.getSession();
        ArrayList<GioHang> gioHang = (ArrayList<GioHang>) session.getAttribute("cart");

        for (int i = 0; i < gioHang.size(); i++) {
            if (gioHang.get(i).getId() == id) {
                gioHang.remove(i);
            }
        }

        session.setAttribute("cart", gioHang);
        int tongitem = 0;
        for(GioHang item: gioHang) {
            tongitem += item.getSoLuongGioHang();
        }
        session.setAttribute("cart-size", tongitem);
        response.sendRedirect("/GioHang.jsp");
    }
}
