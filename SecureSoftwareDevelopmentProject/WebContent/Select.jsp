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
<title>Insert title here</title>
</head>
<body>

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
         user = "root"  password = "password"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from Users;
      </sql:query>
      
      <table border = "1" width = "100%">
         <tr>
            <th>name</th>
            <th>password</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.uname}"/></td>
               <td><c:out value = "${row.upass}"/></td>
               <td><c:out value = "${row.uemail}"/></td>
            </tr>
         </c:forEach>
      </table>

</body>
</html>