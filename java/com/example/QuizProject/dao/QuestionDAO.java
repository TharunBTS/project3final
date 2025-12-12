package com.example.QuizProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.QuizProject.model.Question;
import com.example.QuizProject.util.DBConnection;

public class QuestionDAO {

	public static void saveQuestion(Question q) {

		String sql = "INSERT INTO questions " + "(question, optionA, optionB, optionC, optionD, correctAnswer) "
				+ "VALUES (?,?,?,?,?,?)";

		try {

			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, q.getQuestion());
			ps.setString(2, q.getOptionA());
			ps.setString(3, q.getOptionB());
			ps.setString(4, q.getOptionC());
			ps.setString(5, q.getOptionD());
			ps.setString(6, q.getCorrectAnswer());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<Question> getAllQuestions() {

		List<Question> list = new ArrayList<>();

		try {
			Connection con = DBConnection.getConnection();
			String sql = "SELECT * FROM questions";

			PreparedStatement ps = con.prepareStatement(sql);
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
	
	
	
	public static void delete(int id) {

	    try {
	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps =
	            con.prepareStatement(
	              "DELETE FROM questions WHERE id=?");

	        ps.setInt(1, id);
	        ps.executeUpdate();

	        con.close();
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	    }
	}

	
	public static Question getById(int id) {
	    Question q = new Question();
	    try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps =
	           con.prepareStatement(
	               "SELECT * FROM questions WHERE id=?");

	        ps.setInt(1, id);

	        ResultSet rs = ps.executeQuery();
	        if(rs.next()) {

	            q.setId(rs.getInt("id"));
	            q.setQuestion(rs.getString("question"));
	            q.setOptionA(rs.getString("optionA"));
	            q.setOptionB(rs.getString("optionB"));
	            q.setOptionC(rs.getString("optionC"));
	            q.setOptionD(rs.getString("optionD"));
	            q.setCorrectAnswer(
	                  rs.getString("correctAnswer"));
	        }
	        con.close();
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	    }
	    return q;
	}



	public static void update(Question q) {
	    try {
	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps =
	          con.prepareStatement(
	            "UPDATE questions SET "
	          + "question=?, optionA=?, optionB=?, "
	          + "optionC=?, optionD=?, correctAnswer=? "
	          + "WHERE id=?");

	        ps.setString(1, q.getQuestion());
	        ps.setString(2, q.getOptionA());
	        ps.setString(3, q.getOptionB());
	        ps.setString(4, q.getOptionC());
	        ps.setString(5, q.getOptionD());
	        ps.setString(6, q.getCorrectAnswer());
	        ps.setInt(7, q.getId());

	        ps.executeUpdate();
	        con.close();
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	    }
	}

	
	
	
	

}
