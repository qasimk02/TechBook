package com.tech.book.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.book.dao.PostDao;
import com.tech.book.entities.Post;
import com.tech.book.entities.User;
import com.tech.book.helper.ConnectionProvider;
import com.tech.book.helper.Helper;


@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddPostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int cId = Integer.parseInt(request.getParameter("cId"));
		String pTitle = request.getParameter("postTitle");
		String pContent = request.getParameter("postContent");
		String pCode = request.getParameter("postCode");
		Part part = request.getPart("postProfile");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		Post post = new Post(pTitle,pContent,pCode,part.getSubmittedFileName(),cId,user.getId());
		
		//Insert into db
		PostDao pdao = new PostDao(ConnectionProvider.getConnection());
		if(pdao.savePost(post)) {
			String path = request.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			out.println("done");
		}else {
			out.println("error");
		}
	}

}
