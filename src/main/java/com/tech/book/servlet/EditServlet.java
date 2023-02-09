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

import com.tech.book.entities.Message;
import com.tech.book.dao.UserDao;
import com.tech.book.entities.User;
import com.tech.book.helper.ConnectionProvider;
import com.tech.book.helper.Helper;


@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//fetching all the updated data
		String updatedName = request.getParameter("updated_name");
		String updatedEmail = request.getParameter("updated_email");
		String updatedPassword = request.getParameter("updated_password");
		String updatedAbout = request.getParameter("updated_about");
		Part part = request.getPart("updated_profile");
		String updatedProfileName = part.getSubmittedFileName();
		
		//Get the user from the session
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");   
		
		user.setName(updatedName);
		user.setEmail(updatedEmail);
		user.setPassword(updatedPassword);
		user.setAbout(updatedAbout);
		String oldProfile = user.getProfile();
		user.setProfile(updatedProfileName);
		
		//update into database
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		if(dao.updateUser(user)) {
			@SuppressWarnings("deprecation")
			String OldProfilePath = request.getRealPath("/")+"pics"+File.separator+oldProfile;
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			
			//deleting the image from pics
			if(!oldProfile.equals("default.png")) {
				Helper.deleteFile(OldProfilePath);
			}
//          F:\1_Programming\Java_complete\Jsp and Servlet\Code\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps
			//Saving updated profile pic to pics
			if(Helper.saveFile(part.getInputStream(), path)) {
				out.println("Profile updated successfully");
				Message msg = new Message("Profile Updated Successfully","success","alert-success");
				session.setAttribute("msg",msg);
				
			}else {
				Message msg = new Message("Something went wrong","error","alert-danger");
				session.setAttribute("msg",msg);
				out.println("Something went wrong");
			}
		}else {
			Message msg = new Message("Something went wrong","error","alert-danger");
			session.setAttribute("msg",msg);
			out.println("Something went wrong");
		}
		response.sendRedirect("profile.jsp");
	}

}
