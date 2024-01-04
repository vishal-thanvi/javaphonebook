<%@ page import="com.conn.Dbconnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success Page</title>
<%@include file="component/allcssjsp.jsp"%>

<style>
    /* Center content vertically and horizontally */
    .center-content {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh; /* 100% viewport height */
    }
</style>

</head>
<body>
<%@include file="component/navbar.jsp"%>

<div class="container-fluid center-content">
    <i class="fas fa-check-circle fa-5x text-success"></i> <!-- Adjust the size and color as needed -->
  <h2 class="mt-3">Welcome <%=request.getAttribute("userName")%> you have successfully registered</h2>
    <a href="login.jsp" class="btn btn-primary mt-3">Login</a>
</div>

</body>
</html>
