package com.example.QuizProject.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.example.QuizProject.dao.QuizDAO;
import com.example.QuizProject.dao.ResultDAO;
import com.example.QuizProject.model.Question;
import com.example.QuizProject.model.User;
import com.example.QuizProject.util.DBConnection;

@WebServlet("/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int quizId = Integer.parseInt(request.getParameter("quizId"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userObj");

        if (user == null) {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        String username = user.getUsername();

        try {
            QuizDAO dao = new QuizDAO(DBConnection.getConnection());

            int score = 0;
            List<Question> questions = dao.getQuestionsByQuizId(quizId);

            for (Question q : questions) {
                String userAnswer = request.getParameter("ans_" + q.getId());
                if (userAnswer != null && userAnswer.equals(q.getCorrectAnswer())) {
                    score++;
                }
            }

            // Save result
            ResultDAO resultDAO = new ResultDAO();
            resultDAO.saveResult(username, quizId, score);

            request.setAttribute("score", score);
            request.setAttribute("total", questions.size());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }
}
