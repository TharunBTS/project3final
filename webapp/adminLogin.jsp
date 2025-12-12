<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>Admin Login</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f3f3;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background: white;
            padding: 25px 30px;
            width: 350px;
            border-radius: 8px;
            box-shadow: 0 0 12px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #bbb;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            width: 100%;
            background: #007bff;
            color: white;
            padding: 10px;
            border: none;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        .error {
            color: red;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>

</head>
<body>

    <div class="login-box">
        <h2>Admin Login</h2>

        <!-- show error if present -->
        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <p class="error"><%= error %></p>
        <%
            }
        %>

        <form action="adminLogin" method="post">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <button type="submit">Login</button>
        </form>
    </div>

</body>
</html>
