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
  #container	{
    margin-bottom: 40px;
  }
  /* Add border and shadow to the form */
  .form-container {
    border: 1px solid #ccc;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    padding: 20px;
    border-radius: 5px;
    margin-left: 10px; /* Adjust the left margin as needed */
  }
</style>
</head>
<body>
<%@include file="component/navbar.jsp"%>
<h1 style="text-align:center; margin-top:5px;">Register here</h1>
<div class="container-fluid" id="cotainer">
  <div class="row justify-content-center">
    <!-- Center the form horizontally -->
    <form class="col-md-6 form-container" action="register" method="post">
      <div class="mb-3" style="margin-top: 30px;">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control half-width" id="name" name="name" >
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control half-width" id="email" aria-describedby="emailHelp" name="email">
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control half-width" id="password" name="password">
      </div>
      <button type="submit" class="btn btn-primary bg-warning">Register</button>
    </form>
  </div>
</div>
</body>
</html>
