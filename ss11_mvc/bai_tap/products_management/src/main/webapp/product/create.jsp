<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/14/2022
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Create</title>
</head>
<body>
<h3>Create Product Page</h3>
<c:if test="${requestScope['message'] != null}">
    <p>${requestScope['message']}</p>
</c:if>
<a href="/products">Back to list</a>
<form method="post">
    <fieldset>
        <legend>Add new Product</legend>
        <input type="text" name="name_product" placeholder="Product Name">
        <input type="text" name="manufacturer" placeholder="Manufacturer Name">
        <input type="text" name="price_product" placeholder="Product Price">
        <input type="text" name="quantity_product" placeholder="Product Quantity">
        <input type="submit" value="Add">
    </fieldset>
</form>
</body>
</html>
