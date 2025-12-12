<%@ page import="java.util.*, com.example.QuizProject.dao.QuestionDAO, com.example.QuizProject.model.Question" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Quiz</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f7;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.1);
        }

        h2, h3 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
            color: #333;
            display: block;
            margin-top: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 5px;
        }

        hr {
            margin: 20px 0;
        }

        .question-item {
            padding: 10px;
            background: #f9f9f9;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        .checkbox {
            margin-right: 10px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 25px;
        }

        button:hover {
            background: #0056b3;
        }

        .back-btn {
            background: gray !important;
            margin-top: 10px;
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

    <h2>Create Quiz</h2>

    <form action="createQuiz" method="post">

        <label>Quiz Name:</label>
        <input type="text" name="quizName" required>

        <hr>

        <h3>Select Questions</h3>

        <%
            List<Question> list = QuestionDAO.getAllQuestions();
            for(Question q : list){
        %>

        <div class="question-item">
            <input type="checkbox"
                   class="checkbox"
                   name="questionIds"
                   value="<%= q.getId() %>">
            <%= q.getQuestion() %>
        </div>

        <% } %>

        <button type="submit">Save Quiz</button>

    </form>

    <a href="adminDashboard.jsp">
        <button class="back-btn">Back</button>
    </a>

</div>

</body>
</html>
