<!DOCTYPE html>
<html>
<head>
    <title>Quiz Result</title>
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

        .result-container {
            background-color: #fff;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 25px;
        }

        p {
            font-size: 20px;
            color: #555;
        }

        b {
            color: #4CAF50;
            font-size: 22px;
        }

        a {
            display: inline-block;
            margin-top: 30px;
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

<div class="result-container">
    <h2>Your Quiz Result</h2>
    <p><b>Score:</b> ${score}/${total}</p>
    <a href="userHome.jsp">Back to Dashboard</a>
</div>

</body>
</html>
