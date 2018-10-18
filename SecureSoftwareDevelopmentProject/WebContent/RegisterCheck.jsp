<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE HTML>
<%
try{
		String connectionurl = "jdbc:mysql://localhost/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection(connectionurl,"root","password");
        // Create an insert query on database 
        String query = "insert into users values (?,?,?)";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, email);
        pst.executeUpdate();                        
        out.println("You have been successfully registered!");
        pst.close();
        conn.close();
}
catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }
%>
<a href="index.jsp">Home</a>
</html>