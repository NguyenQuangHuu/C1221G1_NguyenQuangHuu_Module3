<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/18/2022
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<table>
    <tr>
        <th>#</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Chứng minh thư</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Loại khách hàng</th>
        <th>
            Chức năng
        </th>
    </tr>
    <c:forEach items="${customers}" var="customer">
            <tr>
                <td>${customer.getId()}</td>
                <td>${customer.name}</td>
                <td>${customer.dayOfBirth}</td>
                <td>
                        <c:if test="${customer.gender == 0}">
                            Nữ
                        </c:if>
                    <c:if test="${customer.gender == 1}">
                        Nam
                    </c:if>
                </td>
                <td>${customer.passport}</td>
                <td>${customer.phone}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
                <td>${customer.typeCode}</td>
                <th>
                    <a href="">Chỉnh sửa</a>
                    <a href="">Xóa bỏ</a>
                </th>
            </tr>
    </c:forEach>
</table>
</body>
</html>
