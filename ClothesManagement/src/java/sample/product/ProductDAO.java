/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author minht
 */
public class ProductDAO {    
    
    private static final String SEARCH = "SELECT proID, proName, price, description, color, size, imgUrl, type, collection FROM tblProduct WHERE proName = ?";
    
    private static final String SEARCH_LIST_PRODUCT = "SELECT proID, proName, price, description, color, size, imgUrl, type, collection, status FROM tblProduct WHERE proName like ? AND status=?";

    public ProductDTO getPro(String proName) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, proName);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int proID = rs.getInt("proID");
                    double price = rs.getDouble("price");
                    String description[] = splitStringToArray(rs.getString("description"));
                    String color[] = splitStringToArray(rs.getString("color"));
                    String size[] = splitStringToArray(rs.getString("size"));
                    String imgUrl[] = splitStringToArray(rs.getString("imgUrl"));     
                    String type = rs.getString("type");
                    String collection = rs.getString("collection");
                    product = new ProductDTO(proID, proName, price, description, color, size, imgUrl, type, collection);
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
    
    public String[] splitStringToArray(String inputString) {
        String[] elements = inputString.split(";");
        return elements;
    }
    
    public List<ProductDTO> getListProduct(String search, String status) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_LIST_PRODUCT);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, status);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int proID = rs.getInt("proID");
                    String proName = rs.getString("proName");
                    double price = rs.getDouble("price");
                    String description[] = splitStringToArray(rs.getString("description"));
                    String color[] = splitStringToArray(rs.getString("color"));
                    String size[] = splitStringToArray(rs.getString("size"));
                    String imgUrl[] = splitStringToArray(rs.getString("imgUrl"));     
                    String type = rs.getString("type");
                    String collection = rs.getString("collection");
                    list.add (new ProductDTO(proID, proName, price, description, color, size, imgUrl, type, collection, status));
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
        return list;
    }
    
}