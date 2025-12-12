package com.example.QuizProject.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.QuizProject.dao.QuizDAO;
import com.example.QuizProject.model.Quiz;
import com.example.QuizProject.util.DBConnection;

@WebServlet("/viewQuizzes")
public class ViewQuizzesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	
    	try
    	{
    		 QuizDAO dao = new QuizDAO(DBConnection.getConnection());
    	        List<Quiz> quizList = dao.getAllQuizzes();
    	        System.out.println(quizList);

    	        request.setAttribute("quizList", quizList);

    	        RequestDispatcher rd = request.getRequestDispatcher("viewQuizzes.jsp");
    	        rd.forward(request, response);
    	}
    	catch (Exception e) {
			e.printStackTrace();
		}
       
    }
}
