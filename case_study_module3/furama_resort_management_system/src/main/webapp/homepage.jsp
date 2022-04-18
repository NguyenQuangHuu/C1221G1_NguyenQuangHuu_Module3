<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/18/2022
  Time: 9:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Furama Resort Management System</title>
    <link rel="stylesheet" href="bootstrap/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/datatables/css/dataTables.bootstrap4.min.css">
    <style>
        #content{
            height: 600px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <%--  header--%>
    <div class="row py-2">
        <div class="col-12 d-flex justify-content-between align-items-center">
            <div class="col-2 text-center">
                <img width="80px" src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png"
                     alt="Furama Logo">
            </div>
            <div class="col-2 text-left ">
                <h4 class="text-info">Nguyễn Quang Hữu</h4>
                <h5 class="text-danger">Chức vụ: Chủ tịch</h5>
                <p class="text-success">Liên hệ:0762789883</p>
            </div>
        </div>
    </div>

    <%--  navbar--%>
    <div class="row border">
        <div class="col-9">
            <ul class="list-unstyled d-flex justify-content-center pb-0 mb-0">
                <li class="d-inline-block w-100 col-2 px-4 py-2">
                    Home
                </li>
                <li class="d-inline-block w-100 col-2 px-4 py-2">
                    Employee
                </li>
                <li class="d-inline-block w-100 col-2 px-4 py-2">
                    Customer
                </li>
                <li class="d-inline-block w-100 col-2 px-4 py-2">
                    Service
                </li>
                <li class="d-inline-block w-100 col-2 px-4 py-2">
                    Contract
                </li>
            </ul>
        </div>
        <div class="col-3">
            <input class="px-4 my-2 w-75" style="border-radius: 30px" type="text" placeholder="search...">
        </div>
    </div>



    <section class="row border-bottom">
        <div class="col-2 mh-100 px-0">
            <ul class="list-unstyled p-3">
                <li>Thêm</li>
                <li>Sửa</li>
                <li>Xóa</li>
                <li>Hiển thị tất cả</li>
            </ul>
        </div>

        <div id="content" class="col-10 border-left ps-3 pt-3">
            <table class="table">
                <tr>
                    <th>b</th>
                </tr>
                <tr>
                    <td>a</td>
                </tr>
            </table>
        </div>
    </section>


    <footer class="row ">
        <div class="col-4 mx-auto py-4">
            <h3 class="text-success">Nội dung bản quyền thuộc về ai?</h3>
        </div>
    </footer>
</div>

<script src="bootstrap/jquery/jquery-3.5.1.min.js">
</script>
<script src="bootstrap/datatables/js/jquery.dataTables.min.js"></script>
<script src="bootstrap/datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(
        function (){
            $('#tableStudent').dataTable(
                {
                    "dom":'lrtip',
                    "lengthChange":false,
                    "pageLength":5
                }
            );
        }
    );
</script>

</body>
</html>
