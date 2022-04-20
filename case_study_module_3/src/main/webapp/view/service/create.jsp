<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/20/2022
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tạo mới dịch vụ</title>
</head>
<body>
<a href="/services">Quay lại danh sách dịch vụ</a>
<form method="post">
    <fieldset>
        <legend>Thêm mới dịch vụ</legend>
        <input type="text" name="name" placeholder="Tên dịch vụ">
        <input type="text" name="area" placeholder="Diện tích sử dụng">
        <input type="text" name="fee" placeholder="Chi phí thuê">
        <input type="text" name="maximum" placeholder="Số lượng khách tối đa">
        <input type="text" name="roomType" placeholder="Tiêu chuẩn phòng">
        <input type="text" name="convenience" placeholder="Tiện nghi khác">
        <input type="text" name="poolArea" placeholder="Diện tích hồ bơi">
        <input type="text" name="floor" placeholder="Số tầng">
        <select name="renType">
            <c:forEach items="${rentTypes}" var="rent">
                <option value="${rent.rentTypeCode}">${rent.rentTypeName}</option>
            </c:forEach>
        </select>
        <select name="serviceType">
            <c:forEach items="${serviceTypes}" var="service">
                <option value="${service.serviceTypeCode}">${service.serviceTypeName}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Tạo mới">
    </fieldset>
</form>

</body>
</html>
