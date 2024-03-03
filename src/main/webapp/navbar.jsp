<%@ page import="com.tech.book.helper.ConnectionProvider"%>
<%@ page import="com.tech.book.entities.Message"%>
<%@ page import="com.tech.book.entities.Category"%>
<%@ page import="com.tech.book.entities.Post"%>
<%@ page import="com.tech.book.dao.PostDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!-- getting postdao object which is used at multiple places in this page-->
<%
PostDao pdao = new PostDao(ConnectionProvider.getConnection());
%>

<nav class="navbar navbar-expand-md sticky-top primary-color">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa fa-book"></i> Tech<span style="color:red;">B</span>ook</a>
    <button class="navbar-toggler navbar-dark border" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa fa-home"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#"><i class="fa fa-users"></i> About</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa fa-tasks"></i> Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          
          
          	<%
				ArrayList<Category> list = pdao.getAllCategories();
				for (Category cc : list) {
				%>
				<li><a class="dropdown-item" href="/TechBook/profile.jsp"><%=cc.getcName().toUpperCase()%></a></li>
				<%
				}
			%>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="login.jsp"><i class="fa fa-user"></i> LogIn</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="register.jsp"><i class="fa fa-user-plus"></i> Register</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>