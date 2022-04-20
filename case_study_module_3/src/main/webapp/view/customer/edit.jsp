<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/19/2022
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Chỉnh sửa thông tin khách hàng</title>
</head>
<body>
<h3>Chỉnh sửa thông tin khách hàng</h3>
<a href="/customer">Quay lại màn hình khách hàng</a>
<br>
<c:if test="${message != null}">
    ${message}
</c:if>
<br>
<form method="post">
    <fieldset>
        <legend>Thông tin khách hàng cần chỉnh sửa</legend>
        <input type="text" name="id" hidden value="${customer.id}">
        <input type="text" name="name" placeholder="Tên khách hàng" value="${customer.name}">
        <input type="date" name="dob" placeholder="Ngày sinh" value="${customer.dayOfBirth}">
        <select name="gender" >
            <c:if test="${customer.gender == 0}">
                <option value="0">Nữ</option>
                <option value="1">Nam</option>
            </c:if>
            <c:if test="${customer.gender == 1}">
                <option value="1">Nam</option>
                <option value="0">Nữ</option>
            </c:if>
        </select>
        <input type="text" name="passport" placeholder="Chứng minh thư" value="${customer.passport}">
        <input type="text" name="phone" placeholder="Số điện thoại" value="${customer.phone}">
        <input type="text" name="email" placeholder="Email" value="${customer.email}">
        <input type="text" name="address" placeholder="Địa chỉ" value="${customer.address}">
        <select name="type_code">
            <c:forEach items="${types}" var="type">
                <c:if test="${customer.typeCode eq type.typeCode}">
                    <option value="" disabled hidden selected>${type.typeName}</option>
                </c:if>
                <option value="${type.typeCode}">${type.typeName}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Chỉnh sửa thông tin">
    </fieldset>
</form>
</body>
</html>
