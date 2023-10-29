/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author minht
 */
public class Cart {

    private Map<String, OrderDetailDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, OrderDetailDTO> cart) {
        this.cart = cart;
    }

    public Map<String, OrderDetailDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, OrderDetailDTO> cart) {
        this.cart = cart;
    }
    
    public void addOrderDetail(OrderDetailDTO detailOrder) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        String detailID = Integer.toString(detailOrder.getDetailID());
        this.cart.put(detailID, detailOrder);
    }

    public void add(OrderDetailDTO detailOrder) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        String detailID = Integer.toString(detailOrder.getDetailID());
        if (this.cart.containsKey(detailID)) {
                int currentQuantity = this.cart.get(detailID).getQuantityOrder();
                detailOrder.setQuantityOrder(currentQuantity + detailOrder.getQuantityOrder());
            
        }
        this.cart.put(detailID, detailOrder);
    }

    public boolean checkDetail(int depotsID) {
        if (this.cart == null) {
            return false;
        }
        boolean check = false;
        for (Map.Entry<String, OrderDetailDTO> entry : this.cart.entrySet()) {
            OrderDetailDTO value = entry.getValue();
            if (value.getDeProID() == depotsID) {
                check = true;
            }
        }
        return check;
    }

    public OrderDetailDTO getDetailDuplicate(int depotsID) {
        OrderDetailDTO detail = null;
        for (Map.Entry<String, OrderDetailDTO> entry : cart.entrySet()) {
            OrderDetailDTO value = entry.getValue();
            if (value.getDeProID() == depotsID) {
                detail = value;
            }
        }
        return detail;
    }

    public boolean remove(String detailID) {
        boolean checkRemove = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(detailID)) {
                    this.cart.remove(detailID);
                    checkRemove = true;
                }

            }
        } catch (Exception e) {
        }
        return checkRemove;
    }

    public boolean edit(String detailID, OrderDetailDTO detail) {
        boolean checkEdit = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(detailID)) {
                    this.cart.replace(detailID, detail);
                    checkEdit = true;
                }

            }
        } catch (Exception e) {
        }
        return checkEdit;
    }

}
