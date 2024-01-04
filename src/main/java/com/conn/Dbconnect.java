package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnect {

	private static Connection conn;
	
	public static Object getconn()
	{
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook","root","admin");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
}
