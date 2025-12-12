<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #fff;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        .error-msg {
            color: red;
            margin-bottom: 15px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
            font-size: 14px;
            transition: 0.3s;
        }

        a:hover {
            text-decoration: underline;
        }

        
    </style>
</head>
<body>

<div class="login-container">
    <h2>User Login</h2>

    <% if (request.getParameter("msg") != null && request.getParameter("msg").equals("invalid")) { %>
        <p class="error-msg">Invalid username or password</p>
    <% } %>

    <form action="userLogin" method="post">

        <label>Username:</label>
        <input type="text" name="username" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>

    </form>

    <a href="register.jsp">New User? Register Here</a>
</div>

</body>
</html>
