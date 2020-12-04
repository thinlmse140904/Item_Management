/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thinlm.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.function.Supplier;
import thinlm.utils.DBHelper;
import thinlm.dtos.SupplierDTO;

/**
 *
 * @author Admin
 */
public class SupplierDAO extends Vector<SupplierDTO> {

    public SupplierDAO() {
        super();
    }

    public void loadDataSup() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM tblSuppliers";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();

                while (rs.next()) {
                    String supCode = rs.getString(1);
                    String supName = rs.getString(2);
                    String address = rs.getString(3);
                    boolean collaborating = rs.getBoolean(4);
                    SupplierDTO dto = new SupplierDTO(supCode, supName, address, collaborating);
                    this.add(dto);
                }
            }

        } finally {
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
    }

    public int find(String supCode) {
        for (int i = 0; i < this.size(); i++) {
            if (supCode.equals(this.get(i).getSupCode())) {
                return i;
            }
        }
        return -1;
    }

    public SupplierDTO findSupplier(String supCode) {
        int i = find(supCode);
        if(i < 0){
            return null;
        }
        return this.get(i);
    }
    

}
