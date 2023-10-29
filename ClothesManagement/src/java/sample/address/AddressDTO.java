/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.address;

/**
 *
 * @author minht
 */
public class AddressDTO {
    private int addressID;
    private int userID;
    private String fullName;
    private String phone;
    private String city;
    private String district;
    private String wards;
    private String addressHouse;
    private String status;

    public AddressDTO(int userID, String fullName, String phone, String city, String district, String wards, String addressHouse, String status) {
        this.userID = userID;
        this.fullName = fullName;
        this.phone = phone;
        this.city = city;
        this.district = district;
        this.wards = wards;
        this.addressHouse = addressHouse;
        this.status = status;
    }

    public AddressDTO(int addressID, int userID, String fullName, String phone, String city, String district, String wards, String addressHouse, String status) {
        this.addressID = addressID;
        this.userID = userID;
        this.fullName = fullName;
        this.phone = phone;
        this.city = city;
        this.district = district;
        this.wards = wards;
        this.addressHouse = addressHouse;
        this.status = status;
    }

    public AddressDTO(int userID, String fullName, String phone, String city, String district, String wards, String addressHouse) {
        this.userID = userID;
        this.fullName = fullName;
        this.phone = phone;
        this.city = city;
        this.district = district;
        this.wards = wards;
        this.addressHouse = addressHouse;
    }  

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWards() {
        return wards;
    }

    public void setWards(String wards) {
        this.wards = wards;
    }

    public String getAddressHouse() {
        return addressHouse;
    }

    public void setAddressHouse(String addressHouse) {
        this.addressHouse = addressHouse;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
