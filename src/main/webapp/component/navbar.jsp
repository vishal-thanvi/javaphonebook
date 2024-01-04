<%@ page import="com.entity.User"%>

<nav class="navbar navbar-expand-lg navbar-light bg-warning text-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">PHONE BOOK</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"> <i
						class="fa-solid fa-house-flag"></i> <span class="ms-2">Home</span>
				</a></li>

				<li class="nav-item"><a class="nav-link active" href="addcont.jsp">
						<i class="fa-solid fa-address-book "></i> <span
						class="ms-2">Add contact</span>
				</a></li>
				<li class="nav-item"><a class="nav-link active" href="viewContact.jsp">
						<i class="fa-solid fa-eye "></i> <span class="ml-2">View saved 
							contacts</span>
				</a></li>

			</ul>
			<!-- Add Font Awesome CSS link in your HTML <head> section -->
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

			<%
			User user = (User) session.getAttribute("user");
			if (user == null) {
			%>
			<form class="d-flex">
				<a href="register.jsp" class="btn btn-success"><span
					class="mr-2"><i class="fa-solid fa-folder-plus"></i>
						Register</a>
				<!-- Use a valid Font Awesome class for the desired icon -->
				<a href="login.jsp" class="btn btn-danger"> <span class="mr-2"></span>
					<i class="fas fa-arrow-right"></i> Login
				</a>
			</form>
			<%
			} else {
			%>
			<a href="#" class="btn btn-danger"> <span class="mr-2"></span> <i
				class="fa-solid fa-user"></i></i> <%=user.getName()%>
			</a> <a data-bs-toggle="modal" data-bs-target="#staticBackdrop"  class="btn btn-secondary"> <span class="mr-2"></span>
				<i class="fa-solid fa-user"></i></i>logout
			</a>

			<%
			}
			%>


		</div>
	</div>
</nav>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Do you want to logout</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" href="logout"></button>
      </div>
      <div class="modal-body">
       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <a type="button" class="btn btn-primary" href="logout">logout</a>
      </div>
     
    </div>
  </div>
</div>

<!-- logout bootstrap modal-->