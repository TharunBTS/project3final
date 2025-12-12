package com.example.QuizProject.dao;



import java.sql.*;
import java.util.*;
import com.example.QuizProject.model.Result;
import com.example.QuizProject.util.DBConnection;

public class ResultDAO {

    public static List<Result> getAll() {

        List<Result> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                 con.prepareStatement("SELECT * FROM results");

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Result r = new Result();

                r.setId(rs.getInt("id"));
                r.setUsername(rs.getString("username"));
                r.setScore(rs.getInt("score"));

                list.add(r);
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    
    
    public void saveResult(String username, int quizId, int score) {
        String sql = "INSERT INTO results(username, quiz_id, score) VALUES(?, ?, ?)";

        try {
        	Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, quizId);
            ps.setInt(3, score);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
    public List<Result> getLeaderboard(int quizId) {
        List<Result> list = new ArrayList<>();

        String sql = "SELECT username, score FROM results WHERE quiz_id = ? ORDER BY score DESC";

        try {
        	Connection con = DBConnection.getConnection();
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
