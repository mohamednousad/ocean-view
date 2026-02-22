<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Ocean View Resort</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="icon" type="image/x-icon" href="logo.ico">
</head>
<body class="login-body">
    <div class="login-container">
        <h2>Welcome Back</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        <div class="login-error">
            <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
        </div>
    </div>
</body>
</html>