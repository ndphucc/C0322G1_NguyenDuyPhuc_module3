<%--
  Created by IntelliJ IDEA.
  User: ntamq
  Date: 6/29/2022
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/servlet?action=edit&id=${product.id}">
    <table>
        <tr>
            <td>id</td>
            <td>${product.id}</td>
        </tr>
        <tr>
            <td>Tên sản phẩm</td>
            <td><input type="text" value="${product.name}" name="name"></td>
        </tr>
        <tr>
            <td>Giá sản phẩm</td>
            <td><input type="text" value="${product.price}" name="price"></td>
        </tr>
        <tr>
            <td>Mô tả sản phẩm</td>
            <td><input type="text" value="${product.productDescription}" name="description"></td>
        </tr>
        <tr>
            <td>Nhà sản xuất</td>
            <td><input type="text" value="${product.producer}" name="producer"></td>
        </tr>
        <tr>
            <td>
                <button>submit</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
