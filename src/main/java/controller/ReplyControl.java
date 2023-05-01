package controller;

import dao.CommentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ReplyControl", value = "/reply")
public class ReplyControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int commentId = Integer.parseInt(request.getParameter("commentId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        String reply = request.getParameter("reply");
        CommentDAO commentDao = new CommentDAO();

        try {
            commentDao.addReply(commentId, name, reply);
            response.sendRedirect(request.getContextPath() + "/chiTiet?sanPhamId=" + productId);
        } catch (SQLException e) {
            throw new ServletException("Error adding reply", e);
        }
    }
}
