/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author minht
 */
public class ProductDTO {

    private int proID;
    private String proName;
    private double price;
    private String description[];
    private String color[];
    private String size[];
    private String imgURL[];
    private String type;
    private String collection;
    private String status;

    public ProductDTO() {
    }

    //có đầy đủ
    public ProductDTO(int proID, String proName, double price, String description[], String[] color, String[] size, String[] imgURL, String type, String collection, String status) {
        this.proID = proID;
        this.proName = proName;
        this.price = price;
        this.description = description;
        this.color = color;
        this.size = size;
        this.imgURL = imgURL;
        this.type = type;
        this.collection = collection;
        this.status = status;
    }

    public ProductDTO(int proID, String proName, double price, String description[], String[] color, String[] size, String[] imgURL, String type, String collection) {
        this.proID = proID;
        this.proName = proName;
        this.price = price;
        this.description = description;
        this.color = color;
        this.size = size;
        this.imgURL = imgURL;
        this.type = type;
        this.collection = collection;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ProductDTO(int proID) {
        this.proID = proID;
    }

    public ProductDTO(String proName) {
        this.proName = proName;
    }

    public ProductDTO(int proID, String proName) {
        this.proName = proName;
        this.proID = proID;
    }

    public String[] getColor() {
        return color;
    }

    public void setColor(String[] color) {
        this.color = color;
    }

    public String[] getSize() {
        return size;
    }

    public void setSize(String[] size) {
        this.size = size;
    }

    public int getProID() {
        return proID;
    }

    public void setProID(int proID) {
        this.proID = proID;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String[] getDescription() {
        return description;
    }

    public void setDescription(String[] description) {
        this.description = description;
    }

    public String[] getImgURL() {
        return imgURL;
    }

    public void setImgURL(String[] imgURL) {
        this.imgURL = imgURL;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCollection() {
        return collection;
    }

    public void setCollection(String collection) {
        this.collection = collection;
    }

}
