/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import sample.utils.DBUtils;

/**
 *
 * @author minht
 */
public class OrderDAO {

    private static final String INSERT = "INSERT INTO [dbo].[tblOrder] ([orderID], [userID], [orderDate], [total], [addressID], [status]) VALUES(?,?,?,?,?,?)";

    private static final String COUNTID = "SELECT count([orderID]) as N'countOrder'  FROM [dbo].[tblOrder]";
    
    private static final String DELETE = "DELETE [dbo].[tblOrder] WHERE [userID]=?";

    public OrderDAO() {
    }

    public boolean insert(OrderDTO orderDTO) throws SQLException, ClassNotFoundException, ParseException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, orderDTO.getOrderID());
                ptm.setInt(2, orderDTO.getUserID());
                java.util.Date orderDate = orderDTO.getOrderDate();
                java.sql.Date sqlOrderDate = new java.sql.Date(orderDate.getTime());
                ptm.setDate(3, sqlOrderDate);
                ptm.setDouble(4, orderDTO.getTotal());
                ptm.setInt(5, orderDTO.getAddressID());
                ptm.setString(6, orderDTO.getStatus());
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

    public int countOrder() throws SQLException {
        int orderID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNTID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    orderID = rs.getInt("countOrder");
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
        return orderID;
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
