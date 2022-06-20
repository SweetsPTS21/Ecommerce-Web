package model;

import java.util.List;

public class Cart extends Product{

    private int cartQuantity = 0;
    private int id;
    public Cart() {

    }

    public int getCartQuantity() {
        return cartQuantity;
    }

    public void setCartQuantity(int cartQuantity) {
        this.cartQuantity = cartQuantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


}
