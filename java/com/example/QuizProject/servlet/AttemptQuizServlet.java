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

@WebServlet("/attemptQuiz")
public class AttemptQuizServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int quizId = Integer.parseInt(request.getParameter("id"));

        List<Question> qList;
		try {
			QuizDAO dao = new QuizDAO(DBConnection.getConnection());
			qList = dao.getQuestionsByQuizId(quizId);
			request.setAttribute("quizId", quizId);
	        request.setAttribute("questionList", qList);

	        RequestDispatcher rd = request.getRequestDispatcher("attemptQuiz.jsp");
	        rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
    }
}
