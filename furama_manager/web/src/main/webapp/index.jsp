<%--
  Created by IntelliJ IDEA.
  User: ntamq
  Date: 6/30/2022
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>

  <link rel="stylesheet" href="/bootstrap-5.0.2-dist/bootstrap-5.0.2-dist/css/bootstrap.css">
</head>
<body>
<div class="container-fluid">
  <div class="row" style="background-color: #FAFAFA">
    <div class="col-2">
      <img src="/picture/logo_furama.png" width="150px" height="150px" alt="">
    </div>
    <div class="col-10 d-flex align-items-center justify-content-end">
      <p>Nguyễn Duy Phúc</p>
    </div>
  </div>
  <div class="row">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: rgb(64,232,155)">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item dropdown">
              <a class="nav-link" href="#"
                 data-bs-toggle="dropdown" aria-expanded="false">
                Home
              </a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button"
                 data-bs-toggle="dropdown" aria-expanded="false">
                Employee
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Employee list</a></li>
                <li><a class="dropdown-item" href="#">New Employee</a></li>
              </ul>
            </li><li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button"
               data-bs-toggle="dropdown" aria-expanded="false">
              Customer
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Customer</a></li>
              <li><a class="dropdown-item" href="#">New customer</a></li>
            </ul>
          </li><li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button"
               data-bs-toggle="dropdown" aria-expanded="false">
              Service
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Service list</a></li>
              <li><a class="dropdown-item" href="#">New service</a></li>
            </ul>
          </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button"
                 data-bs-toggle="dropdown" aria-expanded="false">
                Contract
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Contract list</a></li>
                <li><a class="dropdown-item" href="#">New contract</a></li>
              </ul>
            </li>
          </ul>
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
  </div>
</div>
<script src="/bootstrap-5.0.2-dist/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
