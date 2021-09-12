<%--
  Created by IntelliJ IDEA.
  User: Alexandr
  Date: 01.04.2021
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String message = pageContext.getException().getMessage();
    String exception = pageContext.getException().getClass().toString();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1 class="title_h1_err">Возникла ошибка</h1>
<div class="form_error">
<h2 class="title_h1_err">Исключение:</h2>
<p class="err_title">Тип: <%= exception%></p>
<p class="err_title"><%=message%></p>
    </div>
</body>
</html>
