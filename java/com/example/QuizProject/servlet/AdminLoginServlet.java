package com.example.QuizProject.servlet;



import com.example.QuizProject.dao.AdminDAO;
import com.example.QuizProject.model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    private AdminDAO adminDAO = new AdminDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // read parameters from form (simple)
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Admin admin = adminDAO.validate(username, password);

        if (admin != null) {
            // valid -> redirect to dashboard (no session used per your request)
            // we will pass admin username as a query param (simple, beginner-friendly)
            resp.sendRedirect("adminDashboard.jsp?user=" + java.net.URLEncoder.encode(admin.getUsername(), "UTF-8"));
        } else {
            // invalid -> back to login with error message param
            resp.sendRedirect("adminLogin.jsp?error=Invalid+username+or+password");
        }
    }

    // allow GET to show login page too (optional)
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("adminLogin.jsp");
    }
}
