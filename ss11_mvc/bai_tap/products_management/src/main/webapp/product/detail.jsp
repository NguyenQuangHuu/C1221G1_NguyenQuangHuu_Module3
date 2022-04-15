<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/15/2022
  Time: 8:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/products">Back to List</a>
<fieldset>
    <legend>Product Id : ${product.getId()}</legend>
    <h5>Product Name : ${product.getProductName()}</h5>
    <h5>Manufacturer : ${product.getManufacturer()}</h5>
    <h5>Product Price : ${product.getProductPrice()}</h5>
    <h5>Product Quantity: ${product.getProductQuantity()}</h5>
</fieldset>
</body>
</html>
