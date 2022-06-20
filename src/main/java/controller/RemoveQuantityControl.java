package controller;

import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RemoveQuantityControl", value = "/removequantity")
public class RemoveQuantityControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        int removeId = Integer.parseInt(request.getParameter("removeproductid"));
        Cart cartItem = new Cart();
        cartItem.setId(removeId);
        int totalitem = 0;

        ArrayList<Cart> cartItems = (ArrayList<Cart>) session.getAttribute("cart");
        for(Cart item: cartItems) {
            totalitem += item.getCartQuantity();
        }
        for (Cart item : cartItems) {
            if (item.getId() == cartItem.getId()) {
                if(item.getCartQuantity() > 1) {
                    item.setCartQuantity(item.getCartQuantity() - 1);
                    totalitem -= 1;
                    session.setAttribute("cart-size", totalitem);
                    response.sendRedirect("/cart.jsp");
                    return;
                }
                else {
                    cartItems.remove(item);
                    session.setAttribute("cart", cartItems);
                    session.setAttribute("cart-size", cartItems.size());
                    response.sendRedirect("/cart.jsp");
                    return;
                }
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
