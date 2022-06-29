<%--
  Created by IntelliJ IDEA.
  User: ntamq
  Date: 6/28/2022
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<legend>Product Manager</legend>
<nav class="navbar">
    <div class="container-fluid">
        <form class="d-flex" method="get" action="/servlet">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="searchName">
            <button name="action" value="find" class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>
<a href="/servlet?action=create">Thêm</a>
<form method="post" action="">
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Mô tả của sản phẩm</th>
            <th>Nhà sản xuất</th>
            <td>edit</td>
            <td>delete</td>
        </tr>
        <c:forEach items="${list}" var="product">
            <tr>
                <td>${product.id}</td>
                <td><a href="/servlet?action=view&id=${product.id}">${product.name}</a></td>
                <td>${product.price}</td>
                <td>${product.productDescription}</td>
                <td>${product.producer}</td>
                <td><a href="/servlet?action=edit&id=${product.id}">edit</a></td>
                <td><a href="/servlet?action=delete&id=${product.id}">delete</a></td>
            </tr>
        </c:forEach>
    </table>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
