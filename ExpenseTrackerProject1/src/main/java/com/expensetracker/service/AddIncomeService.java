package com.expensetracker.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.expensetracker.dao.DatabaseConnection;

public class AddIncomeService {
	private static final String ADDINCOME = "INSERT INTO expensetable (investment_type, category, amount) VALUES (?, ?, ?)";

	public int addIncome(String investmentType,String category,int amount) {
		int x=0;
		try {
			DatabaseConnection dc=new DatabaseConnection();
			Connection con=dc.getDatabaseConnection();
			PreparedStatement ps=con.prepareStatement(ADDINCOME);
            ps.setString(1, investmentType);
            ps.setString(2, category);
            ps.setInt(3, amount);
            x=ps.executeUpdate();
			if(x!=0) {
                System.out.println("A new expense record was inserted successfully!");

				return x;
				
			}else {
				System.out.println("Some Error");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	     
	}
}
