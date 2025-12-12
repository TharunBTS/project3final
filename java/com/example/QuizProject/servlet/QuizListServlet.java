//package com.example.QuizProject.servlet;
//
//
//
//
//import javax.servlet.*;
//import javax.servlet.http.*;
//
//import com.example.QuizProject.dao.QuizDAO;
//import com.example.QuizProject.model.Quiz;
//import com.example.QuizProject.util.DBConnection;
//
//import javax.servlet.annotation.*;
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.List;
//
//
//
//@WebServlet("/viewQuizzes")
//public class QuizListServlet extends HttpServlet {
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        // User must be logged in
//        HttpSession session = request.getSession(false);
//        if (session == null || session.getAttribute("userObj") == null) {
//            response.sendRedirect("userLogin.jsp");
//            return;
//        }
//
//        
//        QuizDAO dao;
//		try {
//			dao = new QuizDAO(DBConnection.getConnection());
//			List<Quiz> list = dao.getAllQuizzes();
//			request.setAttribute("quizList", list);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//        
//
//        
//
//        RequestDispatcher rd = request.getRequestDispatcher("viewQuizzes.jsp");
//        rd.forward(request, response);
//    }
//}
