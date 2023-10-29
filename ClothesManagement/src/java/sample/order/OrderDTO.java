/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.util.Date;
import java.util.List;

/**
 *
 * @author minht
 */
public class OrderDTO {
    private int orderID;
    private int userID;
    private Date orderDate;
    private double total;
    private int addressID;
    private String status;
    private List<OrderDetailDTO> orderDetail;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, int userID, Date orderDate, double total, int addressID, String status) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.total = total;
        this.addressID = addressID;
        this.status = status;
    }

    public OrderDTO(int orderID, int userID, Date orderDate, double total, int addressID, String status, List<OrderDetailDTO> orderDetail) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.total = total;
        this.addressID = addressID;
        this.status = status;
        this.orderDetail = orderDetail;
    }
    
    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public List<OrderDetailDTO> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(List<OrderDetailDTO> orderDetail) {
        this.orderDetail = orderDetail;
    }
    
    
}
