package com.example.QuizProject.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.QuizProject.dao.AdminDAO;

@WebServlet("/updateAdminPassword")
public class UpdateAdminPasswordServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		AdminDAO adminDAO = new AdminDAO();
		String password = request.getParameter("newpassword");
		
		request.setAttribute("password", password);
		
		RequestDispatcher rd = request.getRequestDispatcher("updateAdminPassword.jsp");
		rd.forward(request, response);
		
		
//		boolean updated = adminDAO.updatePassword(username, password);
//		if(updated)
//		{
//			response.sendRedirect("adminLogin.jsp");
//		}
//		else
//		{
//			response.sendRedirect("adminDashboard.jsp");
//		}
	}

}
