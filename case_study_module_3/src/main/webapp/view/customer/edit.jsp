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
        <input type="text" name="code"  value="${customer.code}">
        <p>${error.get("code")}</p><br>
        <input type="text" name="name" placeholder="Tên khách hàng" value="${customer.name}">
        <p>${error.get("name")}</p><br>
        <input type="date" name="dob" value="${customer.dayOfBirth}" data-date-format="yyyy/mm/dd">

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
        <p>${error.get("passport")}</p><br>
        <input type="text" name="phone" placeholder="Số điện thoại" value="${customer.phone}">
        <p>${error.get("phone")}</p><br>
        <input type="text" name="email" placeholder="Email" value="${customer.email}">
        <p>${error.get("email")}</p><br>
        <input type="text" name="address" placeholder="Địa chỉ" value="${customer.address}">
        <select name="type_code">
            <c:forEach items="${types}" var="type">
                <c:if test="${customer.typeCode eq type.typeCode}">
                    <option value="${type.typeCode}" selected>${type.typeName}</option>
                </c:if>
                <c:if test="${customer.typeCode != type.typeCode}">
                    <option value="${type.typeCode}">${type.typeName}</option>
                </c:if>
            </c:forEach>
        </select>
        <input type="submit" value="Chỉnh sửa thông tin">
    </fieldset>
</form>
</body>
</html>
