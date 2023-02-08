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
for (Post post : postLists) {
%>

<div class="card">
	<div class="row">
		<div class="col-md-3">
			<img src="blog_pics/<%=post.getpPic()%>"
				class="img-fluid rounded-start" alt="blog_pic"
				style="max-width: 200px;">
		</div>
		<div class="col-md-9">
			<div class="card-body">
				<h5 class="card-title"><%=post.getpTitle()%></h5>
				<p class="card-text"><%=post.getpContent().substring(0, Math.min(post.getpContent().length(), 100))%>...
				</p>
				<pre class="card-text"><%=post.getpCode()%></pre>
				<p class="card-text">
					<small class="text-muted"><%=post.getpDate()%></small>
				</p>
			</div>
		</div>
	</div>
</div>

<%
}
%>