package controller;

import model.GioHang;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CartControl", value = "/themVaoGioHang")
public class ThemControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<GioHang> gioHang = new ArrayList<>();

        int id = Integer.parseInt(request.getParameter("sanPhamId"));
        GioHang gioHangItem = new GioHang();
        gioHangItem.setId(id);
        gioHangItem.setSoLuongGioHang(1);

        int tongitem = 1;
        ArrayList<GioHang> gioHangItems = (ArrayList<GioHang>) session.getAttribute("cart");

        if (gioHangItems == null) {
            gioHang = new ArrayList<>();
            session.setAttribute("cart", gioHang);
        }
        else {
            gioHang = gioHangItems;
            if(gioHangItems != null) {


                for(GioHang item: gioHangItems) {
                    if(item.getId() == gioHangItem.getId()) {
                        item.setSoLuongGioHang(item.getSoLuongGioHang() + 1);
                        tongitem += 1;
                        session.setAttribute("cart-size", tongitem);
                        response.sendRedirect("/GioHang.jsp");
                        return;
                    }
                }

            }
        }
        gioHang.add(gioHangItem);
        session.setAttribute("cart-size", tongitem);
//        request.getRequestDispatcher("/gioHang.jsp").forward(request, response);

        response.sendRedirect("/GioHang.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
