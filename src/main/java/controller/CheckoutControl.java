package controller;

import dao.CheckoutDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import model.Cart;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CheckoutControl", value = "/checkout")
public class CheckoutControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int userID = (int) session.getAttribute("userID");

        String username = request.getParameter("name");
        String number = request.getParameter("number");
        String add = request.getParameter("add");

        CheckoutDAO checkoutDAO = new CheckoutDAO();
        ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
        ProductDAO productDAO = new ProductDAO();
        Product product = new Product();
        int total = 0;
        for(Cart cartItem: cart) {
            product = productDAO.getProductById(cartItem.getId());
            total += cartItem.getCartQuantity() * product.getPrice();
        }
        int orderID = checkoutDAO.add(String.valueOf(userID),username,number,add, String.valueOf(total));
        for(Cart cartItem: cart) {
            int quantity = cartItem.getCartQuantity();
            int productID = cartItem.getId();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            orderDetailDAO.add(orderID,productID,quantity);
        }
        session.removeAttribute("cart");
        session.removeAttribute("cart-size");
        response.sendRedirect("index.jsp");
    }

}
