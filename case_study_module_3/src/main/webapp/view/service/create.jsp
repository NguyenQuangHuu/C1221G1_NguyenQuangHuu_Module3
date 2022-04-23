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
    <style>
        span {
            color: red;
        }
    </style>
</head>
<body>
<a href="/services">Quay lại danh sách dịch vụ</a>
<form method="post">
    <fieldset>
        <legend>Thêm mới dịch vụ</legend>
        <input type="text" name="code" placeholder="Mã dịch vụ">
        <span>${error.get("code")}</span>
        <br>
        <input type="text" name="name" placeholder="Tên dịch vụ">
        <span>${error.get("name")}</span>
        <br>
        <input type="text" name="area" placeholder="Diện tích sử dụng">
        <span>${error.get("area")}</span>
        <br>
        <input type="text" name="fee" placeholder="Chi phí thuê">
        <span>${error.get("fee")}</span>
        <br>
        <input type="text" name="maximum" placeholder="Số lượng khách tối đa">
        <span>${error.get("maximum")}</span>
        <br>
        <select name="renType">
            <c:forEach items="${rentTypes}" var="rent">
                <option value="${rent.rentTypeCode}">${rent.rentTypeName}</option>
            </c:forEach>
        </select>
        <br>
        <select name="serviceType" id="valueService" onchange="getValue()">
            <c:forEach items="${serviceTypes}" var="service">
                <option value="${service.serviceTypeCode}">${service.serviceTypeName}</option>
            </c:forEach>
        </select>
        <br>
        <div id="advanceService">
            <input type="text" name="poolArea" placeholder="Diện tích hồ bơi">
            <span>${error.get("poolArea")}</span>
            <br>
            <select name="roomType">
                <option value="vip">Phòng Vip</option>
                <option value="normal">Phòng Thường</option>
            </select>
            <br>
            <input type="text" name="floor" placeholder="Số tầng">
            <span>${error.get("floor")}</span>
            <br>
            <input type="text" name="convenience" placeholder="Tiện nghi khác">
            <br>
        </div>
        <input type="submit" value="Tạo mới">
    </fieldset>
</form>
<script>
    function getValue() {

        let x = document.getElementById("valueService").value;
        console.log(x+'a');
        let render = document.getElementById("advanceService");
        let text = '';
        switch (x) {
            case '1':
                text += '' +
                    '<input type="text" name="poolArea" placeholder="Diện tích hồ bơi">\n' +
                    '            <span>${error.get("poolArea")}</span>\n' +
                    '            <br>'
            case '2':
                text+='' +
                    '<select name="roomType">' +
                    '                <option value="vip">Phòng Vip</option>' +
                    '                <option value="normal">Phòng Thường</option>' +
                    '            </select>' +
                    '            <br>' +
                    '            <input type="text" name="floor" placeholder="Số tầng">' +
                    '            <span>${error.get("floor")}</span>'+
                    '<br>';
            case '3':
                text += '' +
                    '<input type="text" name="convenience" placeholder="Tiện nghi khác">' +
                    '<br>';
                break;
        }
        render.innerHTML = text;
    }
</script>
</body>
</html>
