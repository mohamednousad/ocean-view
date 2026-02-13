<!DOCTYPE html>
<html>
<head>
    <title>Login - Ocean View Resort</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 10px;
            width: 320px;
            text-align: center;
        }
        h2 {
            margin-bottom: 25px;
            color: #007bff;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #007bff;
            border: none;
            border-radius: 6px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        .error {
            color: red;
            margin-top: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Welcome Back</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        <div class="error">
            <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
        </div>
    </div>
</body>
</html>
