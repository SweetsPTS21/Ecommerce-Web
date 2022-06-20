package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditProductControl", value = "/editProduct")
public class EditProductControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("productId"));
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductById(id);
        List<String> listCategory = productDAO.getAllCategory();
        session.setAttribute("product", product);
        session.setAttribute("listCategory", listCategory);
        response.sendRedirect("/edit.jsp");
    }
}
