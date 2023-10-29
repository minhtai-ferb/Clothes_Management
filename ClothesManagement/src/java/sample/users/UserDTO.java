/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

/**
 *
 * @author minht
 */
public class UserDTO {
    private int userID;
    private String userName;
    private String email;
    private String password;
    private String roleID;
    private String status;

    public UserDTO() {
    }

    public UserDTO(String userName, String email, String password, String roleID, String status) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
        this.status = status;
    }

    public UserDTO(int userID, String userName, String email, String password, String roleID, String status) {
        this.userID = userID;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }    

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }
   
    
}
