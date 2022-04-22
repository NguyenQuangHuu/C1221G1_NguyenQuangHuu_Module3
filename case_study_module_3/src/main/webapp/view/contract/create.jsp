<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/22/2022
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tạo thông tin cho hợp đồng</title>
</head>
<body>
    <h4>Thông tin hợp đồng</h4>
    <form method="post">
        <fieldset>
            <legend>Tạo thông tin cho hợp đồng</legend>
            <label for="startDate">Ngày bắt đầu sử dụng dịch vụ
            <input id="startDate" type="date" name="startDate" >
            </label>
            <br>
            <label for="endDate">Ngày kết thúc sử dụng dịch vụ
                <input id="endDate" type="date" name="endDate">

            </label>
            <br>
            <input type="text" name="deposit" placeholder="Tiền cọc">
            <br>
            <select name="employeeCode">
                <c:forEach items="${employees}" var="employee">
                    <option value="${employee.id}">${employee.name}</option>
                </c:forEach>
            </select>
            <br>
            <select name="customerCode">
                <c:forEach items="${customers}" var="customer">
                    <option value="${customer.id}">${customer.name}</option>
                </c:forEach>
            </select>
            <br>
            <select name="serviceCode">
                <c:forEach items="${services}" var="service">
                    <option value="${service.id}">${service.name}</option>
                </c:forEach>
            </select>
            <br>
            <input type="text" placeholder="Tổng tiền thanh toán" name="sum">
            <br>
            <input type="submit" value="Tạo hợp đồng">
        </fieldset>
    </form>
</body>
</html>
