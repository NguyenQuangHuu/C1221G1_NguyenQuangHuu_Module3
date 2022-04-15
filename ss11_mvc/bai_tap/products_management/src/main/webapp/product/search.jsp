<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/15/2022
  Time: 8:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search Product Menu</title>
</head>
<body>
<a href="/products">Back to list</a>
<form method="post">
<fieldset>
    <legend>
        Searching products by name product
    </legend>
    <input type="text" name="searchTxt" placeholder="Search...">
    <input type="submit" value="Searching...">
</fieldset>
</form>
<c:choose>
    <c:when test="${message != null}">
        ${message}
    </c:when>
    <c:otherwise>
        <c:if test="${productList != null}">
        <h3>Searching results</h3>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Product Name</th>
                <th>Manufacturer</th>
                <th>Product Price</th>
                <th>Product Quantity</th>
            </tr>

            <c:forEach items="${productList}" var="product">
                <tr>
                    <td>${product.getId()}</td>
                    <td>${product.getProductName()}</td>
                    <td>${product.getManufacturer()}</td>
                    <td>${product.getProductPrice()}</td>
                    <td>${product.getProductQuantity()}</td>
                </tr>
            </c:forEach>


        </table>
        </c:if>
    </c:otherwise>
</c:choose>
<%--<c:if test="${productList != null}">--%>
<%--    <h3>Searching results</h3>--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Product Name</th>--%>
<%--            <th>Manufacturer</th>--%>
<%--            <th>Product Price</th>--%>
<%--            <th>Product Quantity</th>--%>
<%--        </tr>--%>

<%--        <c:forEach items="${productList}" var="product">--%>
<%--            <tr>--%>
<%--                <td>${product.getId()}</td>--%>
<%--                <td>${product.getProductName()}</td>--%>
<%--                <td>${product.getManufacturer()}</td>--%>
<%--                <td>${product.getProductPrice()}</td>--%>
<%--                <td>${product.getProductQuantity()}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>


<%--    </table>--%>
<%--</c:if>--%>



</body>
</html>
