package model;

import model.Payment;
import model.Product;
import model.User;

public class Order {
    private int id;
    private int userId;

    private String name;
    private String phone;
    private String address;
    private int totalPrice;
    private String date;

    private String status;

    public Order() {
    }

    public Order(int id, int userId, String name, String phone, String address, int totalPrice, String date, String status) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.totalPrice = totalPrice;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
