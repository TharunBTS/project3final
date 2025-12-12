package com.example.QuizProject.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.QuizProject.dao.QuestionDAO;

@WebServlet("/deleteQuestion")
public class DeleteQuestionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws IOException {

        int id = Integer.parseInt(
                 request.getParameter("id"));

        QuestionDAO.delete(id);

        response.sendRedirect("adminDashboard.jsp");
    }
}
