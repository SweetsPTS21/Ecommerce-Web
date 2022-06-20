package controller;

import dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DetailControl", value = "/detail")
public class DetailControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            if(request.getParameter("productId").matches("\\d+")) {
                int id = Integer.parseInt(request.getParameter("productId"));
                ProductDAO productDAO = new ProductDAO();

                if (productDAO.getProductById(id).getName() != null) {
                    request.setAttribute("product", productDAO.getProductById(id));
                    request.getRequestDispatcher("/detail.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
