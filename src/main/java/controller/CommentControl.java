package controller;

import dao.CommentDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import model.Comment;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CommentControl", value = "/comment")
public class CommentControl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        String comment = request.getParameter("comment");
        CommentDAO commentDao = new CommentDAO();

        try {
            commentDao.addComment(productId, name, comment);
            response.sendRedirect(request.getContextPath() + "/chiTiet?sanPhamId=" + productId);
        } catch (SQLException e) {
            throw new ServletException("Error adding comment", e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int productId = Integer.parseInt(request.getParameter("id"));
        CommentDAO commentDao = new CommentDAO();

        try {
            List<Comment> comments = commentDao.getCommentsForProduct(productId);
            request.setAttribute("comments", comments);
            request.getRequestDispatcher("/comment.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error getting comments", e);
        }
    }
}
