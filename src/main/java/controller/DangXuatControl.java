package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DangXuatControl", value = "/dangXuat")
public class DangXuatControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("email");
        session.removeAttribute("tenNguoiDung");
        session.removeAttribute("nguoiDungId");
        session.removeAttribute("isAdmin");
        session.removeAttribute("cart");
        session.removeAttribute("cart-size");
        response.sendRedirect("index.jsp");
    }
}
