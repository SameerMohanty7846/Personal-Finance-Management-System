package com.expensetracker.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.expensetracker.dao.DatabaseConnection;

public class GetTotalBalanceService {
    String GETBALANCE = "SELECT SUM(amount) AS total_amount FROM expensetable";
	public int getBal() {
		try {
			DatabaseConnection dc=new DatabaseConnection();
			Connection con=dc.getDatabaseConnection();
			PreparedStatement ps=con.prepareStatement(GETBALANCE);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
	                int totalAmount = rs.getInt("total_amount"); // get the total amount
	                return totalAmount;
	            }

           
          
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	     
	}
}
