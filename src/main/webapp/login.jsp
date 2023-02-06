<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.book.entities.Message"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignIn | TechBook</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Font Awesome css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/index.css">
</head>

<body>
	<!-- Navbar -->
	<%@ include file="navbar.jsp"%>

	<!-- SignIn form -->
	<div class="d-flex align-items-center bg-img" style="height: 89vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4 ">
					<div class="card">
						<div class="card-header text-white primary-color text-center">
							<span><i class="fa fa-user fa-3x"></i></span>
							<h2>LogIn</h2>
						</div>

						<%
						Message msg = (Message) session.getAttribute("msg");
						if (msg != null) {
						%>
						<div class="alert <%=msg.getCssClass()%>" role="alert">
							<%=msg.getContent()%>
						</div>
						<%
						session.removeAttribute("msg");
						}
						%>


						<div class="card-body">
							<form id="login_form" action="LoginServlet" method="post">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input name="user_email" type="email"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="user_password" type="password"
										class="form-control" id="exampleInputPassword1">
								</div>
								<div class="mb-3 form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Remember Me</label>
								</div>
								<div class="text-center">
									<button type="submit" id="submit-btn"
										class="btn btn-outline-primary primary-color text-white">LogIn</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
</body>

</html>