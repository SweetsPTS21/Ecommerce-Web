package controller;

import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddQuantityControl", value = "/addquantity")
public class AddQuantityControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Cart> cart = new ArrayList<>();

        int addId = Integer.parseInt(request.getParameter("addproductid"));
        Cart cartItem = new Cart();
        cartItem.setId(addId);

        ArrayList<Cart> cartItems = (ArrayList<Cart>) session.getAttribute("cart");
        cart = cartItems;
        int totalitem = 0;
        for(Cart item: cartItems) {
            totalitem += item.getCartQuantity();
        }
        for (Cart item : cartItems) {
            if (item.getId() == cartItem.getId()) {
                item.setCartQuantity(item.getCartQuantity() + 1);
                totalitem += 1;
                session.setAttribute("cart-size", totalitem);
                response.sendRedirect("/cart.jsp");
                return;
            }
        }
        cart.add(cartItem);

        session.setAttribute("cart-size", totalitem);
        response.sendRedirect("/cart.jsp");



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
