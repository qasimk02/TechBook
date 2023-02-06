package com.tech.book.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.book.dao.UserDao;
import com.tech.book.entities.Message;
import com.tech.book.entities.User;
import com.tech.book.helper.ConnectionProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//login
		//fetching email and password
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User user = dao.getUserByEmailAndPassword(email, password);
		
		if(user==null) {
			//user not  found
			//out.println("Invalid details try again");
			Message msg = new Message("Invalid Details! Please try again","error","alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");
			
		}else {
			HttpSession s = request.getSession();
			s.setAttribute("currentUser",user);
			response.sendRedirect("profile.jsp");
		}
		
	}

}
