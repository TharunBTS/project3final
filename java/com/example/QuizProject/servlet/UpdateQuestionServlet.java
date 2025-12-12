package com.example.QuizProject.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.QuizProject.dao.QuestionDAO;
import com.example.QuizProject.model.Question;

@WebServlet("/updateQuestion")
public class UpdateQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException {

        Question q = new Question();

        q.setId(
          Integer.parseInt(
            request.getParameter("id")));

        q.setQuestion(
           request.getParameter("question"));

        q.setOptionA(
           request.getParameter("optionA"));

        q.setOptionB(
           request.getParameter("optionB"));

        q.setOptionC(
           request.getParameter("optionC"));

        q.setOptionD(
           request.getParameter("optionD"));

        q.setCorrectAnswer(
           request.getParameter("correct"));

        QuestionDAO.update(q);

        response.sendRedirect(
            "adminDashboard.jsp");
    }
}
