<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp | TechBook</title>
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
	<main>
		<div class="height d-flex bg-img" style="height: 95vh;">
			<div class="container">
				<div class="row">
					<div class="col-md-8 offset-md-2 mt-1">
						<div class="card">
							<div class="card-header text-white primary-color text-center">
								<span><i class="fa fa-user-plus fa-3x"></i></span>
								<h2>Register</h2>
							</div>
							<div class="card-body">
								<form id="reg-form" class="container" action="RegisterServlet"
									method="post">
									<div class="mb-2 d-flex gap-2">
										<div class="col-md-6">
											<label for="exampleInputName1" class="form-label">Name</label>
											<input name="user_name"  type="text" class="form-control"
												id="exampleInputName1">
										</div>
										<div class="col-md-6">
											<label for="exampleInputEmail1" class="form-label">Email
												address</label> <input name="user_email" required type="email"
												class="form-control" id="exampleInputEmail1"
												aria-describedby="emailHelp">
											<div id="emailHelp" class="form-text"
												style="font-size: 1.1vw;">We'll never share your email
												with anyone else.</div>
										</div>
									</div>
									<div class="mb-2 d-flex gap-2">
										<div class="col-md-6">
											<label for="exampleInputPassword1" class="form-label">Password</label>
											<input name="user_password" type="password" required
												class="form-control" id="exampleInputPassword1">
										</div>
										<div class="col-md-6">
											<label for="exampleInputAddress1" class="form-label">Address</label>
											<input name="user_address" type="text" class="form-control"
												id="exampleInputAddress1">
										</div>
									</div>

									<div class="form-group mb-2">
										<label for="gender">Select Gender</label> <br> <input
											type="radio" id="male" name="gender" value="Male"> <label
											for="male">Male</label> <input type="radio" id="female"
											name="gender" value="Female"> <label for="female">
											Female</label>
									</div>
									<div class="col-md-12 form-group mb-2">
										<textarea id="about" class="form-control" name="about"
											rows="5" placeholder="Write something about yourself"></textarea>
									</div>
									<div class="mb-2 form-group">
										<input name="check" type="checkbox" class="form-check-input"
											id="exampleCheck1"> <label class="form-check-label"
											for="exampleCheck1">Agree Terms and Conditions</label>
									</div>
									<div class="text-center" id="loader" style="display: none;">
										<span><i class="fa fa-refresh fa-spin fa-3x"></i></span>
										<h5>Please wait...</h5>
									</div>
									<div class="text-center">
										<button type="submit" id="submit-btn"
											class="btn btn-outline-primary primary-color">Register</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded....")
			$('#reg-form').on('submit', function(event) {
				event.preventDefault();

				let form = new FormData(this);
				$('#loader').show();
				$('#submit-btn').hide();
				$.ajax({
					url : 'RegisterServlet',
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						$('#loader').hide();
						$('#submit-btn').show();
						if(data.trim()==='done'){
							swal("Registered succesfully.Redirecting to login page")
							.then((value) => {
							 	window.location = 'login.jsp';
							});
						}else{
							swal(data);
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						$('#loader').hide();
						$('#submit-btn').show();
						swal("Something went wrong..");
					},
					processData : false,
					contentType : false
				});
			})
		})
	</script>
</body>
</html>