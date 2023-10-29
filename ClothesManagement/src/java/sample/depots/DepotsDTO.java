/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.depots;

import java.util.List;
import sample.product.ProductDTO;

/**
 *
 * @author minht
 */
public class DepotsDTO extends ProductDTO{
    private int deProID;
    private int proID;
    private String colorDe;
    private String sizeDe;
    private int quantity;
    private String colorIMG;

    public DepotsDTO() {
    }

    public DepotsDTO(int deProID, int proID, String colorDe, String sizeDe, int quantity) {
        this.deProID = deProID;
        this.proID = proID;
        this.colorDe = colorDe;
        this.sizeDe = sizeDe;
        this.quantity = quantity;
    }

    public DepotsDTO(int deProID, int proID, String colorDe, String sizeDe, int quantity, String colorIMG) {
        this.deProID = deProID;
        this.proID = proID;
        this.colorDe = colorDe;
        this.sizeDe = sizeDe;
        this.quantity = quantity;
        this.colorIMG = colorIMG;
    }    

    public DepotsDTO(int deProID, int proID, String colorDe, String sizeDe, String colorIMG, String proName) {
        super(proName);
        this.deProID = deProID;
        this.proID = proID;
        this.colorDe = colorDe;
        this.sizeDe = sizeDe;
        this.colorIMG = colorIMG;
    }

    public DepotsDTO(int deProID, String colorDe, String sizeDe, int quantity, String colorIMG, int proID, String proName) {
        super(proID, proName);
        this.proID = proID;
        this.deProID = deProID;
        this.colorDe = colorDe;
        this.sizeDe = sizeDe;
        this.quantity = quantity;
        this.colorIMG = colorIMG;
    }

    public int getDeProID() {
        return deProID;
    }

    public void setDeProID(int deProID) {
        this.deProID = deProID;
    }

    @Override
    public int getProID() {
        return proID;
    }

    @Override
    public void setProID(int proID) {
        this.proID = proID;
    }

    public String getColorDe() {
        return colorDe;
    }

    public void setColorDe(String colorDe) {
        this.colorDe = colorDe;
    }

    public String getSizeDe() {
        return sizeDe;
    }

    public void setSizeDe(String sizeDe) {
        this.sizeDe = sizeDe;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColorIMG() {
        return colorIMG;
    }

    public void setColorIMG(String colorIMG) {
        this.colorIMG = colorIMG;
    }

    
    
}
