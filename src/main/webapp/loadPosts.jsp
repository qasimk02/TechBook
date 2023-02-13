<%@ page import="java.util.List"%>
<%@ page import="com.tech.book.entities.Post"%>
<%@ page import="com.tech.book.dao.PostDao"%>
<%@ page import="com.tech.book.dao.LikeDao"%>
<%@ page import="com.tech.book.dao.CommentDao"%>
<%@ page import="com.tech.book.entities.User"%>
<%@ page import="com.tech.book.helper.ConnectionProvider"%>
<%
User user = (User) session.getAttribute("currentUser");
PostDao pdao = new PostDao(ConnectionProvider.getConnection());
int id = Integer.parseInt(request.getParameter("id"));
boolean isUser = Boolean.parseBoolean(request.getParameter("isUser"));

List<Post> postLists = null;
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

CommentDao cmntdao = new CommentDao(ConnectionProvider.getConnection());
%>
<div class="card">
	<%
	for (Post post : postLists) {
	%>


	<div class="row">
		<div class="col-md-3">
			<img width="100%" src="blog_pics/<%=post.getpPic()%>"
				class="img-fluid rounded-start" alt="blog_pic">
		</div>
		<div class="col-md-9">
			<div class="h-100 d-flex flex-column justify-content-between ">
				<div class="card-body">
					<h5 class="card-title">
						<a href="show_blog_page.jsp?postId=<%=post.getpId()%>"
							style="text-decoration: none; color: black;"><%=post.getpTitle()%></a>
					</h5>
					<p class="card-text"><%=post.getpContent().substring(0, Math.min(post.getpContent().length(), 200))%>...
					</p>

				</div>
				<div class="card-footer p-3">
					<!-- Like dao object -->
					<%
					LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
					int lcount = ldao.getLikeOnPost(post.getpId());
					%>
					<p onClick="doLike(<%=post.getpId()%>,<%=user.getId()%>,this)"
						class="btn btn-outline-primary btn-sm">
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
					<p class="btn btn-outline-primary btn-sm">
						<i class="fa fa-commenting-o"></i> <span><%=cmntdao.getTotalCommentOnPost(post.getpId())%></span>
					</p>
					<p class="card-text" style="float: right;">
						<small class="text-muted"><%=post.getpDate()%></small>
					</p>
				</div>
			</div>
		</div>
	</div>
	<hr>


	<%
	}
	%>
</div>