<%--
  Created by IntelliJ IDEA.
  User: ntamq
  Date: 6/30/2022
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-5.0.2-dist/bootstrap-5.0.2-dist/css/bootstrap.css">
</head>
<table class="table">
    <tr>
        <a href="/user?action=create">Thêm</a>
    </tr>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>email</th>
        <th>address</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/user?action=edit&id=${user.id}">edit</a></td>
            <td><a href="/user?action=delete&id=${user.id}">delete</a></td>
        </tr>
    </c:forEach>
</table>
<body>
<script src="/bootstrap-5.0.2-dist/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
