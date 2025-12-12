<!DOCTYPE html>
<%@page import="com.example.QuizProject.model.Quiz"%>
<%@page import="com.example.QuizProject.util.DBConnection"%>
<%@page import="com.example.QuizProject.dao.QuizDAO"%>
<%@page import="com.example.QuizProject.dao.QuestionDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.example.QuizProject.model.Question"%>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        /* General body */
        body {
            font-family: Arial, sans-serif;
            background: #f4f5f7;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
        }

        h2 {
            text-align: center;
            background: #007bff;
            color: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        h3 {
            color: #333;
            margin-top: 40px;
            margin-bottom: 10px;
        }

        /* Navigation buttons */
        .nav-buttons {
            margin: 20px 0;
            text-align: center;
        }

        .nav-buttons a button {
            background: #28a745;
            color: white;
            padding: 10px 20px;
            margin: 8px;
            border: none;
            font-size: 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        .nav-buttons a button:hover {
            background: #218838;
        }

        .logout-btn button {
            background: #dc3545 !important;
        }

        .logout-btn button:hover {
            background: #c82333 !important;
        }

        hr {
            border: 0;
            border-top: 1px solid #ccc;
            margin: 30px 0;
        }

        /* Tables */
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            margin-top: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Action links */
        a.action-link {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            transition: 0.2s;
        }

        a.action-link:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .nav-buttons a button {
                display: block;
                width: 80%;
                margin: 10px auto;
            }

            th, td {
                font-size: 14px;
                padding: 10px;
            }
        }

        @media (max-width: 500px) {
            .container {
                width: 95%;
                padding: 15px;
            }

            h2, h3 {
                font-size: 18px;
                padding: 12px;
            }
        }
    </style>
</head>
<body>

<div class="container">

<h2>Admin Dashboard</h2>

<div class="nav-buttons">
    <a href="addQuestions.jsp"><button>Add Question</button></a>
    <a href="createQuiz.jsp"><button>Create Quiz</button></a>
    <a href="viewResults.jsp"><button>View Quiz Results</button></a>
    <a href="adminLogin.jsp" class="logout-btn"><button>Logout</button></a>
</div>

<hr>

<h3>All Quizzes</h3>
<table>
<tr>
    <th>ID</th>
    <th>Quiz Name</th>
</tr>

<% 
    QuizDAO quizDAO = new QuizDAO(DBConnection.getConnection());
    List<Quiz> list1 = quizDAO.getAllQuizzes();
    
    for (Quiz q : list1) {
%>
<tr>
    <td><%= q.getId() %></td>
    <td><%= q.getQuizName() %></td>
</tr>
<% } %>
</table>

<h3>All Questions</h3>
<table>
<tr>
    <th>ID</th>
    <th>Question</th>
    <th>Correct Answer</th>
    <th>Edit</th>
    <th>Delete</th>
</tr>

<%
    List<Question> list = QuestionDAO.getAllQuestions();

    for (Question q : list) {
%>
<tr>
    <td><%= q.getId() %></td>
    <td><%= q.getQuestion() %></td>
    <td><%= q.getCorrectAnswer() %></td>
    <td><a class="action-link" href="editQuestion.jsp?id=<%= q.getId() %>">Edit</a></td>
    <td><a class="action-link" href="deleteQuestion?id=<%= q.getId() %>">Delete</a></td>
</tr>
<% } %>
</table>

</div>
</body>
</html>
