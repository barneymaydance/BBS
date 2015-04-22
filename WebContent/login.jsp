<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,com.bjsxt.bbs.*,java.util.*" %>

<%
String action=request.getParameter("action");
String username="";
if(action!=null&&action.trim().equals("login")){
	username=request.getParameter("username");
	String password=request.getParameter("password");
	if(username==null||!username.trim().equals("admin")){
		out.println("Username is not correct!");
	}
	else if(password==null||!password.equals("admin")){
		out.println("Password is not correct!");
	}
	else{
		session.setAttribute("adminLogined", "true");
		response.sendRedirect("articleflat.jsp");
	}
}

%>   
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Java EE*beta|Login</title>
</head>
<body>
	<form action ="login.jsp" method="post">
		<input type="hidden" name="action" value="login"/>
	   	Username:<br><input type="text" name="username" value="<%=username%>"/><br><br>
	   	Password:<br><input type="password" name="password" /><br><br>

		<input type="submit" name="login"/>
	</form>
</body>
</html>
