package com.example.QuizProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.QuizProject.model.Question;
import com.example.QuizProject.model.Quiz;
import com.example.QuizProject.model.Result;

public class QuizDAO {

    private Connection con;

    public QuizDAO(Connection con) {
        this.con = con;
    }

	public int saveQuiz(String quizName) {
        int quizId = 0;
        try {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO quiz(quiz_name) VALUES(?)",
                Statement.RETURN_GENERATED_KEYS
            );

            ps.setString(1, quizName);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                quizId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return quizId;
    }

    public void saveQuizQuestions(int quizId, String[] qids) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO quiz_questions(quiz_id, question_id) VALUES(?,?)"
            );

            for (String qid : qids) {
                ps.setInt(1, quizId);
                ps.setInt(2, Integer.parseInt(qid));
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Quiz> getAllQuizzes() {
        List<Quiz> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM quiz";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Quiz q = new Quiz();
                q.setId(rs.getInt("id"));
                q.setQuizName(rs.getString("quiz_name"));
                list.add(q);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<Question> getQuestionsByQuizId(int quizId) {
        List<Question> list = new ArrayList<>();
        try {
            String sql = "SELECT q.* FROM questions q "
                       + "JOIN quiz_questions qq ON q.id = qq.question_id "
                       + "WHERE qq.quiz_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, quizId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setOptionA(rs.getString("optionA"));
                q.setOptionB(rs.getString("optionB"));
                q.setOptionC(rs.getString("optionC"));
                q.setOptionD(rs.getString("optionD"));
                q.setCorrectAnswer(rs.getString("correctAnswer"));
                list.add(q);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    
    public List<Result> getLeaderboard(int quizId) {
        List<Result> list = new ArrayList<>();

        String sql = "SELECT username, score FROM results WHERE quiz_id = ? ORDER BY score DESC LIMIT 10";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, quizId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Result r = new Result();
                r.setUsername(rs.getString("username"));
                r.setScore(rs.getInt("score"));
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    
    
}
