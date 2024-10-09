package com.expensetracker.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.expensetracker.dao.DatabaseConnection;

public class UpdateService {
	private static final String UPDATE = "UPDATE expensetable SET category = ? WHERE slno =?; ";

	public int updateData(String slno, String category) {
		
		try {
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getDatabaseConnection();
			PreparedStatement ps = con.prepareStatement(UPDATE);
			ps.setString(2, slno);
			ps.setString(1, category);
			
			int x=ps.executeUpdate();
			if(x!=0) {
				return 1;
				
			}else {
				System.out.println("Not updated");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}

}
