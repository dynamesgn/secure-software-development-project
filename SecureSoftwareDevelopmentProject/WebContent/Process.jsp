<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logged on!</title>
</head>
<body>

Show Data:<br>
<%
// data coming from client
	Enumeration <String>attNames = request.getParameterNames();
	while(attNames.hasMoreElements()){
		String paraName = (String)attNames.nextElement();
		out.println(paraName);
		%>
		<pre>
		<%
		out.println(request.getParameter(paraName));
		%>
		</pre>
		<br>
<% 
	}
%>

</body>
</html>