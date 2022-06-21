package controller;

import dao.NguoiDungDAO;
import model.NguoiDung;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DangNhapControl", value = "/dangNhap")
public class DangNhapControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String matkhau = request.getParameter("matkhau");
        String email = request.getParameter("email");
        int thatbai = 0;
        NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
        NguoiDung nguoiDung = nguoiDungDAO.getNguoiDungByEmail(email);

        if (nguoiDungDAO.kiemTraNguoiDung(email, matkhau) == true) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("tenNguoiDung", nguoiDungDAO.getTaiKhoan());
            session.setAttribute("nguoiDungId", nguoiDung.getId());
            session.setAttribute("isAdmin", nguoiDung.getVaitro());
            if(request.getAttribute("xacthuc") != null) {
                request.removeAttribute("xacthuc");
            }
            response.sendRedirect("index.jsp");
        }
        else {
            thatbai = 1;
            request.setAttribute("xacthuc", thatbai);
            request.getRequestDispatcher("DangNhap.jsp").forward(request, response);
        }
    }
}
