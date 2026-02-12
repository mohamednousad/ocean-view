<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>

<h2>Login</h2>

<form action="LoginServlet" method="post">
    User Name: <input type="text" name="username" required><br><br>
    Password: <input type="password" name="password" required><br><br>
    <input type="submit" value="Login">
</form>

<p style="color:red;">
    <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
</p>

</body>
</html>
