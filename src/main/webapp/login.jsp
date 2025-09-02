<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Login Page</title>
<script>
function validateLogin() {
    var uname = document.forms["loginForm"]["username"].value;
    var pwd = document.forms["loginForm"]["password"].value;
    var regex = /^[a-zA-Z0-9@']+$/;

    if (uname == "" || pwd == "") {
        alert("Username and Password cannot be empty!");
        return false;
    }
    if (!regex.test(uname)) {
        alert("Invalid Username! Only @, a-z, 0-9, ' allowed.");
        return false;
    }
    return true;
}
</script>
</head>
<body>
    <h2>Login</h2>
    <form name="loginForm" action="LoginServlet" method="post" onsubmit="return validateLogin()">
        Username: <input type="text" name="username"/><br/><br/>
        Password: <input type="password" name="password"/><br/><br/>
        <input type="submit" value="Login"/>
        <input type="reset" value="Reset"/>
    </form>

    <p style="color:red;">
        <%= (request.getAttribute("error") != null) ? request.getAttribute("error") : "" %>
    </p>
</body>
</html>
