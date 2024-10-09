package com.expensetracker.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.expensetracker.dao.DatabaseConnection;

public class DeleteService {
	private static final String DELETE = "DELETE from expensetable where slno=?";

	public int deleteData(String slno) {
		
		try {
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getDatabaseConnection();
			PreparedStatement ps = con.prepareStatement(DELETE);
			ps.setString(1, slno);
			
			
			int x=ps.executeUpdate();
			if(x!=0) {
				return 1;
				
			}else {
				System.out.println("Not Deleted");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}

}
