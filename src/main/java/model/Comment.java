package model;

import java.sql.Timestamp;

public class Comment {
    private int id;
    private int productId;
    private String name;
    private String comment;
    private Timestamp timestamp;

    public Comment(int id, int productId, String name, String comment, Timestamp timestamp) {
        this.id = id;
        this.productId = productId;
        this.name = name;
        this.comment = comment;
        this.timestamp = timestamp;
    }

    public int getId() {
        return id;
    }

    public int getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public String getComment() {
        return comment;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }
}
