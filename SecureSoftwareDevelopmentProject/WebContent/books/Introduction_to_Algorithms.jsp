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
<title>Introduction to Algorithms</title>
</head>
<body>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
         user = "root"  password = "password"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from books where title='Introduction_to_Algorithms';
      </sql:query>

<h1>Introduction to Algorithms</h1>
<h2>Charles E. Leiserson</h2>
<img src ="https://images-na.ssl-images-amazon.com/images/I/51rPLfOvqxL._SX376_BO1,204,203,200_.jpg"><br/>

<form action="/action_page.php" method="get">
<c:forEach var = "row" items = "${result.rows}">
            <tr align="center">
               <p><b>Introduction to Algorithms</b></br>
               <td><c:out value = "${row.author}"/></td></p>
               Quantity Available: <td><c:out value = "${row.quantity}"/></td></br>
               Price: $<td><c:out value = "${row.price}"/></td></br>
            </tr>
			  Quantity:
			  <input type="range" name="quantity" id="qid" value="0" min="0" max="${row.quantity}" oninput="quantityid.value = qid.value">
			  <output name = "quantity" id = "quantityid" >0</output>
			  <input type="submit" class="Add to Cart" value="Add to Cart">
			</form>
</c:forEach>
<center><a href="../home.jsp"> Back </a> 	<a href="../logout.jsp">Logout</a></center>
        
</body>
</html>