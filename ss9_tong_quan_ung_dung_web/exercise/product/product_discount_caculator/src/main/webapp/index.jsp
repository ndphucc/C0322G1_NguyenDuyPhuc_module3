<%--
  Created by IntelliJ IDEA.
  User: ntamq
  Date: 6/27/2022
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form method="post" action="/ProductServlet">
    <table>
      <tr>
        <td><label> Product Description</label></td>
        <td><input type="text" name="product"></td>
      </tr>
      <tr>
        <td><label> List Price</label></td>
        <td><input type="text" name="list_price"></td>
      </tr>
      <tr>
        <td><label> Discount Percent</label></td>
        <td><input type="text" name="discount_percent"></td>
      </tr>
      <tr>
        <td><input type="submit" value="submit"></td>
      </tr>
    </table>
  </form>
  </body>
</html>
