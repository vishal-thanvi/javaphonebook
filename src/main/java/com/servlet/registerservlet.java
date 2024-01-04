package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.conn.Dbconnect;
import com.dao.UserDao;
import com.entity.User;
@WebServlet("/register")
public class registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public registerservlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		User u=new User(0, name,email,password);
		
		UserDao user=new UserDao(Dbconnect.getconn());
		
		boolean f=user.userRegistration(u);
		
		if(f)
		{
			request.setAttribute("userName", name);
			 request.getRequestDispatcher("success.jsp").forward(request, response);
		        
			//System.out.println("data successfully inserted...");
		}
		else
		{
			System.out.println("there is an error");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
