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
   
    .center-content {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 78vh; /* 100% viewport height */
    }
   
    .right-icon {
        font-size: 50px;
        animation: rotate 2s linear infinite; /* Add animation effect */
    }

</style>

</head>
<body>
<%@include file="component/navbar.jsp"%>

<div class="center-content">
    <i class="fas fa-check-circle text-success right-icon"></i> <!-- Font Awesome right icon -->
    <h4>Contact Has Been Successfully Deleted</h4>
</div>
<div class="container-fuild bg-warning p-2"; >
		<h6 class="text-white text-center">Devloper vishal thanvi</h6>
		<p class="text-white text-center">&copy; 2023 thanvitechinfo pvt ltd All Rights Reserved.</p>
		
	</div>
</body>
</html>
