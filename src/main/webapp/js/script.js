
//deleting comment asynchroniously
function deleteComment(cmntId) {
	const data = { cmntId: cmntId };
	$.ajax({
		url: 'DeleteCommentServlet',
		method: 'POST',
		data: data,
		success: function(data, textStatus, jqXHR) {
			if (data.trim() === "done") {
				//window.location.reload(); reload the entire page
				$("#reload").load(location.href + " #reload");
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
		}
	})
}

//adding comment asynchroniously
//$(document).ready(function() {
function addComment() {
	$('#add-cmnt-form').on('submit', function(event) {
		event.preventDefault();

		let form = new FormData(this);
		$.ajax({
			url: 'CommentServlet',
			type: 'POST',
			data: form,
			success: function(data, textStatus, jqXHR) {
				if (data.trim() === "done") {
					//window.location.reload();
					//history.go(0);
					$("#reload").load(location.href + " #reload");
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(errorThrown)
			},
			processData: false,
			contentType: false
		})
	})
}
//});


//loading post asynchronously 
function getPosts(id, temp, isUser) {
	$("#loader").show();
	$("#postContainer").hide();

	$(".c-link").removeClass('active');
	$.ajax({
		url: "loadPosts.jsp",
		data: { id: id, isUser: isUser },
		success: function(data, textStatus, jqXHR) {
			$("#loader").hide();
			$("#postContainer").show();
			$("#postContainer").html(data);
			$(temp).addClass('active');
		}
	})
}
$(document).ready(function() {
	let allPostRef = $(".c-link")[0];
	getPosts(0, allPostRef, false);
})

//adding like
function doLike(pid, uid, clickedClass) {
	const data = {
		pid: pid,
		uid: uid
	}

	$.ajax({
		url: "LikeServlet",
		type: "post",
		data: data,
		success: function(data, textStatus, jqXHR) {
			clickedClass.getElementsByTagName("i")[0].classList.toggle("fa-thumbs-down");
			if (data.trim() === "liked") {
				let c = clickedClass.getElementsByClassName('like-counter')[0];
				let nLike = c.innerHTML;
				nLike++;
				c.innerHTML = nLike;

			} else if (data.trim() === "disliked") {
				let c = clickedClass.getElementsByClassName('like-counter')[0];
				let nLike = c.innerHTML;
				nLike--;
				c.innerHTML = nLike;
			}
		},
		error: function(jqXHR, textStatuts, errorThrown) {
			console.log(errorThrown);
		}
	})
}
