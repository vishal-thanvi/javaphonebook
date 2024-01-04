package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

import com.conn.Dbconnect;
import com.dao.Addcontact;
import com.dao.UserDao;
import com.entity.Contact;
@WebServlet("/addcontact")
public class AddContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AddContact() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name=request.getParameter("name");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String about=request.getParameter("about");
		int userid=Integer.parseInt(request.getParameter("userId"));
		
		Contact cc=new Contact(0,name,mobile,email,about,userid);
		Addcontact userdao=new Addcontact((Connection) Dbconnect.getconn());
		boolean f=userdao.saveContact(cc);
		
		HttpSession session=request.getSession();
		if(f)
		{
			session.setAttribute("sucess", "contact added");
			response.sendRedirect("addcont.jsp");
		}
		else
		{
			session.setAttribute("failed", "there is some error to add data");
			response.sendRedirect("addcont.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
