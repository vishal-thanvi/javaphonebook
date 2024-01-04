<%@ page import="com.conn.Dbconnect"%>
<%@ page import="com.dao.Addcontact"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager"%>
<%@ page import="com.entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Contact</title>
<%@include file="component/allcssjsp.jsp"%>
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
	<%@include file="component/navbar.jsp"%>
	<%
	Object cidObj = session.getAttribute("cid");
	int cid = Integer.parseInt(cidObj.toString());
	Connection conn = (Connection) Dbconnect.getconn();
	Addcontact dao = new Addcontact(conn);
	Contact c = dao.contactById(cid);
	%>

	<h1 style="text-align: center; margin-top: 5px;">Edit Contact</h1>
	<div class="container-fluid" id="container">
		<div class="row justify-content-center">
			<!-- Center the form horizontally -->
			<form class="col-md-6" action="update" method="post">
				<%
				String added = (String) session.getAttribute("sucess");

				if (added != null) {
				%>
				<p class="text-danger text-center">Contact is edited</p>
				<%
				session.removeAttribute("sucess");
				}
				%>

				<%
				String failed = (String) session.getAttribute("failed");
				if (failed != null) {
				%>
				<p class="text-success text-center">Something went wrong server</p>
				<%
				session.removeAttribute("failed");
				}
				%>
				<input type="hidden" value="<%=c.getId()%>" name="id">
				<div class="mb-3" style="margin-top: 30px;">
					<label for="name" class="form-label">Enter Name</label> <input
						value="<%=c.getName()%>" type="text"
						class="form-control half-width" id="name" name="name">
				</div>
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Enter mobile number</label> <input value="<%=c.getEmail()%>" type="text"
						class="form-control half-width" id="exampleInputEmail1"
						aria-describedby="emailHelp" name="email">
				</div>
				<div class="mb-3">
					<label for="mobileNumber" class="form-label">Enter email id</label>
					<input value="<%=c.getPhno()%>" type="email"
						class="form-control half-width" id="mobileNumber" name="mobile">
				</div>
				<div class="mb-3">
					<label for="about" class="form-label">About</label>
					<textarea class="form-control half-width" id="about" rows="4"
						name="about"><%=c.getAbout()%></textarea>
				</div>
				<button class="btn btn-primary bg-warning">Update Contact</button>
			</form>
		</div>
	</div>
</body>
</html>
