<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Math Functions</title>
<script>
function validateNumbers() {
    var n1 = document.forms["mathForm"]["num1"].value;
    var n2 = document.forms["mathForm"]["num2"].value;

    if (n1 == "" || n2 == "") {
        alert("Both numbers are required!");
        return false;
    }
    return true;
}
function clearForm() {
    document.forms["mathForm"]["num1"].value = "";
    document.forms["mathForm"]["num2"].value = "";
    document.forms["mathForm"]["result"].value = "";
    document.getElementById("errorMsg").innerText = "";
}
</script>
</head>
<body>
    <h2>Mathematical Functions</h2>
    <form name="mathForm" action="MathServlet" method="post" onsubmit="return validateNumbers()">
        Number 1: <input type="text" name="num1" value="<%= (request.getAttribute("num1")!=null)?request.getAttribute("num1"):"" %>"/><br/><br/>
        Number 2: <input type="text" name="num2" value="<%= (request.getAttribute("num2")!=null)?request.getAttribute("num2"):"" %>"/><br/><br/>
        Result: <input type="text" name="result" value="<%= (request.getAttribute("result")!=null)?request.getAttribute("result"):"" %>" readonly/><br/><br/>

        <input type="submit" name="action" value="Add"/>
        <input type="submit" name="action" value="Subtract"/>
        <input type="submit" name="action" value="Multiply"/>
        <input type="submit" name="action" value="Divide"/>
        <input type="button" value="Reset" onclick="clearForm()"/>
    </form>

    <p id="errorMsg" style="color:red;">
        <%= (request.getAttribute("error") != null) ? request.getAttribute("error") : "" %>
    </p>
</body>
</html>
