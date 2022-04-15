<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/14/2022
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Product Information</title>
</head>
<body>
<h3>Update Product Form</h3>
<c:if test="${message != null}">
    <p>${message}</p>
</c:if>
<a href="/products">Back to list</a>
<form method="post">
    <fieldset>
        <legend>Product ${product.id}</legend>
        <input type="text" value="${product.productName}" name="name">
        <input type="text" value="${product.manufacturer}" name="manufacturer">
        <input type="text" value="${product.productPrice}" name="price">
        <input type="text" value="${product.productQuantity}" name="quantity">
        <input type="submit" value="Update information">
    </fieldset>
</form>
</body>
</html>
