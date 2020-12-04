/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thinlm.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import thinlm.utils.DBHelper;

/**
 *
 * @author Admin
 */
public class LoginDAO{

    public boolean checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT userID FROM tblUsers WHERE userID=? AND password=?";
                pst = con.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, password);
                
                rs = pst.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        }finally {
            if (con != null) {
                con.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;
    }
}
