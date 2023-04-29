package GoogleLogin;

import dao.GoogleUserDAO;
import dao.NguoiDungDAO;
import model.NguoiDung;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginGoogleControl", value = "/login-google")
public class LoginGoogleControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("DangNhap.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GoogleUser googleUser = GoogleUtils.getUserInfo(accessToken);
            GoogleUserDAO googleUserDAO = new GoogleUserDAO();

            if (!googleUserDAO.checkGoogleUser(googleUser.getId())) {
                googleUserDAO.insertGoogleUser(googleUser.getId(), googleUser.getName(), googleUser.getEmail());
            }
            NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
            NguoiDung nguoiDung = nguoiDungDAO.loginWithGoogle(googleUser.getId());

            if (nguoiDung != null) {
                session.setAttribute("email", googleUser.getEmail());
                session.setAttribute("tenNguoiDung", googleUser.getName());
                session.setAttribute("nguoiDungId", nguoiDung.getId());
                session.setAttribute("isAdmin", nguoiDung.getVaitro());
            }
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
