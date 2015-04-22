<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,com.bjsxt.bbs.*,java.util.*" %>

<%
String action=request.getParameter("action");
if(action!=null&&action.trim().equals("post")){
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	Connection conn=DB.getConn();

	boolean autoCommit = conn.getAutoCommit();
	conn.setAutoCommit(false);
	int rootid=-1;
	String sql="insert into article values(null,?,?,?,?,now(),?)";
	PreparedStatement pstmt=DB.prepareStmt(conn, sql,Statement.RETURN_GENERATED_KEYS);
	pstmt.setInt(1, 0);
	pstmt.setInt(2, rootid);
	pstmt.setString(3, title);
	pstmt.setString(4, content);
	pstmt.setInt(5,0);
	pstmt.executeUpdate();
	
	ResultSet rsKey=pstmt.getGeneratedKeys();
	rsKey.next();
	rootid=rsKey.getInt(1);
	System.out.println(rootid);
	
	Statement stmt=DB.createStmt(conn);
	stmt.executeUpdate("update article set rootid="+rootid+" where id="+ rootid);
	conn.commit();
	conn.setAutoCommit(true);

	DB.close(stmt);
	DB.close(pstmt);
	DB.close(conn);
	//two way redirect
	response.sendRedirect("articleflat.jsp");
}

%>   
 
    
    
   
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java EE*beta|Post</title>
	<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
	<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td><img src="images/header-stretch.gif" alt="" border="0" height="57" width="100%"></td>
    </tr>
  </tbody>
</table>
<br>
<div id="jive-flatpage">
  <div class="jive-buttons">
    <table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
    </table>
  </div>
  <br>
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><div id="jive-message-holder">
            <div class="jive-message-list">
              <div class="jive-table">
                <div class="jive-messagebox" align="center">
                	<form action ="post.jsp" method="post">
                		<input type="hidden" name="action" value="post"/>
                    	Title:<br><input type="text" name="title" /><br><br>
                    	Content:<br>
               			<textarea rows="10" cols="80" name="content" ></textarea>
               			<br>
               			<input type="submit" name="submit"/>
                    </form>
				</div>
			  </div>
			</div>
          </div></td>
        <td width="1%"></td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>
