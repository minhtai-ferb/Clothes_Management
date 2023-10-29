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
public class AddressError {
    private int addressIDError;
    private String userIDError;
    private String fullNameError;
    private String phoneError;
    private String cityError;
    private String districtError;
    private String wardsError;
    private String addressHouseError;
    private String error;

    public AddressError(int addressIDError, String userIDError, String fullNameError, String phoneError, String cityError, String districtError, String wardsError, String addressHouseError, String error) {
        this.addressIDError = addressIDError;
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.phoneError = phoneError;
        this.cityError = cityError;
        this.districtError = districtError;
        this.wardsError = wardsError;
        this.addressHouseError = addressHouseError;
        this.error = error;
    }

    public int getAddressIDError() {
        return addressIDError;
    }

    public void setAddressIDError(int addressIDError) {
        this.addressIDError = addressIDError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getCityError() {
        return cityError;
    }

    public void setCityError(String cityError) {
        this.cityError = cityError;
    }

    public String getDistrictError() {
        return districtError;
    }

    public void setDistrictError(String districtError) {
        this.districtError = districtError;
    }

    public String getWardsError() {
        return wardsError;
    }

    public void setWardsError(String wardsError) {
        this.wardsError = wardsError;
    }

    public String getAddressHouseError() {
        return addressHouseError;
    }

    public void setAddressHouseError(String addressHouseError) {
        this.addressHouseError = addressHouseError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    
}
