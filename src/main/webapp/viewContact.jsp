<%@ page import="com.dao.Addcontact"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Contact"%>

<%@ page import="com.conn.Dbconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcssjsp.jsp"%>
<style>
.crd-ho:hover {
    background-color: #edc145;
}
.card-container {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    overflow-x: auto;
}
.card {
    width: 273px;
    margin-right: 10px;
}
.center-container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
.center-alert {
    text-align: center;
}
.no-contacts-alert {
    display: inline-block;
    background-color: #ffc107;
    color: #333;
    padding: 10px 20px;
    border-radius: 5px;
}
</style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>   
    <%
    if (user == null) {
    response.sendRedirect("notlogin.jsp");
    }
    %>
    <div class="container">
        <div class="row p-4">
            <div class="col-md-9">
                <%
                if (user != null) {
                    Connection conn = (Connection) Dbconnect.getconn();
                    Addcontact dao = new Addcontact(conn);
                    List<Contact> contact = dao.getAllContact(user.getId());
                %>
                <%
                String failed = (String) session.getAttribute("failed");
                if (failed != null) {
                %>
                <p class="text-success text-center">Something went wrong on server</p>
                <%
                session.removeAttribute("failed");
                }
                %>
                <div class="card-container">
                    <%
                    if (contact.isEmpty()) {
                    %>
                        <div class="center-container">
                            <div class="center-alert">
                                <div class="no-contacts-alert alert alert-warning" role="alert">
                                    No Contacts Saved
                                </div>
                            </div>
                        </div>
                    <%
                    } else {
                        for (Contact c : contact) {
                    %>
                    <div class="card crd-ho">
                        <div class="card-body">
                            <h6>
                                Name:
                                <%=c.getName()%></h6>
                            <h6>
                                Email:
                                <%=c.getPhno()%></h6>
                            <h6>
                                Phone NO.:
                                <%=c.getEmail()%></h6>
                            <h6>
                                About:
                                <%=c.getAbout()%></h6>
                            <%

                            Integer id = c.getId();
                            session.setAttribute("cid", id);
                            %>
                            <a href="editcont.jsp?"
                                class="btn btn-success btn-sm text-white">Edit</a> <a
                                href="delete" class="btn btn-danger btn-sm text-white">Delete</a>
                        </div>
                    </div>
                    <%
                        }
                    }
                    %>
                </div>
                <%
                }
                %>
            </div>
        </div>
    </div>
</body>
</html>
