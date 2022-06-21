package controller;
import dao.NguoiDungDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static AES.AES.maHoa;

@WebServlet(name = "DangKyControl", value = "/dangKy")
public class DangKyControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String taikhoan = request.getParameter("taikhoan");
        String matkhau = request.getParameter("matkhau");
        String re_matkhau = request.getParameter("re_matkhau");
        String email = request.getParameter("email");

        String reg = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";

        HttpSession session = request.getSession();
        if (taikhoan.isEmpty() || matkhau.isEmpty() || email.isEmpty() || re_matkhau.isEmpty()) {
            session.setAttribute("error", "Dữ liệu không được để trống");
            request.getRequestDispatcher("/DangKy.jsp").forward(request, response);

        }
        else if (!matkhau.equals(re_matkhau)) {
            session.setAttribute("error", "Mật khẩu không khớp");
            request.getRequestDispatcher("/DangKy.jsp").forward(request, response);

        }
        else {
            if(!matkhau.matches(reg)){
                session.setAttribute("error", "Mật khẩu phải có ít nhất 8 ký tự, có ít nhất 1 ký tự in hoa, 1 ký tự in thường, 1 ký tự đặc biệt và 1 số và không được có khoảng trắng");
                request.getRequestDispatcher("/DangKy.jsp").forward(request, response);
            }
            else {
                NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
                if (nguoiDungDAO.kiemTraEmail(email)) {
                    session.setAttribute("error", "Email đã tồn tại");
                    request.getRequestDispatcher("/DangKy.jsp").forward(request, response);

                }
                else {
                    nguoiDungDAO.themNguoiDung(taikhoan, email, maHoa(matkhau,"WeBteaM07"));
                    session.setAttribute("success", "Đăng ký thành công");
                    response.sendRedirect("/DangNhap.jsp");
                }
            }
        }
    }
}
