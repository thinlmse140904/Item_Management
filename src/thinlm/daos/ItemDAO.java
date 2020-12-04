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
import thinlm.utils.DBHelper;
import thinlm.dtos.ItemDTO;
import thinlm.dtos.SupplierDTO;

/**
 *
 * @author Admin
 */
public class ItemDAO extends Vector<ItemDTO> {

    private Connection con;
    private PreparedStatement preStm;
    private ResultSet rs;


    public ItemDAO() {
        super();
    }

    public int find(String itemCode) {
        for (int i = 0; i < this.size(); i++) {
            if (itemCode.equals(this.get(i).getItemCode())) {
                return i;
            }
        }
        return -1;

    }

    public ItemDTO findItem(String itemCode) {
        int i = find(itemCode);
        if(i < 0){
            return null;
        }
        return this.get(i);
    }

    public void loadDataItem(SupplierDAO suppliers) throws SQLException, ClassNotFoundException {
        String itemCode, itemName, supplierCode, unit;
        float price;
        boolean supplying;
        String sql = "SELECT * FROM tblItems";

        try {
            con = DBHelper.makeConnection();
            preStm = con.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                itemCode = rs.getString(1);
                itemName = rs.getString(2);
                supplierCode = rs.getString(3);
                SupplierDTO supplier = suppliers.findSupplier(supplierCode);
                unit = rs.getString(4);
                price = rs.getFloat(5);
                supplying = rs.getBoolean(6);
                ItemDTO item = new ItemDTO(itemCode, itemName, supplier, unit, price, supplying);
                this.add(item);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

}
