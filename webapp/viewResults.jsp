<%@ page
    import="java.util.*, com.example.QuizProject.dao.ResultDAO, com.example.QuizProject.model.Result"%>

<!DOCTYPE html>
<html>
<head>
<title>Quiz Results</title>
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

    .results-container {
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

    a button {
        margin-top: 20px;
        padding: 12px 25px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    a button:hover {
        background-color: #45a049;
    }

    /* Responsive for small screens */
    @media (max-width: 750px) {
        .results-container {
            width: 90%;
            padding: 30px 20px;
        }

        th, td {
            padding: 10px;
        }

        a button {
            width: 100%;
            padding: 10px;
        }
    }
</style>
</head>
<body>

<div class="results-container">
    <h2>All Student Results</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Score</th>
        </tr>

        <%
        List<Result> list = ResultDAO.getAll();
        for (Result r : list) {
        %>
        <tr>
            <td><%=r.getId()%></td>
            <td><%=r.getUsername()%></td>
            <td><%=r.getScore()%></td>
        </tr>
        <%
        }
        %>
    </table>

    <br>

    <a href="adminDashboard.jsp">
        <button>Back</button>
    </a>
</div>

</body>
</html>
