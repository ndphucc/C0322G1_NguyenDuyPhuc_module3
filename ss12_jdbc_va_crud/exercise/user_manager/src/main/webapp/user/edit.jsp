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
<form action="/user?action=edit%id=${user.id}" method="post">
    <table>
        <tr>
            <td>id</td>
            <td>${user.id}</td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" value="${user.name}" name="name"></td>
        </tr>
        <tr>
            <td>email</td>
            <td><input type="text" value="${user.email}" name="email"></td>
        </tr>
        <tr>
            <td>address</td>
            <td><input type="text" value="${user.address}" name="address"></td>
        </tr>
        <tr>
            <td><button>submit</button></td>
            <td></td>
        </tr>
    </table>
</form>

</body>
</html>
