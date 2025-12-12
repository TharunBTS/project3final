
package com.example.QuizProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.QuizProject.model.User;
import com.example.QuizProject.util.DBConnection;

public class UserDAO {
	
	
	
	public User loginUser(String email, String password) {

	    try {
	    	Connection con = DBConnection.getConnection();
	        String sql = "SELECT * FROM users WHERE username=? AND password=?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, email);
	        ps.setString(2, password);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            User user = new User();
	            user.setId(rs.getInt("id"));
	            user.setUsername(rs.getString("username"));
	            user.setPassword(rs.getString("password"));
	            return user;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return null; // invalid login
	}

	
	
	
	
	public boolean registerUser(User user) {
        try {
        	Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO users(username, password) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	
	
	
	

}