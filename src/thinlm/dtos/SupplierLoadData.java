/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thinlm.dtos;

import java.util.Vector;
import javax.swing.table.AbstractTableModel;
import thinlm.daos.SupplierDAO;

/**
 *
 * @author Admin
 */
public class SupplierLoadData extends AbstractTableModel {

    SupplierDAO dao = null;

    public SupplierLoadData(SupplierDAO dao) {
        this.dao = dao;
    }

    public SupplierDAO getDao() {
        return dao;
    }

    @Override
    public int getRowCount() {
        return dao.size();
    }

    @Override
    public int getColumnCount() {
        return 3;
    }

    @Override
    public String getColumnName(int column) {
        String columnName = "";
        switch (column) {
            case 0:
                columnName = "Code";
                break;
            case 1:
                columnName = "Name";
                break;
            case 2:
                columnName = "Address";
                break;
//            case 3:
//                columnName = "Collaborating";
//                break;

        }
        return columnName;
    }

    @Override
    public Object getValueAt(int row, int column) {
        SupplierDTO supplier = this.dao.get(row);
        Object obj = null;
        switch (column) {
            case 0:
                obj = supplier.getSupCode();
                break;
            case 1:
                obj = supplier.getSupName();
                break;
            case 2:
                obj = supplier.getAddress();
                break;
//            case 3:
//                obj = supplier.isCollaborating();
//                break;
        }
        return obj;
    }

}
