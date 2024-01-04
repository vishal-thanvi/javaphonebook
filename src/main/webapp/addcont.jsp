<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <%@ include file="component/allcssjsp.jsp" %>
    <style>
        .half-width {
            width: 50%;
        }

        #container {
            margin-bottom: 40px;
        }

       
       
    </style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>
<%
User userr = (User) session.getAttribute("user");
if (userr == null) {
    response.sendRedirect("notlogin.jsp");
}
%>

<h1 style="text-align: center; margin-top: 5px;">Add contact</h1>
<div class="container-fluid" id="container">
    <div class="row justify-content-center">
        <!-- Center the form horizontally -->
        <form class="col-md-6" action="addcontact" method="post">
            <%
            String added = (String) session.getAttribute("sucess");

            if (added != null) {
            %>
            <p class="text-danger text-center">contact is saved</p>
            <%
                session.removeAttribute("sucess");
            }
            %>
            <%
            String failed = (String) session.getAttribute("failed");
            if (failed != null) {
            %>
            <p class="text-success text-center">something went wrong</p>
            <%
                session.removeAttribute("failed");
            }
            %>
            <%-- Check if userr is not null before accessing its properties --%>
            <input type="hidden" value="<%= (userr != null ? userr.getId() : "") %>" name="userId">
            <div class="mb-3" style="margin-top: 30px;">
                <label for="name" class="form-label">Enter Name</label> <input
                        type="text" class="form-control half-width" id="name" name="name">
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Enter
                    Email address</label> <input type="email" class="form-control half-width"
                                                id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
            </div>
            <div class="mb-3">
                <label for="mobileNumber" class="form-label">Mobile number</label>
                <input type="text" class="form-control half-width"
                       id="mobileNumber" name="mobile">
            </div>
            <div class="mb-3">
                <label for="about" class="form-label">About</label>
                <textarea class="form-control half-width" id="about" rows="4"
                          name="about"></textarea>
            </div>
            <button type="submit" class="btn btn-primary bg-warning">Save</button>
        </form>
    </div>
</div>
<div class="container-fluid bg-warning p-2">
    <h6 class="text-white text-center">Developer Vishal Thanvi</h6>
    <p class="text-white text-center">&copy; 2023 Thanvitechinfo All Rights Reserved.</p>
</div>
</body>
</html>
