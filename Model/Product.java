package com.model;

public class Product {
    private int productID;
    private String productName;
    private String category;
    private double price;
    private int quantity;

    // No-arg constructor
    public Product() {}

    // All-args constructor
    public Product(int productID, String productName, String category, double price, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
    }

    // Getters
    public int getProductID() { return productID; }
    public String getProductName() { return productName; }
    public String getCategory() { return category; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }

    // Setters
    public void setProductID(int productID) { this.productID = productID; }
    public void setProductName(String productName) { this.productName = productName; }
    public void setCategory(String category) { this.category = category; }
    public void setPrice(double price) { this.price = price; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    @Override
    public String toString() {
        return "Product[ID=" + productID + ", Name=" + productName + ", Category=" + category
               + ", Price=" + price + ", Quantity=" + quantity + "]";
    }
}
