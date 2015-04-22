<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,com.bjsxt.bbs.*,java.util.*" %>
<%@include file="_sessioncheck.jsp" %>
<%!
private void delete(Connection conn, int id,boolean isLeaf){
	if(!isLeaf){
		String sql="select * from article where pid =" + id;
		Statement stmt=DB.createStmt(conn);
		ResultSet rs =DB.executeQuery(stmt, sql);
		try{
			while(rs.next()){
				delete(conn,rs.getInt("id"),rs.getInt("isleaf")==0);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DB.close(rs);
			DB.close(stmt);
		}
	}
	DB.executeUpdate(conn, "delete from article where id="+id);
}
%>    

<%
int id=Integer.parseInt(request.getParameter("id"));
int pid=Integer.parseInt(request.getParameter("pid"));
String url=request.getParameter("from");
boolean isLeaf =Boolean.parseBoolean(request.getParameter("isLeaf"));

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

conn=DB.getConn();
boolean autoCommit=conn.getAutoCommit();
conn.setAutoCommit(false);
delete(conn,id,isLeaf);

stmt=DB.createStmt(conn);
rs=DB.executeQuery(stmt, "select count(*) from article where pid = "+pid);
rs.next();
int count=rs.getInt(1);
if(count<=0){
	DB.executeUpdate(conn, "update article set isleaf=0 where pid ="+pid);
}

conn.commit();

conn.setAutoCommit(autoCommit);
DB.close(rs);
DB.close(stmt);
DB.close(conn);

response.sendRedirect(url);
%>
    
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java EE*beta|Delete</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
<script language="JavaScript" type="text/javascript" src="images/common.js"></script>
</head>
<body>
	Congratulations!
</body>
</html>
