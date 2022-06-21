package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "QuanlyControl", value = "/quanLySanPham")
public class QuanlyControl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        try {
            int id = Integer.parseInt(session.getAttribute("isAdmin").toString());
            if(id != 1 || session.getAttribute("isAdmin") == null) {
                response.sendRedirect("/index.jsp");
            }
            else {
                response.sendRedirect("/QuanLySanPham.jsp");
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }


    }
}
