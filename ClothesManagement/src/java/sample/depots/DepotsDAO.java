/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.depots;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author minht
 */
public class DepotsDAO {
    
    private static final String SEARCH = "SELECT A.depotID, B.proID, B.color, A.size, A.quantity, B.imgUrl FROM [dbo].[tblDepots] A, [dbo].[tblColor] B WHERE A.proID=B.proID AND A.color=B.color AND B.color=? AND B.proID=? AND A.size=?";
    
    private static final String SEARCHID = "SELECT [depotID], [proID], [color], [size], [quantity]  FROM [dbo].[tblDepots] WHERE [depotID]=?";
    
    private static final String UPDATE = "UPDATE [dbo].[tblDepots] SET [quantity]=? WHERE [depotID]=?";

    public DepotsDTO getProduct(int proID, String color, String size) throws SQLException {
        DepotsDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, color);
                ptm.setInt(2, proID);
                ptm.setString(3, size);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int depotID = rs.getInt("depotID");
                    int proIDDepot = rs.getInt("proID");
                    String colorDepot = rs.getString("color");     
                    String sizeDepot = rs.getString("size");
                    int quantity = rs.getInt("quantity");
                    String imgColor = rs.getString("imgUrl");
                    product = new DepotsDTO(depotID, proIDDepot, colorDepot, sizeDepot, quantity, imgColor);
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
        return product;
    }

    public DepotsDTO getDepotsID(int deProID) throws SQLException {
        DepotsDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHID);
                ptm.setInt(1, deProID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int depotID = rs.getInt("depotID");
                    int proIDDepot = rs.getInt("proID");
                    String colorDepot = rs.getString("color");     
                    String sizeDepot = rs.getString("size");
                    int quantity = rs.getInt("quantity");
                    product = new DepotsDTO(depotID, proIDDepot, colorDepot, sizeDepot, quantity);
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
        return product;
    }

    public boolean update(DepotsDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setInt(1, product.getQuantity());
                ptm.setInt(2, product.getDeProID());
                check = ptm.executeUpdate() > 0 ? true : false;
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
