<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/17/2022
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tạo mới thông tin cho người dùng</title>
</head>
<body>

<h3>Chỉnh sửa người dùng</h3>
<a href="/users">Quay lại</a>
<form method="post">
    <fieldset>
        <legend>Chỉnh sửa thông tin người dùng có id = ${user.getId()}</legend>
        <input type="text" name="name" placeholder="Chỉnh sửa tên người dùng" value="${user.getName()}">
        <input type="text" name="email" placeholder="Chỉnh sửa email người dùng" value="${user.getEmail()}">
        <input type="text" name="country" placeholder="Chỉnh sửa Quốc gia người dùng" value="${user.getCountry()}">

        <input type="submit" value="Hoàn tất chỉnh sửa">
    </fieldset>
</form>
<c:if test="${message != null}">
    <p>${message}</p>
</c:if>
</body>
</html>
