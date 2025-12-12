package com.example.QuizProject.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

import com.example.QuizProject.dao.UserDAO;
import com.example.QuizProject.model.User;

import javax.servlet.annotation.*;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(name, password);
        UserDAO dao = new UserDAO();

        boolean status = dao.registerUser(user);

        if (status) {
            response.sendRedirect("userLogin.jsp?msg=success");
        } else {
            response.sendRedirect("register.jsp?msg=failed");
        }
    }
}
