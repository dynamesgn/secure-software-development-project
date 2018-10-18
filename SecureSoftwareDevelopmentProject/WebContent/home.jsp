<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore Homepage</title>
</head>
<body>
<center><h1> Welcome to the JJJE Bookstore!</h1></center>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
         user = "root"  password = "password"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from books;
      </sql:query>
      
      <table border = "1" width = "100%">
         <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Quantity</th>
            <th>Price</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr align="center">
               <td><a href="books/${row.title}.jsp"><c:out value = "${row.title}"/></a></td>
               <td><c:out value = "${row.author}"/></td>
               <td><c:out value = "${row.quantity}"/></td>
               <td><c:out value = "${row.price}"/></td>
            </tr>
         </c:forEach>
      </table>
<center><a href="logout.jsp">Logout</a></center>
</body>
</html>