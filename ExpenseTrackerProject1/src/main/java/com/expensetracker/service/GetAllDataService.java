package com.expensetracker.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.expensetracker.bean.Bean;
import com.expensetracker.dao.DatabaseConnection;

public class GetAllDataService {
	private static final String SHOWDATA = "select * from expensetable;";
	public ArrayList<Bean> al=new ArrayList<Bean>();

	public ArrayList<Bean> showdata() {
		
		try {
			DatabaseConnection dc=new DatabaseConnection();
			Connection con=dc.getDatabaseConnection();
			PreparedStatement ps=con.prepareStatement(SHOWDATA);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				 Bean b=new Bean();

				b.setSlno(rs.getString(1));
				b.setInvestmentType(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setAmount(rs.getString(4));
				b.setTime(rs.getString(5));
				
				al.add(b);
				
				

				
			}
			
           
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return al;
	     
	}
}
