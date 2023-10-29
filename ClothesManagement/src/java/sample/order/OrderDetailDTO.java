/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import sample.depots.DepotsDTO;

/**
 *
 * @author minht
 */
public class OrderDetailDTO extends DepotsDTO {
    private int detailID;
    private int quantityOrder;
    private double priceOrder;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int detailID, int quantityOrder, double priceOrder) {
        this.detailID = detailID;
        this.quantityOrder = quantityOrder;
        this.priceOrder = priceOrder;
    }

    public OrderDetailDTO(int detailID, int quantityOrder, double priceOrder, int deProID, int proID, String colorDe, String sizeDe, String colorIMG, String proName) {
        super(deProID, proID, colorDe, sizeDe, colorIMG, proName);
        this.detailID = detailID;
        this.quantityOrder = quantityOrder;
        this.priceOrder = priceOrder;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getQuantityOrder() {
        return quantityOrder;
    }

    public void setQuantityOrder(int quantityOrder) {
        this.quantityOrder = quantityOrder;
    }

    public double getPriceOrder() {
        return priceOrder;
    }

    public void setPriceOrder(double priceOrder) {
        this.priceOrder = priceOrder;
    }
    
    
}
