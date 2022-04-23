<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 4/18/2022
  Time: 7:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
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
            <a href="#">Home</a>
          </li>
          <li class="d-inline-block w-100 col-2 px-4 py-2">
            <a href="/employee">Employee</a>
          </li>
          <li class="d-inline-block w-100 col-2 px-4 py-2">
            <a href="/customer">Customer</a>
          </li>
          <li class="d-inline-block w-100 col-2 px-4 py-2">
             <a href="/services">Service</a>
          </li>
          <li class="d-inline-block w-100 col-2 px-4 py-2">
            <a href="/contract">Contract</a>
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
