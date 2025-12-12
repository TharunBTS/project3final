<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Result</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h2 {
        color: #333;
        margin-top: 50px;
    }

    p {
        font-size: 18px;
        color: #555;
        margin: 20px 0;
    }

    b {
        color: #4CAF50;
    }

    a {
        display: inline-block;
        margin-top: 30px;
        text-decoration: none;
        color: white;
        background-color: #4CAF50;
        padding: 12px 25px;
        border-radius: 5px;
        transition: 0.3s;
        font-size: 16px;
    }

    a:hover {
        background-color: #45a049;
    }

    /* Optional: Add a result box */
    .result-box {
        background-color: #fff;
        padding: 30px 40px;
        margin-top: 50px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        text-align: center;
    }
</style>
</head>
<body>

<div class="result-box">
    <h2>Quiz Result</h2>
    <p>Your Score: <b>${score}</b> out of <b>${total}</b></p>
    <a href="viewQuizzes">Go Back to All Quizzes</a>
</div>

</body>
</html>
