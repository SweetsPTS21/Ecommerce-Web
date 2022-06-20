package controller;

import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

import static java.lang.System.out;

@WebServlet(name = "CartControl", value = "/add-to-cart")
public class AddControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Cart> cart = new ArrayList<>();

        int id = Integer.parseInt(request.getParameter("productId"));
        Cart cartItem = new Cart();
        cartItem.setId(id);
        cartItem.setCartQuantity(1);

        int totalitem = 1;
        ArrayList<Cart> cartItems = (ArrayList<Cart>) session.getAttribute("cart");

        if (cartItems == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        else {
            cart = cartItems;
            if(cartItems != null) {
                for(Cart item: cartItems) {
                    totalitem += item.getCartQuantity();
                }

                for(Cart item: cartItems) {
                    if(item.getId() == cartItem.getId()) {
                        item.setCartQuantity(item.getCartQuantity() + 1);
                        totalitem += 1;
                        session.setAttribute("cart-size", totalitem);
                        response.sendRedirect("/cart.jsp");
                        return;
                    }
                }

            }
        }
        cart.add(cartItem);
        session.setAttribute("cart-size", totalitem);
//        request.getRequestDispatcher("/cart.jsp").forward(request, response);

        response.sendRedirect("/cart.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
