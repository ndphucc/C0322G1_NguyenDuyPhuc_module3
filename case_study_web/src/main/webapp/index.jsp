<%--
  Created by IntelliJ IDEA.
  User: ntamq
  Date: 6/25/2022
  Time: 8:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row " style="background-color: #FAFAFA">
        <img class="col-lg-2" src="logo_furama.png" width="50px" height="120px" alt="">
        <div class="col-lg-10 text-end " style="padding-top:40px" ><p>Nguyễn Duy Phúc</p></div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light ">
        <div class="container-fluid">
            <div class="col-lg-9 container">
                <div class="row text-center">
                    <div class="col-lg-2">Home</div>
                    <div class="col-lg-2">Employee</div>
                    <div class="col-lg-2">Customer</div>
                    <div class="col-lg-2">Service</div>
                    <div class="col-lg-2">Contract</div>
                </div>
            </div>
            <div class="collapse navbar-collapse" id="navbarScroll">
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
    <div class="row" style="height: 400px">
        <div class="col-lg-2 border border-dark">
            item one <br> item two <br> item three
        </div>
        <div class="col-lg-10 border border-dark text-center " style="height: 100%">
            <p>body</p>
        </div>
    </div>
    <div class="row" style="height: 50px">
        <div class="col-lg-12 text-center border border-dark">
            footer..
        </div>
    </div>
</div>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>
