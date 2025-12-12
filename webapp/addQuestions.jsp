<!DOCTYPE html>
<html>
<head>
    <title>Add Question</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f7;
            padding: 0;
            margin: 0;
        }

        .container {
            width: 450px;
            margin: 60px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        textarea, input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 5px;
            font-size: 14px;
        }

        textarea {
            height: 80px;
            resize: none;
        }

        button {
            width: 48%;
            padding: 12px;
            background: #007bff;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 15px;
        }

        button:hover {
            background: #0056b3;
        }

        .back-btn {
            background: gray !important;
        }

        .btn-row {
            display: flex;
            justify-content: space-between;
        }

        a {
            text-decoration: none;
            width: 48%;
        }
    </style>

</head>
<body>

<div class="container">
    <h2>Add Quiz Question</h2>

    <form action="addQuestion" method="post">

        <label>Question:</label>
        <textarea name="question"></textarea><br><br>

        <label>Option A:</label>
        <input type="text" name="optionA"><br><br>

        <label>Option B:</label>
        <input type="text" name="optionB"><br><br>

        <label>Option C:</label>
        <input type="text" name="optionC"><br><br>

        <label>Option D:</label>
        <input type="text" name="optionD"><br><br>

        <label>Correct Answer (A/B/C/D):</label>
        <input type="text" name="correct"><br><br>

        <div class="btn-row">
            <button type="submit">Save Question</button>

            <a href="/QuizPortal/adminDashboard.jsp">
                <button type="button" class="back-btn">Back</button>
            </a>
        </div>

    </form>
</div>

</body>
</html>
