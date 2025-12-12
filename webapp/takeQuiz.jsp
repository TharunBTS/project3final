<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Questions</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f4f8;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
    }

    .quiz-container {
        background-color: #fff;
        padding: 40px 50px;
        margin: 40px 0;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        width: 600px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }

    p {
        font-weight: bold;
        color: #555;
        margin: 15px 0 10px;
    }

    input[type="radio"] {
        margin-right: 10px;
        margin-bottom: 10px;
        cursor: pointer;
    }

    hr {
        border: 0;
        border-top: 1px solid #ddd;
        margin: 20px 0;
    }

    button {
        display: block;
        width: 100%;
        padding: 12px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 20px;
    }

    button:hover {
        background-color: #45a049;
    }

   
</style>
</head>
<body>

<div class="quiz-container">
    <h2>Quiz Questions</h2>
    <form action="submitQuiz" method="post">
        <input type="hidden" name="quizId" value="${quizId}">

        <c:forEach var="q" items="${questions}">
            <p>${q.question}</p>

            <label><input type="radio" name="ans_${q.id}" value="A">${q.optionA}</label><br>
            <label><input type="radio" name="ans_${q.id}" value="B">${q.optionB}</label><br>
            <label><input type="radio" name="ans_${q.id}" value="C">${q.optionC}</label><br>
            <label><input type="radio" name="ans_${q.id}" value="D">${q.optionD}</label><br>

            <hr>
        </c:forEach>

        <button type="submit">Submit Quiz</button>
    </form>
</div>

</body>
</html>
