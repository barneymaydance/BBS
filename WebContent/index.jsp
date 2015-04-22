<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,com.bjsxt.bbs.*,java.util.*" %>

<%

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My JSP index page</title>
</head>
<body>
	This is my JSP path.<br>
</body>
</html>