package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/search")
public class SearchControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txtSearch");
        ProductDAO productDAO = new ProductDAO();
        List<Product> list = productDAO.searchProduct(txtSearch);
        request.setAttribute("list", list);
        request.setAttribute("txtSearch", txtSearch);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}