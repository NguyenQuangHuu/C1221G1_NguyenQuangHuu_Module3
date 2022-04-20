<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/19/2022
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Giao diện thêm mới khách hàng</title>
</head>
<body>
<h4>Tạo khách hàng</h4>
<c:if test="${message != null}">
    ${message}
</c:if>

<br>
<a href="/customer">Về trang danh sách khách hàng</a>
<form method="post">
<fieldset>
    <legend>Thông tin khách hàng</legend>
    <input type="text" name="name" placeholder="Tên khách hàng">
    <input type="date" name="dob" placeholder="Ngày sinh">
    <select name="gender" id="">
        <option value="0">Nữ</option>
        <option value="1">Nam</option>
    </select>
    <input type="text" name="passport" placeholder="Chứng minh thư">
    <input type="text" name="phone" placeholder="Số điện thoại">
    <input type="text" name="email" placeholder="Email">
    <input type="text" name="address" placeholder="Địa chỉ">
    <select name="type_code">
        <c:forEach items="${customerType}" var="type">
            <option value="${type.typeCode}">${type.typeName}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Tạo khách hàng">
</fieldset>
</form>
</body>
</html>
