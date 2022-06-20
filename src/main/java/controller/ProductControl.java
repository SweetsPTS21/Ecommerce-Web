package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductControl", value = "/shop")
public class ProductControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();
        List<Product> list = productDAO.getAllProducts();
        request.setAttribute("list", list);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();
        List<Product> list = productDAO.getAllProducts();
        request.setAttribute("list", list);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}