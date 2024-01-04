package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.conn.Dbconnect;
import com.dao.UserDao;
import com.entity.User;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String name=request.getParameter("email");
	String password=request.getParameter("password");
	
	
	UserDao user=new UserDao(Dbconnect.getconn());
    User u=user.loginuser(name,password);
    
    HttpSession session=request.getSession();
    if(u!=null)
    {
    	session.setAttribute("user", u);
    	response.sendRedirect("index.jsp");
    	
    	//System.out.println("user is available..."+u);
    }
    else
    {
    	session.setAttribute("invalidMsg", "invalid email and password");
    	response.sendRedirect("login.jsp");
    	System.out.println("user is not available"+u);
    }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
