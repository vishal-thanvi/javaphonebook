package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Contact;
import com.entity.User;

public class UserDao {

	private Connection conn;

	public UserDao(Object conn) {
		super();
		this.conn = (Connection) conn;
	}
	
	public boolean userRegistration(User u)
	{
		boolean f=false;
		try
		{
		String sql="insert into user(name,email,password) values(?,?,?)";
		PreparedStatement st=conn.prepareStatement(sql);
		st.setString(1, u.getName());
		st.setString(2, u.getEmail());
		st.setString(3, u.getPassword());
		
		int i =st.executeUpdate();
		
		if(i==1)
		{
			f=true;
		}
		}
		catch(Exception e)
		{
			e.fillInStackTrace();
		}
		
		return f;
		
	}
	
	public User loginuser(String e,String p)
	{
		User user=null;
		
		try
		{
			  String sql = "select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				user= new User();
				 user.setEmail(rs.getString(3));
		            user.setId(rs.getInt(1)); 
		            user.setName(rs.getString(2));
		            user.setPassword(rs.getString(4));
				
				
			}
			
		}
		catch(Exception ex)
		{
			ex.fillInStackTrace();
		}
		
		return user;
	}
	


private PreparedStatement prepareStatement() {
	// TODO Auto-generated method stub
	return null;
}
	
	
}
