<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.*" %>
<!DOCTYPE HTML>
<%

try{
		String connectionurl = "jdbc:mysql://localhost/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection(connectionurl,"root","password");
        PreparedStatement pst = conn.prepareStatement("Select uname,upass from users where uname=? and upass=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){          
        	RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
        	rd.forward(request,response);
        	
        }
        else{
        	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        	rd.forward(request,response);
        }
        pst.close();
        conn.close();
}
catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }
%>
</html>