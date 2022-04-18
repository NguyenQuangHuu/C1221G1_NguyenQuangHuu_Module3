<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/15/2022
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<div class="text-center py-4">
    <h3 class="text-center ">Danh sách người dùng</h3>
    <a class="btn btn-primary text-center" href="/users?action=create">Thêm mới user</a>
</div>

<br>
<c:choose>
    <c:when test="${users != null}">
        <div class="text-center">
        <form>
            <fieldset>
                <legend>Tìm kiếm theo tên quốc gia</legend>
                <input type="hidden" name="action" value="search">
                <input type="text" name="searchText" placeholder="Nhập chính xác tên quốc gia...">
                <input type="submit" value="Tìm kiếm">
            </fieldset>
        </form>
        <table class="mx-auto py-4 table-bordered w-50">
            <tr class="text-center">
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr class="text-center">
                    <td>${user.getId()}</td>
                    <td><a href="users?action=detail&id=${user.getId()}">${user.getName()}</a></td>
                    <td>${user.getEmail()}</td>
                    <td>${user.getCountry()}</td>
                    <td>
                        <div class="w-100 d-flex float-left">
                            <a class="btn btn-primary w-50 " href="users?action=edit&id=${user.getId()}">Sửa</a>
                            <button class="btn btn-danger w-50 " data-toggle="modal" data-target="#exampleModal" onclick="getId(${user.getId()})">Xóa</button>

                        </div>

                    </td>
                </tr>

            </c:forEach>
        </table>
        <c:if test="${message != null}">
            <p>${message}</p>
        </c:if>
        <div class="px-4 py-4">
            <a class="btn btn-success " href="users?action=sort">Sắp xếp theo tên</a>
            <a class="btn btn-warning " href="users?action=refresh">Trở lại như ban đầu</a>
        </div>

        </div>
    </c:when>
    <c:otherwise>
        <h3 class="text-center">Chưa có người dùng nào</h3>
    </c:otherwise>
</c:choose>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cảnh báo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form>
            <div class="modal-body">
                Bạn có thực sự muôn xóa đi người dùng này!
                <input type="hidden" name="action" value="delete">
                <input type="text" name="id" id="idToDelete" hidden>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Hủy</button>


                    <input class="btn btn-danger" type="submit" value="Xóa">


            </div>
            </form>
        </div>
    </div>
</div>

<script>
    function getId(id){
        document.getElementById("idToDelete").value = id;
    }
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
