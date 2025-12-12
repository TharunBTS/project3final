package com.example.QuizProject.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.QuizProject.dao.ResultDAO;
import com.example.QuizProject.model.Result;
import com.example.QuizProject.util.DBConnection;

@WebServlet("/LeaderboardServlet")
public class LeaderboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int quizId = Integer.parseInt(request.getParameter("quizId"));

        ResultDAO resultDAO = new ResultDAO();
        List<Result> leaderboard = resultDAO.getLeaderboard(quizId);

        request.setAttribute("leaderboard", leaderboard);
        request.setAttribute("quizId", quizId);

        RequestDispatcher rd = request.getRequestDispatcher("leaderboard.jsp");
        rd.forward(request, response);
    }
}
