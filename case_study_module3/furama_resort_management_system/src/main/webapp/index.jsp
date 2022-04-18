<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/18/2022
  Time: 9:00 AM
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
    <%@ include file="fragment/header.jsp"%>



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
