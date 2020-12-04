/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thinlm.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Admin
 */
public class DBHelper {
    
    Connection con = null;
    Statement stm = null;
    
    public static Connection makeConnection() throws ClassNotFoundException, SQLException{
        Connection con = null;
        String url = "jdbc:sqlserver://localhost:1433; databaseName=ItemManagement; user=sa; password=123456";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        Class.forName(driver);
        con = DriverManager.getConnection(url);

        return con;
    }
    
}
