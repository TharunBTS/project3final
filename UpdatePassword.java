package com.example.QuizProject.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.QuizProject.dao.AdminDAO;

@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		AdminDAO adminDAO = new AdminDAO();
		String password = request.getParameter("newpassword");
		
		boolean updated = adminDAO.updatePassword( password);
		if(updated)
		{
			response.sendRedirect("adminLogin.jsp");
		}
		else
		{
			response.sendRedirect("adminDashboard.jsp");
		}
	}

}
