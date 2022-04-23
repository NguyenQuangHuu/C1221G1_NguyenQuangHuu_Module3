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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
</head>
<body>
<a href="/services">Quay lại danh sách dịch vụ</a>
<form method="post" class="w-100 mx-4">
    <fieldset class="w-100">
        <legend>Thêm mới dịch vụ</legend>
        <input class="form-input" type="text" name="code" placeholder="Mã dịch vụ">
        <span>${error.get("code")}</span>
        <br>
        <input class="form-input" type="text" name="name" placeholder="Tên dịch vụ">
        <span>${error.get("name")}</span>
        <br>
        <input class="form-input" type="text" name="area" placeholder="Diện tích sử dụng">
        <span>${error.get("area")}</span>
        <br>
        <input class="form-input" type="text" name="fee" placeholder="Chi phí thuê">
        <span>${error.get("fee")}</span>
        <br>
        <input class="form-input" type="text" name="maximum" placeholder="Số lượng khách tối đa">
        <span>${error.get("maximum")}</span>
        <br>
        <select class="form-input" name="renType">
            <c:forEach items="${rentTypes}" var="rent">
                <option value="${rent.rentTypeCode}">${rent.rentTypeName}</option>
            </c:forEach>
        </select>
        <br>
        <select  class="form-input" name="serviceType" id="valueService" onchange="getValue()">
            <c:forEach items="${serviceTypes}" var="service">
                <option value="${service.serviceTypeCode}">${service.serviceTypeName}</option>
            </c:forEach>
        </select>
        <br>
        <div id="advanceService">
            <input class="form-input" type="text" name="poolArea" placeholder="Diện tích hồ bơi">
            <span>${error.get("poolArea")}</span>
            <br>
            <select class="form-input" name="roomType">
                <option value="vip">Phòng Vip</option>
                <option value="normal">Phòng Thường</option>
            </select>
            <br>
            <input class="form-input" type="text" name="floor" placeholder="Số tầng">
            <span>${error.get("floor")}</span>
            <br>
            <input class="form-input" type="text" name="convenience" placeholder="Tiện nghi khác">
            <br>
        </div>
        <input class="btn btn-primary" type="submit" value="Tạo mới">
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
                    '<input class="form-input" type="text" name="poolArea" placeholder="Diện tích hồ bơi">\n' +
                    '            <span>${error.get("poolArea")}</span>\n' +
                    '            <br>'
            case '2':
                text+='' +
                    '<select class="form-input" name="roomType">' +
                    '                <option value="vip">Phòng Vip</option>' +
                    '                <option value="normal">Phòng Thường</option>' +
                    '            </select>' +
                    '            <br>' +
                    '            <input type="text" name="floor" placeholder="Số tầng">' +
                    '            <span>${error.get("floor")}</span>'+
                    '<br>';
            case '3':
                text += '' +
                    '<input type="text"  class="form-input" name="convenience" placeholder="Tiện nghi khác">' +
                    '<br>';
                break;
        }
        render.innerHTML = text;
    }
</script>
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
</body>
</html>
