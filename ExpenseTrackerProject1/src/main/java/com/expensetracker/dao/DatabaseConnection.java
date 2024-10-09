package com.expensetracker.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	
	public Connection getDatabaseConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/expensetracker","root","root");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
}
