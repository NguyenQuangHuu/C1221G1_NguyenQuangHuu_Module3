<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/20/2022
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Danh sách dịch vụ</title>
</head>
<body>
<a href="/services?action=create">Tạo mới dịch vụ</a>
<br>
<table>
    <thead>
    <tr>
        <th>#</th>
        <th>Tên dịch vụ</th>
        <th>Diện tích sử dụng</th>
        <th>Phí thuê</th>
        <th>Số khách tối đa</th>
        <th>Loại phòng</th>
        <th>Mô tả tiện nghi đi kèm</th>
        <th>Diện tích hồ bơi</th>
        <th>Số tầng</th>
        <th>Kiểu thuê</th>
        <th>Loại dịch vụ</th>
    </tr>
    </thead>
    <tbody>
       <c:forEach items="${services}" var="service">
        <tr>
            <td>${service.id}</td>
            <td>${service.name}</td>
            <td>${service.area}</td>
            <td><fmt:formatNumber>${service.fee}</fmt:formatNumber></td>
            <td>${service.maximum}</td>
            <td>${service.roomType}</td>
            <td>${service.convenience}</td>
            <td>${service.poolArea}</td>
            <td>${service.floor}</td>
            <td>${service.rentTypeCode}</td>
            <td>${service.serviceTypeCode}</td>
        </tr>
       </c:forEach>
    </tbody>
</table>
</body>
</html>
