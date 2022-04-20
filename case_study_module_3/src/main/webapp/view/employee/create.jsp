<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/20/2022
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Giao diện thêm mới nhân viên</title>
</head>
<body>
<h3>Thêm mới nhân viên</h3>
<a href="/employee">Quay lại danh sách nhân viên</a>
<br>
<c:if test="${message != null}">
    ${message}
</c:if>
<br>
<form method="post">
    <fieldset>
        <legend>Thông tin nhân viên</legend>
        <input type="text" name="name" placeholder="Tên khách hàng">
        <input type="date" name="dob" placeholder="Ngày sinh">
        <select name="gender" >
            <option value="0">Nữ</option>
            <option value="1">Nam</option>
        </select>
        <input type="text" name="passport" placeholder="Chứng minh thư">
        <input type="text" name="salary" placeholder="Mức lương">
        <input type="text" name="phone" placeholder="Số điện thoại">
        <input type="text" name="email" placeholder="Email">
        <input type="text" name="address" placeholder="Địa chỉ">
        <select name="positionCode" >
            <option value="1">Quản lý</option>
            <option value="2">Nhân viên</option>
        </select>
        <select name="levelCode">
            <option value="1">Trung cấp</option>
            <option value="2">Cao đẳng</option>
            <option value="3">Đại học</option>
            <option value="4">Sau đại học</option>
        </select>
        <select name="departmentCode">
            <option value="1">Sale-Marketing</option>
            <option value="2">Hành chính</option>
            <option value="3">Phục vụ</option>
            <option value="4">Quản lý</option>
        </select>
        <input type="submit" value="Tạo nhân viên">
    </fieldset>
</form>
</body>
</html>
