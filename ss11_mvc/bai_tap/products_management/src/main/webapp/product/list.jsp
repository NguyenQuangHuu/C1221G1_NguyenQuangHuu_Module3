<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/14/2022
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h3>Product List</h3>
    <a href="/products?action=addNew">Add new product</a>
    <a href="/products?action=search">Search products</a>
    <c:if test="${message != null}">
        <p>${message}</p>
    </c:if>
<table border="1">
    <tr>
        <th>STT</th>
        <th>Tên sản phẩm</th>
        <th>Nhà sản xuất</th>
        <th>Giá bán</th>
        <th>Số lượng sản phẩm</th>
        <th>Chức Năng</th>

    </tr>
    <c:choose>
        <c:when test="${products != null}">
            <c:forEach items="${requestScope['products']}" varStatus="index" var="product">
                <tr>
                    <td>${product.getId()}</td>
                    <td><a href="products?action=detail&id=${product.getId()}"> ${product.getProductName()}</a></td>
                    <td>${product.getManufacturer()}</td>
                    <td>${product.getProductPrice()}</td>
                    <td>${product.getProductQuantity()}</td>
                    <td>
                        <a href="products?action=update&id=${product.getId()}">Edit</a>
                        <a href="products?action=remove&id=${product.getId()}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="6" style="text-align: center">Chưa có sản phẩm nào trong danh sách</td>
            </tr>
        </c:otherwise>
    </c:choose>

</table>

</body>
</html>
