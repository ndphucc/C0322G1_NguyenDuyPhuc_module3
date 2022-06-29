<%--
  Created by IntelliJ IDEA.
  User: ntamq
  Date: 6/29/2022
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="" method="post">
    <table>
        <tr>
            <td>id</td>
            <td>${id}</td>
        </tr>
        <tr>
            <td>Tên sản phẩm</td>
            <td><input type="text" name="productName"></td>
        </tr>
        <tr>
            <td>Giá sản phẩm</td>
            <td><input type="text" name="productPrice"></td>
        </tr>
        <tr>
            <td>Mô tả sản phẩm</td>
            <td><input type="text" name="productDescription"></td>
        </tr>
        <tr>
            <td>Nhà sản xuất</td>
            <td><input type="text" name="productProducer"></td>
        </tr>
        <tr>
            <td><button>submit</button></td>
        </tr>
    </table>
</form>
</body>
</html>
