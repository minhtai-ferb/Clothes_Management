/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author minht
 */
public class OrderDetailDAO {
    
    private static final String INSERT = "INSERT INTO [dbo].[tblOrderDetail] ([orderID], [depotID], [userID], [quantityOrder], [priceOrder]) VALUES(?,?,?,?,?)";
    
    private static final String DELETE = "DELETE [dbo].[tblOrderDetail] WHERE [userID]=?";
    
    public OrderDetailDAO() {
    }

    public boolean insert(OrderDetailDTO value, int orderID, int userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, orderID);
                ptm.setInt(2, value.getDeProID());
                ptm.setInt(3, userID);
                ptm.setInt(4, value.getQuantityOrder());
                ptm.setDouble(5, value.getPriceOrder());
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
