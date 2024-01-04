

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcssjsp.jsp"%>
<style>

  .half-width {
    width: 50%;
  }
  #container	
  {
  
  margin-bottom:40px;
  }
</style>
</head>
<body>
<%@include file="component/navbar.jsp"%>
<h1 style="text-align:center;margin-top:5px;">Login here</h1>
<div class="container-fluid " id="cotainer">
  <div class="row justify-content-center"> <!-- Center the form horizontally -->
    <form class="col-md-6" action="login" method="post">
    <%
    String invalidMsg=(String)session.getAttribute("invalidMsg");
    
   if(invalidMsg!=null)
   {%>
	  <p class="text-danger text-center">invalid email or password</p> 
   <%
   session.removeAttribute("invalidMsg");
   }
    %>
    
    <%
    String success=(String)session.getAttribute("logoutsuccess");
    if(success!=null)
    {%>
    	<p class="text-success text-center">you have successfully logout</p> 
    <%}
    session.removeAttribute("logoutsuccess");
    %>
      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input type="email" class="form-control half-width" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" class="form-control half-width" id="exampleInputPassword1" name="password">
      </div>
      <button type="submit" class="btn btn-primary  bg-warning">Login</button>
    </form>
  </div>
</div>


	</div>
</body>
</html>