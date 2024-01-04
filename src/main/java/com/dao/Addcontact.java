package com.dao;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.entity.Contact;

public class Addcontact {
	
	private Connection conn;


	public Addcontact(Connection conn) {
	    super();
	    this.conn = conn;
	}

	public boolean saveContact(Contact cc)
	{
		boolean f=false;
		
		try
		{
			String sql="insert into contact(name,email,mobile_no,about,userId) values(?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
		    pst.setString(1, cc.getName());
		    pst.setString(2, cc.getEmail());
		    pst.setString(3, cc.getPhno());
		    pst.setString(4, cc.getAbout());
		    pst.setInt(5,cc.getUserId());
		   int i= pst.executeUpdate();
		   
		   if(i==1)
		   {
			   f=true;
		   }
		   
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return f;
		
	}

	public List<Contact> getAllContact(int uid) {
	    List<Contact> list = new ArrayList<Contact>();
	    Contact c = null;
	    
	    try {
	        String sql = "select * from contact where userId=?";
	        PreparedStatement st = conn.prepareStatement(sql);
	        
	        // Set the value of the userId parameter
	        st.setInt(1, uid);
	        
	        ResultSet rs = st.executeQuery();
	        
	        while (rs.next()) {
	            c = new Contact();
	            c.setId(rs.getInt(1));
	            c.setName(rs.getString(2));
	            c.setEmail(rs.getString(3));
	            c.setPhno(rs.getString(4));
	            c.setAbout(rs.getString(5));
	            list.add(c);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return list;
	}
	public Contact getuserdata(int cid)
	{
		Contact  c=new Contact();
		try
		{
			PreparedStatement ps=conn.prepareStatement("select * from contact where id=?");
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setAbout(rs.getString(4));
				
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return c;
	}
	public Contact contactById(int cid)
	{
		Contact c=new Contact();
		
		try
		{
			PreparedStatement pst=conn.prepareStatement("select *from contact where id=?");
			pst.setInt(1, cid);
			
			
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setAbout(rs.getString(5));
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return c;
	}
	public boolean updateCont(Contact cc) {
	    boolean f = false;
System.out.println(cc.getId());
	    try {
	        if (cc == null) {
	            System.out.println("Contact object is null.");
	            return false;
	        }
	        
	        String sql = "update contact set name=?, email=?, mobile_no=?, about=? where id=?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setString(1, cc.getName());
	        pst.setString(2, cc.getEmail());
	        pst.setString(3, cc.getPhno());
	        pst.setString(4, cc.getAbout());
	        pst.setInt(5, cc.getId());
	        
	        int i = pst.executeUpdate();

	        if (i == 1) {
	            f = true;
	            System.out.println("Update successful.");
	        } else {
	            System.out.println("Update failed. Rows affected: " + i);
	        }

	    } catch (SQLException ex) {
	        System.out.println("SQL Exception: " + ex.getMessage());
	        ex.printStackTrace();
	    } catch (Exception e) {
	        System.out.println("Exception: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return f;
	}
	
	public boolean deletecont(int id)
	{
		boolean f=false;
		
		try {
			String sql="delete from contact where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			int i=pst.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return f;
	}

}
