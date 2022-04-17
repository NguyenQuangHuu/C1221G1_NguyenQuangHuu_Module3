<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/17/2022
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create user form</title>
</head>
<body>
<a href="/users">Back to list</a>
<form method="post">
<fieldset>
    <legend>Tạo mới người dùng</legend>
    <input type="text" name="name" placeholder="Tên người dùng">
    <input type="text" name="email" placeholder="Email của người dùng">
    <input type="text" name="country" placeholder="Quốc gia người dùng">
    <input type="submit" value="Tạo mới">
</fieldset>
</form>
<c:if test="${message != null}">
    <p>${message}</p>
</c:if>
</body>
</html>
