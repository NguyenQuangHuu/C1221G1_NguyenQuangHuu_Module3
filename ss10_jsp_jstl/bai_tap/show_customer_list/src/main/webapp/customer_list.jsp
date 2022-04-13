<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/13/2022
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
</head>
<body>
<h4>Danh sách khách hàng</h4>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Ngày sinh</th>
        <th>Tên</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${customer_list}" var="customer" varStatus="index">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.dayOfBirth}</td>
            <td>${customer.name}</td>
            <td>${customer.address}</td>
            <td><img style="width: 60px;height: 60px" src="${customer.image}" alt="abc"></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
