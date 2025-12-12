<%@page import="java.util.List"%>
<%@page import="com.example.QuizProject.model.Quiz"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    if (session.getAttribute("userObj") == null) {
        response.sendRedirect("userLogin.jsp");
        return;
    }

    List<Quiz> quizList = (List<Quiz>) request.getAttribute("quizList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Available Quizzes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            padding-top: 50px;
        }

        .quiz-container {
            background-color: #fff;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 700px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 8px 15px;
            border-radius: 5px;
            transition: 0.3s;
        }

        a:hover {
            background-color: #45a049;
        }

        p {
            text-align: center;
            color: #555;
            font-size: 16px;
        }

        
    </style>
</head>
<body>

<div class="quiz-container">
    <h2>Available Quizzes</h2>

    <c:choose>
        <c:when test="${empty quizList}">
            <p>No quizzes available.</p>
        </c:when>
        <c:otherwise>
            <table>
                <tr>
                    <th>Quiz Name</th>
                    <th>Action</th>
                    <th>Leaderboard</th>
                </tr>
                <c:forEach var="q" items="${quizList}">
                    <tr>
                        <td>${q.quizName}</td>
                        <td><a href="takeQuiz?qid=${q.id}">Take Quiz</a></td>
                        <td><a href="LeaderboardServlet?quizId=${q.id}">View Leaderboard</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
