package com.example.QuizProject.servlet;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.QuizProject.dao.UserDAO;
import com.example.QuizProject.model.User;



import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.loginUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userObj", user);
            response.sendRedirect("userHome.jsp");
        } else {
            response.sendRedirect("userLogin.jsp?msg=invalid");
        }
    }
}
