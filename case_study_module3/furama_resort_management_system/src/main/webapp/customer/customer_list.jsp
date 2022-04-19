<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/18/2022
  Time: 6:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr><th>#</th></tr>
    <c:forEach items="${}" var="customer">
        <tr><td>${customer.customerId}</td></tr>
    </c:forEach>
</table>
</body>
</html>
