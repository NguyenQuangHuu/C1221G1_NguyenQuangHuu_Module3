<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/15/2022
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.getId()}</td>
            <td><a href="users?action=detail?id=${user.getId()}">${user.getName()}</a></td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a href="users?action=edit?id=${user.getId()}">Sửa</a></td>
            <td><a href="users?action=delete?id=${user.getId()}">Xóa</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
