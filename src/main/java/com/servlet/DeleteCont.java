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
@WebServlet("/delete")
public class DeleteCont extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteCont() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Object cidObj = session.getAttribute("cid");
		int id = Integer.parseInt(cidObj.toString());
		String name=request.getParameter("name");
	        Addcontact dao = new Addcontact((Connection) Dbconnect.getconn()); 
	       boolean f= dao.deletecont(id);
	       
	       if(f)
	       {
	    	   session.setAttribute("success","contact deleted...");
	    	   response.sendRedirect("delete.jsp");
	       }
	       else
	       {
	    	   session.setAttribute("failed","something went wrong on server...");
	    	   response.sendRedirect("viewContact.jsp");
	       }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
