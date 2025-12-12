package com.example.QuizProject.model;


public class Quiz {

    private int id;
    private String quizName;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getQuizName() {
        return quizName;
    }
    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }
	@Override
	public String toString() {
		return "Quiz [id=" + id + ", quizName=" + quizName + "]";
	}
    
    
    
    
    
}
