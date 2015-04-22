<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,com.bjsxt.bbs.*,java.util.*" %>
<%
String strId = request.getParameter("id");
String strRootid = request.getParameter("rootid");
if(strId==null||strId.trim().equals("")){
	out.println("Error Page!");
	return;
}
int id =0;
int rootid=0;
try{
	id = Integer.parseInt(strId);
	rootid=Integer.parseInt(strRootid);
}catch(NumberFormatException e){
	out.println("Error ID!");
	return;
}
/* 
Article a=null;

Connection conn= DB.getConn();
Statement stmt=DB.createStmt(conn);
String sql="select * from article where id ="+id;
ResultSet rs=DB.executeQuery(stmt, sql);
if(rs.next()){
	a=new Article();
	a.initFromRs(rs);
}
if(a==null){
	out.println("Can't find the thread!");
	return;	
}

DB.close(rs);
DB.close(stmt);
DB.close(conn); 
*/

%>   
 
    
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java EE*beta|Reply</title>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?threadID=744236">
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
                	<form action ="replyaction.jsp" method="post">
                		<input type="hidden" name="pid" value="<%=id %>"/>
                		<input type="hidden" name="rootid" value="<%=rootid %>"/>
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
