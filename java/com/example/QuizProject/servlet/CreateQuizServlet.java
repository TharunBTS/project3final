package com.example.QuizProject.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.QuizProject.dao.QuizDAO;
import com.example.QuizProject.util.DBConnection;

@WebServlet("/createQuiz")
public class CreateQuizServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException {


        String name = request.getParameter("quizName");
        String[] questionIds = request.getParameterValues("questionIds");

        int quizId = -1;

        try {
        	QuizDAO quizDAO = new QuizDAO(DBConnection.getConnection()); 
            // Correct: call NON-STATIC
            quizId = quizDAO.saveQuiz(name);

            if (quizId > 0 && questionIds != null) {
                quizDAO.saveQuizQuestions(quizId, questionIds);
            } else {
                System.out.println("Quiz ID not created or no questions selected.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("adminDashboard.jsp");
    }
}
