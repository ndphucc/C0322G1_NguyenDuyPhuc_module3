<%--
  Created by IntelliJ IDEA.
  User: ntamq
  Date: 6/30/2022
  Time: 5:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user?action=delete&id=${user.id}" method="post">
    <table>
        <tr>
            <td>id</td>
            <td>${user.getId()}</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>${user.name}</td>
        </tr>
        <tr>
            <td>email</td>
            <td>${user.email}</td>
        </tr>
        <tr>
            <td>address</td>
            <td>${user.address}</td>
        </tr>
        <tr>
            <td><button>submit</button></td>
            <td></td>
        </tr>
    </table>
</form>

</body>
</html>
