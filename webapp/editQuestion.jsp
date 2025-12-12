<%@page import="com.example.QuizProject.model.Question"%>
<%@page import="com.example.QuizProject.dao.QuestionDAO"%>
<%@ page import="com.example.QuizProject.model.*, com.example.QuizProject.dao.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Question q = QuestionDAO.getById(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Question</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef1f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            background: white;
            margin: 40px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-weight: bold;
            margin-top: 12px;
            display: block;
            color: #444;
        }

        textarea, input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
            font-size: 14px;
            background: #fafafa;
        }

        textarea {
            height: 80px;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 18px;
            border: none;
            background: #007bff;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        .back-btn {
            margin-top: 10px;
            background: gray !important;
        }

        a {
            text-decoration: none;
            width: 100%;
            display: inline-block;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>Edit Question</h2>

    <form action="updateQuestion" method="post">

        <input type="hidden" name="id" value="<%= q.getId() %>">

        <label>Question:</label>
        <textarea name="question"><%= q.getQuestion() %></textarea>

        <label>Option A:</label>
        <input type="text" name="optionA" value="<%= q.getOptionA() %>">

        <label>Option B:</label>
        <input type="text" name="optionB" value="<%= q.getOptionB() %>">

        <label>Option C:</label>
        <input type="text" name="optionC" value="<%= q.getOptionC() %>">

        <label>Option D:</label>
        <input type="text" name="optionD" value="<%= q.getOptionD() %>">

        <label>Correct Answer (A/B/C/D):</label>
        <input type="text" name="correct" value="<%= q.getCorrectAnswer() %>">

        <button type="submit">Update Question</button>

    </form>

    <a href="adminDashboard.jsp">
        <button class="back-btn">Back</button>
    </a>

</div>

</body>
</html>
