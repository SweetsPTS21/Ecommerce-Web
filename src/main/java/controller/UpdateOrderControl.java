package controller;

import dao.CheckoutDAO;
import javafx.util.Pair;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "UpdateOrdersControl", value = "/updateOrder")
public class UpdateOrderControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            CheckoutDAO checkoutDAO = new CheckoutDAO();
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            checkoutDAO.updateStatus(orderId, 1);
            response.sendRedirect("manageOrder");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
