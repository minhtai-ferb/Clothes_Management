/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author minht
 */
public class AddressDAO {

    private static final String SEARCH = "SELECT [addressID], [userID], [fullName], [phone], [city], [district], [wardss], [addressHouse], [status] FROM [dbo].[tblAddress] WHERE [userID]=? AND [status]=?";

    private static final String CHECK = "SELECT [addressID], [userID], [fullName], [phone], [city], [district], [wardss], [addressHouse], [status] FROM [dbo].[tblAddress] WHERE [userID]=? AND [fullName]=? AND [phone]=? AND [city]=? AND [district]=? AND [wardss]=? AND [addressHouse]=?";

    private static final String INSERT = "INSERT INTO [dbo].[tblAddress] ([userID], [fullName], [phone], [city], [district], [wardss], [addressHouse], [status]) VALUES(?,?,?,?,?,?,?,?)";

    private static final String DELETE = "DELETE [dbo].[tblAddress] WHERE [userID]=?";

    public AddressDAO() {
    }

    public AddressDTO getAddress(int userID, String primary) throws SQLException {
        AddressDTO userAddress = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setInt(1, userID);
                ptm.setString(2, primary);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int addressID = rs.getInt("addressID");
                    String fullName = rs.getString("fullName");
                    String phone = rs.getString("phone");
                    String city = rs.getString("city");
                    String district = rs.getString("district");
                    String wards = rs.getString("wardss");
                    String addressHouse = rs.getString("addressHouse");
                    String status = primary;
                    userAddress = new AddressDTO(addressID, userID, fullName, phone, city, district, wards, addressHouse, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return userAddress;
    }

    public boolean insertAddress(AddressDTO userAddress) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, userAddress.getUserID());
                ptm.setString(2, userAddress.getFullName());
                ptm.setString(3, userAddress.getPhone());
                ptm.setString(4, userAddress.getCity());
                ptm.setString(5, userAddress.getDistrict());
                ptm.setString(6, userAddress.getWards());
                ptm.setString(7, userAddress.getAddressHouse());
                ptm.setString(8, userAddress.getStatus());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDulicate(AddressDTO userAddress) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK);
                ptm.setInt(1, userAddress.getUserID());
                ptm.setString(2, userAddress.getFullName());
                ptm.setString(3, userAddress.getPhone());
                ptm.setString(4, userAddress.getCity());
                ptm.setString(5, userAddress.getDistrict());
                ptm.setString(6, userAddress.getWards());
                ptm.setString(7, userAddress.getAddressHouse());
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public AddressDTO getAddress(AddressDTO addressDTO) throws SQLException {
        AddressDTO userAddress = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK);
                ptm.setInt(1, addressDTO.getUserID());
                ptm.setString(2, addressDTO.getFullName());
                ptm.setString(3, addressDTO.getPhone());
                ptm.setString(4, addressDTO.getCity());
                ptm.setString(5, addressDTO.getDistrict());
                ptm.setString(6, addressDTO.getWards());
                ptm.setString(7, addressDTO.getAddressHouse());
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int addressID = rs.getInt("addressID");
                    int userID = rs.getInt("userID");
                    String fullName = rs.getString("fullName");
                    String phone = rs.getString("phone");
                    String city = rs.getString("city");
                    String district = rs.getString("district");
                    String wards = rs.getString("wardss");
                    String addressHouse = rs.getString("addressHouse");
                    String status = rs.getString("status");
                    userAddress = new AddressDTO(addressID, userID, fullName, phone, city, district, wards, addressHouse, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return userAddress;
    }

    public boolean delete(int userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, userID);
                check = ptm.executeUpdate() >= 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
