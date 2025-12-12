package com.example.QuizProject.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.example.QuizProject.dao.QuestionDAO;
import com.example.QuizProject.model.Question;

@WebServlet("/addQuestion")
public class AddQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String question = request.getParameter("question");
        String a = request.getParameter("optionA");
        String b = request.getParameter("optionB");
        String c = request.getParameter("optionC");
        String d = request.getParameter("optionD");
        String correct = request.getParameter("correct");

        Question q = new Question();
        q.setQuestion(question);
        q.setOptionA(a);
        q.setOptionB(b);
        q.setOptionC(c);
        q.setOptionD(d);
        q.setCorrectAnswer(correct);

        QuestionDAO.saveQuestion(q);

        // redirect back to form
        response.sendRedirect("addQuestions.jsp");
    }
}
