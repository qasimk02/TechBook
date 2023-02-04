<%@page import="com.tech.book.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width-device-width, initial-scale=1.0">
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
<title>TechBook | Qasim</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- Body -->
	<div class="container-fluid p-0 m-0" style="position: relative;">
		<div class="jumbotron">
			<img src="img/bodyImg.jfif" class="img-fluid" alt="blog">
			<div class="container">
				<h2 class="bodyImgHeader opacity-75">
					Tech<span style="color: red;">B</span>ook - A blog (a truncation of
					"weblog") is an informational website published on the World Wide
					Web consisting of discrete, often informal diary-style text entries
					(posts). Posts are typically displayed in reverse chronological
					order so that the most recent post appears first, at the top of the
					web page.
				</h2>
				<div class="row bodyImgSignup">
					<div class="col-md-4 col-lg-2">
						<a class="btn btn-outline-light btn-block" href="#">Register</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- cards -->
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<!-- <img src="..." class="card-img-top" alt="...">-->
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<!-- <img src="..." class="card-img-top" alt="...">-->
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<!-- <img src="..." class="card-img-top" alt="...">-->
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<!-- <img src="..." class="card-img-top" alt="...">-->
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<!-- <img src="..." class="card-img-top" alt="...">-->
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<!-- <img src="..." class="card-img-top" alt="...">-->
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->

	<div class="mt-5" style="color: white;">
		<footer class="nb-footer primary-color" style="padding: 10px;">
			<div class="row">
				<div class="col-sm-12">
					<div class="about">
						<div class="social-media">
							<ul class="list-inline d-flex">
								<li class="mx-5"><a href="http://www.nextbootstrap.com/"
									title=""><i class="fa fa-facebook"></i></a></li>
								<li class="mx-5"><a href="http://www.nextbootstrap.com/"
									title=""><i class="fa fa-twitter"></i></a></li>
								<li class="mx-5"><a href="http://www.nextbootstrap.com/"
									title=""><i class="fa fa-google-plus"></i></a></li>
								<li class="mx-5"><a href="http://www.nextbootstrap.com/"
									title=""><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
						<p>Bootstrap Footer example snippets with CSS, Javascript and
							HTML. Code example of bootstrap-3 footer using HTML, Javascript,
							jQuery, and CSS. 5 Beautiful and Responsive Footer Templates. Pin
							a fixed-height footer to the bottom of the viewport in desktop
							browsers with this custom HTML and CSS.</p>
					</div>
				</div>
				<hr>
				<div class="col-md-3 col-sm-6">
					<div class="footer-info-single">
						<h2 class="title">Help Center</h2>
						<ul class="list-unstyled">
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> How to Pay</a></li>
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> FAQ's</a></li>
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> Sitemap</a></li>
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> Delivery Info</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-info-single">
						<h2 class="title">Customer information</h2>
						<ul class="list-unstyled">
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> About Us</a></li>
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> FAQ's</a></li>
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> Sell Your Items</a></li>
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> Contact Us</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-info-single">
						<h2 class="title">Security & privacy</h2>
						<ul class="list-unstyled">
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> Terms Of Use</a></li>
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> Privacy Policy</a></li>
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> Return / Refund Policy</a></li>
							<li><a href="http://www.nextbootstrap.com/" title=""><i
									class="fa fa-angle-double-right"></i> Store Locations</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-info-single">
						<h2 class="title">Payment</h2>
						<p>Sample HTML page with Twitter's Bootstrap. Code example of
							Easy Sticky Footer using HTML, Javascript, jQuery, and CSS. This
							bootstrap tutorial covers all the major elements of responsive</p>

					</div>
				</div>
			</div>

			<section class="copyright text-center">
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							<p>Copyright � 2017. Your Company.</p>
						</div>
						<div class="col-sm-6"></div>
					</div>
				</div>
			</section>
		</footer>
	</div>

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