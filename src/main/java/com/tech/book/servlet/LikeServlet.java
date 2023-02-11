package com.tech.book.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.book.dao.LikeDao;
import com.tech.book.helper.ConnectionProvider;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LikeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		//Making object of LikeDao
		LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
		if(!ldao.isLikedByUser(pid, uid)) {
			boolean isLiked = ldao.insertLike(pid, uid);
			if(isLiked) {
				out.println("liked");
			}
		}else {
			boolean isDisLiked = ldao.deleteLike(pid, uid);
			if(isDisLiked) {
				out.println("disliked");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
