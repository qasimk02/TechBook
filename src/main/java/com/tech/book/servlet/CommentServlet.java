package com.tech.book.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.book.dao.CommentDao;
import com.tech.book.helper.ConnectionProvider;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CommentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String comment = request.getParameter("cmnt-content");
		int pId = Integer.parseInt(request.getParameter("pId"));
		int uId = Integer.parseInt(request.getParameter("uId"));
		out.println(pId);
		out.println(uId);
		System.out.println(pId);
		System.out.println(uId);
		CommentDao cmntdao = new CommentDao(ConnectionProvider.getConnection());
		cmntdao.insertComment(comment, pId, uId);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
