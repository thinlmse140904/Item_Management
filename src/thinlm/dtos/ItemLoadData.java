/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thinlm.dtos;

import javax.swing.table.AbstractTableModel;
import thinlm.daos.ItemDAO;

/**
 *
 * @author Admin
 */
public class ItemLoadData extends AbstractTableModel {

    ItemDAO dao = null;

    public ItemLoadData(ItemDAO dao) {
        this.dao = dao;
    }

    public ItemDAO getDao() {
        return dao;
    }

    @Override
    public int getRowCount() {
        return dao.size();
    }

    @Override
    public int getColumnCount() {
        return 6;
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
                columnName = "Supplier";
                break;
            case 3:
                columnName = "Unit";
                break;
            case 4:
                columnName = "Price";
                break;
            case 5:
                columnName = "Supplying";
                break;
        }
        return columnName;
    }

    @Override
    public Object getValueAt(int row, int column) {
        ItemDTO dto = this.dao.get(row);
        Object obj = null;
        switch (column) {
            case 0:
                obj = dto.getItemCode();
                break;
            case 1:
                obj = dto.getItemName();
                break;
            case 2:
                obj = dto.getSupplier().getSupCode() + "-" + dto.getSupplier().getSupName();
                break;
            case 3:
                obj = dto.getUnit();
                break;
            case 4:
                obj = dto.getPrice();
                break;
            case 5:
                obj = dto.isSupplying();
                break;
        }
        return obj;
    }

}
