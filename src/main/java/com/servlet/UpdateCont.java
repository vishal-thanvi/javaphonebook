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
import com.entity.Contact;

@WebServlet("/update")
public class UpdateCont extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateCont() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String about = request.getParameter("about");

        Contact cc = new Contact();
        cc.setId(id); 
        cc.setName(name);
        cc.setPhno(mobile);
        cc.setEmail(email);
        cc.setAbout(about);

        Addcontact userdao = new Addcontact((Connection) Dbconnect.getconn()); 
        boolean f = userdao.updateCont(cc);

        HttpSession session = request.getSession();
        if (f) {
            session.setAttribute("success", "Contact updated successfully");
            response.sendRedirect("viewContact.jsp");
        } else {
            session.setAttribute("failed", "Failed to update contact");
            response.sendRedirect("editcont.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request, response);
    }
}
