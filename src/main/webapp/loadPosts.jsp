<%@ page import="java.util.List"%>
<%@ page import="com.tech.book.entities.Post"%>
<%@ page import="com.tech.book.dao.PostDao"%>
<%@ page import="com.tech.book.helper.ConnectionProvider"%>
<%
PostDao pdao = new PostDao(ConnectionProvider.getConnection());
int id = Integer.parseInt(request.getParameter("id"));
boolean isUser = Boolean.parseBoolean(request.getParameter("isUser"));

List<Post> postLists = null;
System.out.println(isUser);
if (isUser == true) {
	postLists = pdao.getAllPostByUserId(id);
} else {
	if (id == 0) {
		postLists = pdao.getAllPost();
	} else {
		postLists = pdao.getAllPostByCatId(id);
	}
}
if (postLists.size() == 0) {
	out.println("<h5 class='display-3 text-center' style='color:green'>No Posts in this Category</h5>");
	return;
}
%>
<div class="card">
	<%
	for (Post post : postLists) {
	%>


	<div class="row">
		<div class="col-md-3">
			<img src="blog_pics/<%=post.getpPic()%>"
				class="img-fluid rounded-start" alt="blog_pic">
		</div>
		<div class="col-md-9">
			<div class="card-body">
				<h5 class="card-title">
					<a href="show_blog_page.jsp?postId=<%=post.getpId()%>"
						style="text-decoration: none; color: black;"><%=post.getpTitle()%></a>
				</h5>
				<p class="card-text"><%=post.getpContent().substring(0, Math.min(post.getpContent().length(), 100))%>...
				</p>

			</div>
			<div class="card-footer p-3">
				<a href="#!" class="btn btn-outline-primary btn-sm"><i
					class="fa fa-thumbs-o-up"></i><span>20</span></a> <a href="#!"
					class="btn btn-outline-primary btn-sm"><i
					class="fa fa-commenting-o"></i><span>20</span></a>
				<p class="card-text" style="float: right;">
					<small class="text-muted"><%=post.getpDate()%></small>
				</p>
			</div>
		</div>
	</div>
	<hr>


	<%
	}
	%>
</div>