<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/19/2022
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Giao diện thêm mới khách hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
    <style>
        p {
            color:red;
        }
    </style>
</head>
<body>
<h5 class="text-center">Tạo khách hàng</h5>
<p class="text-center d-block">
    <c:if test="${message != null}">
        ${message}
    </c:if>
</p>


<br>
<div class="text-center">
    <a class="btn btn-warning mx-auto" href="/customer">Về trang danh sách khách hàng</a>

</div>

<form method="post" class="mx-auto w-75">
<fieldset>
    <legend class="text-center text-success">Thông tin khách hàng</legend>
    <input class="form-control" type="text" name="code" placeholder="Mã khách hàng"><p>${error.get("code")}</p><br>
    <input class="form-control" type="text" name="name" placeholder="Tên khách hàng"><p>${error.get("name")}</p><br>
    <label for="dayOfBirth" class="text-left"> Ngày sinh :
    </label>
    <input id="dayOfBirth" class="form-control" type="date" name="dob" placeholder="Ngày sinh"><p>${error.get("dayOfBirth")}</p>

    <select class="form-control" name="gender" id="">
        <option value="0">Nữ</option>
        <option value="1">Nam</option>
    </select><br>
    <input  class="form-control" type="text" name="passport" placeholder="Chứng minh thư"><p>${error.get("passport")}</p><br>
    <input class="form-control" type="text" name="phone" placeholder="Số điện thoại"><p>${error.get("phone")}</p><br>
    <input class="form-control" type="text" name="email" placeholder="Email"><p>${error.get("email")}</p><br>
    <input class="form-control" type="text" name="address" placeholder="Địa chỉ"><br>
    <select class="form-control" name="type_code">
        <c:forEach items="${customerType}" var="type">
            <option value="${type.typeCode}">${type.typeName}</option>
        </c:forEach>
    </select><br>
    <div class="text-center">
        <input class="btn btn-primary" type="submit" value="Tạo khách hàng">

    </div>
</fieldset>
</form>


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

</body>
</html>
