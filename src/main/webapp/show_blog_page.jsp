<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.book.helper.ConnectionProvider"%>
<%@ page import="com.tech.book.entities.Message"%>
<%@ page import="com.tech.book.entities.User"%>
<%@ page import="com.tech.book.entities.Category"%>
<%@ page import="com.tech.book.entities.Comment"%>
<%@ page import="com.tech.book.entities.Post"%>
<%@ page import="com.tech.book.dao.PostDao"%>
<%@ page import="com.tech.book.dao.UserDao"%>
<%@ page import="com.tech.book.dao.CommentDao"%>
<%@ page import="com.tech.book.dao.LikeDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page errorPage="errorPage.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<!-- getting postdao object which is used at multiple places in this page-->
<%
PostDao pdao = new PostDao(ConnectionProvider.getConnection());
int pId = Integer.parseInt(request.getParameter("postId"));
Post post = pdao.getPostByPostId(pId);
UserDao udao = new UserDao(ConnectionProvider.getConnection());
User pUser = udao.getUserByUserId(post.getUserId());
%>
<%
CommentDao cmntdao = new CommentDao(ConnectionProvider.getConnection());
List<Comment> cmntList = cmntdao.getAllCommentByPostId(post.getpId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=post.getpTitle()%> || TechBlog</title>
<link rel="icon" type="image/x-icon" href="img/techbook_icon.png">
<!-- Botstrap cdn -->
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
<body class="blog-bg">
	<!-- Navbar -->

	<nav class="navbar navbar-expand-md sticky-top primary-color">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><i class="fa fa-book"></i>
				Tech<span style="color: red;">B</span>ook</a>
			<button class="navbar-toggler navbar-dark border" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp"><i class="fa fa-home"></i>
							Home</a></li>
					<li class="nav-item"><a class="nav-link active" href="#"><i
							class="fa fa-users"></i> About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link active dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fa fa-tasks"></i> Categories
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Languages</a></li>
							<li><a class="dropdown-item" href="#">Updates</a></li>
							<li><a class="dropdown-item" href="#">DataStructures</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link active"
						data-bs-toggle="modal" data-bs-target="#add-post-modal" href="#!"><i
							class="fa fa-plus-square"></i> Post</a></li>
				</ul>
				<ul class="navbar-nav mr-right">
					<!-- Trigger profile modal -->
					<li class="nav-item"><a class="nav-link active"
						data-bs-toggle="modal" data-bs-target="#profile-modal" href="#!"><i
							class="fa fa-user-circle"></i> <span><%=user.getName()%></span></a></li>
					<li class="nav-item"><a class="nav-link active"
						href="LogoutServlet"><i class="fa fa-sign-out"></i> Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>

	<!--End of Navbar -->

	<!-- Main Blog Content -->
	<div class="container-fluid">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header primary-color">
						<h4 class="post-title"><%=post.getpTitle()%></h4>
					</div>
					<div class="card-body">
						<div class="my-2 text-center">
							<img width="100%" src="blog_pics/<%=post.getpPic()%>"
								class="img-fluid rounded-start" alt="blog_pic">
						</div>
						<div class="row my-3 row-user">
							<div class="col-md-8">
								<p class="post-user-info">
									<a href="#!" style="text-decoration: none;"><%=pUser.getName()%></a>
									has posted:
								</p>
							</div>
							<div class="col-md-4">
								<p class="card-text post-date">
									<small><%=post.getpDate()%></small>
							</div>
						</div>
						<div class="mt-4">
							<p class="post-content"><%=post.getpContent()%></p>
							<br> <br>
							<div class="post-code">
								<pre><%=post.getpCode()%></pre>
							</div>
						</div>
					</div>

					<div id="reload">
						<div class="card-footer p-1 primary-color">
							<!-- Like dao object -->
							<%
							LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
							int lcount = ldao.getLikeOnPost(post.getpId());
							%>
							<p onClick="doLike(<%=post.getpId()%>,<%=user.getId()%>,this)"
								class="btn btn-outline-light btn-sm">
								<%
								if (ldao.isLikedByUser(post.getpId(), user.getId())) {
								%>
								<i class="fa fa-thumbs-o-down"></i>
								<%
								} else {
								%>
								<i class="fa fa-thumbs-o-up"></i>
								<%
								}
								%>
								<span class="like-counter"><%=lcount%></span>
							</p>
							<p class="btn btn-outline-light btn-sm">
								<i class="fa fa-commenting-o"></i> <span><%=cmntdao.getTotalCommentOnPost(post.getpId())%></span>
							</p>
						</div>
						<div class="card-footer">
							<div class="cmnt-section">
								<div class="row">
									<form id="add-cmnt-form" action="CommentServlet" method="post">
										<div class="col-md-12 form-group">
											<textarea id="inputComment" class="form-control"
												name="cmnt-content" rows="4"
												placeholder="Leave your valuable comment here"></textarea>
										</div>
										<input type="hidden" name="pId" value="<%=post.getpId()%>" />
										<input type="hidden" name="uId" value="<%=user.getId()%>" />
										<div class="d-flex my-2 float-end">
											<button type="submit" id="cmnt-submit-btn"
												onClick="addComment()"
												class="btn btn-outline-primary primary-color">Post</button>
										</div>
									</form>
								</div>
								<div class="row d-flex justify-content-center">
									<div class="col-md-12">
										<div class="card text-dark">
											<div class="card-body mb-0">
												<h4 class="mb-0">Recent comments</h4>
												<p class="fw-light mb-4 pb-2">Latest Comments section by
													users</p>
											</div>

											<%
											for (Comment cmnt : cmntList) {
												User cmntUser = udao.getUserByUserId(cmnt.getuId());
											%>
											<div class="card-body p-4">
												<div class="d-flex flex-start">
													<img class="rounded-circle shadow-1-strong me-3"
														src="pics/<%=cmntUser.getProfile()%>" alt="avatar"
														width="60" height="60" />
													<div>
														<h6 class="fw-bold mb-1"><%=cmntUser.getName()%></h6>
														<div class="d-flex align-items-center mb-3">
															<p class="mb-0"><%=cmnt.getCmntDate()%></p>
														</div>
														<p class="mb-0"><%=cmnt.getCmntContent()%></p>
														<%
														if (cmntUser.getId() == user.getId()) {
														%>
														<a href="#!" style="text-decoration: none;"
															onClick="deleteComment(<%=cmnt.getCmntId()%>)">Delete</a>
														<%
														}
														%>
													</div>
												</div>
											</div>
											<hr class="my-0" />
											<%
											}
											%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Main Blog Content -->

	<!-- Profile Modal -->

	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-color text-white">
					<h5 class="modal-title" id="exampleModalLabel">
						Tech<span style="color: red">B</span>ook
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<!-- Details -->
						<div id="profile_details">
							<img src="pics/<%=user.getProfile()%>" alt="profilePic"
								style="border-radius: 50%; max-width: 150px" /><br>
							<h5><%=user.getName()%></h5>
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email Id :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="profile_edit" class="container text-center"
							style="display: none">
							<h5 class="mt-2">Edit Carefully!</h5>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Name :</th>
										<td><input name="updated_name" required type="text"
											class="form-control" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><input name="updated_email" required type="email"
											class="form-control" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<th scope="row">Password :</th>
										<td><input name="updated_password" required
											type="password" class="form-control"
											value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">About :</th>
										<td><textarea name="updated_about" class="form-control"
												rows="3"><%=user.getAbout()%></textarea></td>
									</tr>
									<tr>
										<th>Profile :</th>
										<td><input name="updated_profile" type="file"
											class="form-control"></td>
									</tr>
								</table>
								<div>
									<button class="btn btn-primary primary-color">Save</button>
								</div>
							</form>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="profile_edit_btn" type="button"
						class="btn btn-primary primary-color">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- End of Profile Modal -->


	<!-- Post Modal -->

	<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-color text-white">
					<h5 class="modal-title" id="exampleModalLabel">
						Tech<span style="color: red">B</span>ook
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h6 class="text-center">Add your Post..</h6>
					<hr>
					<form id="add-post-form" action="AddPostServlet" method="post"
						enctype="multipart/form-data" autocomplete="off">
						<!-- Autocomplete is off for this form -->
						<div class="form-group mb-1">
							<select class="form-control" name="cId">
								<option selected disabled>---Select Your Category---</option>
								<!-- fetched the list from getAllCategories method of PostDao class above in main page content -->
								<%
								ArrayList<Category> list = pdao.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getcId()%>"><%=c.getcName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group mb-1">
							<input required class="form-control" name="postTitle" type="text"
								placeholder="Enter your post Title" />
						</div>
						<div class="form-group mb-1">
							<textarea class="form-control" name="postContent"
								placeholder="Enter your post Content" style="height: 200px"></textarea>
						</div>
						<div class="form-group mb-1">
							<textarea class="form-control" name="postCode"
								placeholder="Enter your post Code(if any)" style="height: 200px"></textarea>
						</div>
						<div class="form-group mb-1">
							<input class="form-control" type="file" name="postProfile" />
						</div>
						<div class="form-group text-center mt-2">
							<button id="submit-btn" type="submit"
								class="btn btn-primary primary-color">Post</button>
						</div>
					</form>
				</div>
				<!-- No need of modal footer -->
			</div>
		</div>
	</div>
	<div></div>
	<!-- End of Post Modal -->




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
	<script src="js/script.js"></script>

	<!-- Editing profile -->
	<script>
		$(document).ready(function() {
			let isEditable = false;
			$("#profile_edit_btn").click(function() {
				if (isEditable === false) {
					$("#profile_details").hide();
					$("#profile_edit").show();
					$(this).text("Back");
					isEditable = true;
				} else {
					$("#profile_details").show();
					$("#profile_edit").hide();
					$(this).text("Edit");
					isEditable = false;
				}
			})
		})
	</script>
	<!-- Add post Asynchroniously through javascript -->
	<script>
		$(document).ready(function() {
			$('#add-post-form').on('submit', function(event) {
				event.preventDefault();

				let form = new FormData(this);
				$.ajax({
					url : 'AddPostServlet',
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						if(data.trim()==='done'){
							swal("Good Job","Uploaded succesfully","success")
							.then((value) => {
							 	//window.location = 'show_blog_page.jsp';
							});
						}else{
							swal("Error!!","Something went wrong! Try again...","error");
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						swal("Error!!","Something went wrong! Try again...","error");
					},
					processData : false,
					contentType : false
				})
			})
		});
	</script>

	<!-- posting comment asynchronously in script.js-->

</body>
</html>