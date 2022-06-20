package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateProductControl", value = "/updateProduct")
public class UpdateProductControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String desciption = request.getParameter("description");
            String category = request.getParameter("category");

            ProductDAO productDAO = new ProductDAO();
            Product product = new Product();
            product.setId(id);
            product.setName(name);
            product.setImage(image);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setDescription(desciption);
            product.setCategory(category);

            productDAO.updateProduct(product);
            response.sendRedirect("manageProduct");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
