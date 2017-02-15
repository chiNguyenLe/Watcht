/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Category;
import entities.PieChart;
import entities.Watch;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class PieChartDAO {
    
    public List<PieChart> getPieChartData() {
        List<PieChart> list = new ArrayList<>();
        WatchDAO watchDAO = new WatchDAO();
        
        
        CategoryDAO categoryDAO = new CategoryDAO();
        for (Category c : categoryDAO.getCategoryList()) {
            String nameC = c.getName();
            int idC = c.getCategoryId();
            
            // Đếm số lượng sản phẩm có trong danh mục này
            int number = 0;
            List<Watch> list1 = watchDAO.getWatchByCategory(idC);
            for (Watch w : list1) {
                number += w.getQuantity();
            }
            
            list.add(new PieChart(nameC, number));
        }
        
        return list;
    }
}
