<%@page import="com.example.QuizProject.model.User"%>

<%
    User user = (User) session.getAttribute("userObj");
    if (user == null) {
        response.sendRedirect("userLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .home-container {
            background-color: #fff;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
            width: 400px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            margin-bottom: 30px;
            font-size: 16px;
        }

        a {
            display: inline-block;
            margin: 10px 15px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 12px 25px;
            border-radius: 5px;
            font-size: 16px;
            transition: 0.3s;
        }

        a:hover {
            background-color: #45a049;
        }

        
    </style>
</head>
<body>

<div class="home-container">
    <h2>Welcome, <%= user.getUsername() %>!</h2>
    <p>You are successfully logged in.</p>

    <a href="viewQuizzes">View Available Quizzes</a>
    <a href="userLogin.jsp">Logout</a>
</div>

</body>
</html>
