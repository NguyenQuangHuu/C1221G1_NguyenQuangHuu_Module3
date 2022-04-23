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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
</head>
<body>
<a href="/services?action=create">Tạo mới dịch vụ</a>
<br>
<table id="tableService" class="table">
    <thead>
    <tr>
        <th>#</th>
        <th>Mã dịch vụ</th>
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
            <td>${service.code}</td>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
        integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>

<script>
    $(document).ready(function(){
        $('#tableService').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
