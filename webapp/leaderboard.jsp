<%@ page import="java.util.*, com.example.QuizProject.model.Result" %>
<html>
<head>
    <title>Leaderboard</title>
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
            margin-top: 40px;
        }

        table {
            border-collapse: collapse;
            width: 60%;
            margin-top: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            background-color: #fff;
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
            display: inline-block;
            margin-top: 30px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
            transition: 0.3s;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<h2>Leaderboard</h2>

<table>
    <tr>
        <th>Rank</th>
        <th>Username</th>
        <th>Score</th>
    </tr>

    <%
        List<Result> list = (List<Result>) request.getAttribute("leaderboard");
        int rank = 1;

        if (list != null) {
            for (Result r : list) {
    %>
        <tr>
            <td><%= rank++ %></td>
            <td><%= r.getUsername() %></td>
            <td><%= r.getScore() %></td>
        </tr>
    <%
            }
        }
    %>
</table>

<br>
<a href="userHome.jsp">Back to Home</a>

</body>
</html>
