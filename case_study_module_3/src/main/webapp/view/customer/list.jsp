<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/18/2022
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h3 style="text-align: center">Danh sách khách hàng</h3>
<a href="/customer?action=create">Tạo mới khách hàng</a>
<c:if test="${message != null}">
    ${message}
</c:if>

<form>
    <fieldset>
        <legend>Tìm kiếm khách hàng</legend>
        <input type="hidden" name="action" value="search">
        <input type="text" name="name_search" placeholder="Tên....">
        <input type="text" name="address_search" placeholder="Địa chỉ....">
        <input type="text" name="phone_search" placeholder="Số điện thoại....">
        <input type="submit" value="Tìm kiếm">
    </fieldset>
</form>
<div class="">
<table border="1" id="tableCustomer" class="mx-auto">
    <thead>
    <tr>
        <th>#</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Chứng minh thư</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Loại khách hàng</th>
        <th>
            Chức năng
        </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="customer">
            <tr>
                <td>${customer.getId()}</td>
                <td>${customer.name}</td>
                <td>${customer.dayOfBirth}</td>
                <td>
                        <c:if test="${customer.gender == 0}">
                            Nữ
                        </c:if>
                    <c:if test="${customer.gender == 1}">
                        Nam
                    </c:if>
                </td>
                <td>${customer.passport}</td>
                <td>${customer.phone}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
                <td>
                    <c:forEach items="${customerTypes}" var="types">
                        <c:if test="${customer.typeCode eq types.typeCode}">
                            ${types.typeName}
                        </c:if>
                    </c:forEach>

                </td>
                <th>
                    <a class="btn btn-warning" href="/customer?action=edit&id=${customer.id}">Sửa</a>

                    <button type="button"
                            class="btn btn-primary"
                            data-toggle="modal"
                            data-target="#exampleModal"
                    onclick="getId(${customer.id})"
                    >
                        Xóa
                    </button>
                </th>
            </tr>
    </c:forEach>
    </tbody>
</table>
</div>
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
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function getId(id){
        document.getElementById("deleteId").value = id;
    }
</script>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form>
                <input type="hidden" name="action" value="delete">
                <input type="text" name="id" id="deleteId">

            <div class="modal-body">
                Bạn có chắc muốn xóa khách hàng này
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </form>
        </div>
    </div>
</div>



</body>
</html>
