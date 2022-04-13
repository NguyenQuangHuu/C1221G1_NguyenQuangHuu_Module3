<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/13/2022
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/calculate" method="post">
    <input type="text" placeholder="Number 1" name="number1">
    <select name="operator" id="">
      <option value="+">Addition</option>
      <option value="-">Subtraction</option>
      <option value="*">Multiple</option>
      <option value="/">Divide</option>
    </select>
    <input type="text" placeholder="Number 2" name="number2">
    <input type="submit" value="Calculate">

    <c:if test="${!empty result}">
      <h3>Result: </h3>
      <c:choose>
        <c:when test="${!message.equals('')}">
          <h5>${message}</h5>
        </c:when>
        <c:otherwise>
          <h5>${num1} ${operator} ${num2} = ${result}</h5>
        </c:otherwise>
      </c:choose>
    </c:if>

  </form>
  </body>
</html>
