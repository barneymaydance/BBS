<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,com.bjsxt.bbs.*,java.util.*" %>
<%

int pid=Integer.parseInt(request.getParameter("pid"));
int rootid=Integer.parseInt(request.getParameter("rootid"));
String title = request.getParameter("title");
String content=request.getParameter("content");

Connection conn=DB.getConn();

boolean autoCommit = conn.getAutoCommit();
conn.setAutoCommit(false);
String sql="insert into article values(null,?,?,?,?,now(),?)";
PreparedStatement pstmt=DB.prepareStmt(conn, sql);
pstmt.setInt(1, pid);
pstmt.setInt(2, rootid);
pstmt.setString(3, title);
pstmt.setString(4, content);
pstmt.setInt(5,0);
pstmt.executeUpdate();

Statement stmt=DB.createStmt(conn);
stmt.executeUpdate("update article set isleaf= 1 where id="+ pid);
conn.commit();
conn.setAutoCommit(true);

DB.close(stmt);
DB.close(pstmt);
DB.close(conn);

response.sendRedirect("article.jsp");

%>
 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My JSP index page</title>
</head>
<body>
	Submission OK!<br>
	<span id="time">6</span> seconds left!<br>
	<script>
	var delayURL=function (url){
		var delay = document.getElementById("time").innerHTML;
		//alert(delay);
		if(delay>0){
			delay--;
			document.getElementById("time").innerHTML=delay;
		}
		else{ 
			window.top.location.href=url;
		}
		setTimeout(function(){delayURL(url)},1000);
	}
	delayURL("article.jsp");
	</script>	
</body>
</html>