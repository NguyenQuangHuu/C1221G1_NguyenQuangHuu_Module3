<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/20/2022
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/employee?action=create">Tạo mới nhân viên</a>
<fieldset>
    <legend>Danh sách nhân viên</legend>
    <table border="1" width="100%">
        <thead>
        <tr>
            <th>#</th>
            <th>Họ tên</th>
            <th>Ngày sinh</th>
            <th>Giới tính</th>
            <th>Chứng minh thư</th>
            <th>Mức lương</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Vị trí</th>
            <th>Trình độ</th>
            <th>Phòng ban</th>
            <th>Chức năng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employees}" var="employee">
        <tr>
            <td>${employee.id}</td>
            <td>${employee.name}</td>
            <td>${employee.dayOfBirth}</td>
            <td>${employee.gender}</td>
            <td>${employee.passport}</td>
            <td><fmt:formatNumber>${employee.salary}</fmt:formatNumber></td>
            <td>${employee.phone}</td>
            <td>${employee.email}</td>
            <td>${employee.address}</td>
            <td>${employee.positionCode}</td>
            <td>${employee.levelCode}</td>
            <td>${employee.departmentCode}</td>
            <td>
                <a href="/employee?action=edit&id=${employee.id}">Sửa</a>
                <a href="/employee?action=delete&id=${employee.id}">Xóa</a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</fieldset>
</body>
</html>
