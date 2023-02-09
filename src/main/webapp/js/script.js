
function doLike(pid, uid, clickedClass) {
	const data = {
		pid: pid,
		uid: uid,
		operation: "like"
	}

	$.ajax({
		url: "LikeServlet",
		type: "post",
		data: data,
		success: function(data, textStatus, jqXHR) {
			if (data.trim("true")) {
				let c = clickedClass.getElementsByClassName('like-counter')[0];
				let nLike = c.innerHTML;
				nLike++;
				c.innerHTML = nLike;
			}
		},
		error: function(jqXHR, textStatuts, errorThrown) {
			console.log(errorThrown);
		}
	})
}