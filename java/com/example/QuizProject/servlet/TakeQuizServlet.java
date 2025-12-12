
package com.example.QuizProject.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.QuizProject.dao.QuizDAO;
import com.example.QuizProject.model.Question;
import com.example.QuizProject.util.DBConnection;

@WebServlet("/takeQuiz")
public class TakeQuizServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get the 'qid' parameter safely
        String qidParam = request.getParameter("qid");
        int quizId;

        if (qidParam == null || qidParam.isEmpty()) {
            // If missing, send an error
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Quiz id is missing");
            return;
        }

        try {
            quizId = Integer.parseInt(qidParam);
        } catch (NumberFormatException e) {
            // If not a valid number
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid quiz id");
            return;
        }

        // 2. Fetch questions from the database
        try {
            QuizDAO quizDAO = new QuizDAO(DBConnection.getConnection());
            List<Question> questions = quizDAO.getQuestionsByQuizId(quizId);
            System.out.println(questions);

            // 3. Set attributes for JSP
            request.setAttribute("questions", questions);
            request.setAttribute("quizId", quizId); // pass quizId to JSP

            // 4. Forward to takeQuiz.jsp
            RequestDispatcher rd = request.getRequestDispatcher("takeQuiz.jsp");
            rd.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
