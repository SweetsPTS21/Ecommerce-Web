package controller;

import dao.CommentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
