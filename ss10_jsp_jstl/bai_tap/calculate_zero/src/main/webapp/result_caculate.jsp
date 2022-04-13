<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/13/2022
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>Result</h4>


<c:choose>
    <c:when test="${message eq null}">
        <h5>${num1} ${operator} ${num2} = ${result}</h5>
    </c:when>
    <c:otherwise>
        <h5>${message}</h5>
    </c:otherwise>
</c:choose>


</body>
</html>
