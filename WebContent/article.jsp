<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,com.bjsxt.bbs.*,java.util.*" %>

<%!
private void tree(List<Article> articles,Connection conn, int pid, int grade){
	String sql="select * from article where pid =" + pid;
	Statement stmt=DB.createStmt(conn);
	ResultSet rs =DB.executeQuery(stmt, sql);
	try{
		while(rs.next()){
			Article a= new Article();
			a.initFromRs(rs);
			a.setGrade(grade);
			articles.add(a);
			if(!a.isLeaf()){
				tree(articles,conn,a.getId(),grade+1);
			}
		}
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		DB.close(rs);
		DB.close(stmt);
	}
}
%>    

<%
List<Article> articles = new ArrayList<Article>();
Connection conn=DB.getConn();
tree(articles,conn,0,0);
DB.close(conn);
%>
    
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java EE*beta</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
<script language="JavaScript" type="text/javascript" src="images/common.js"></script>
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
<div id="jive-forumpage">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="98%"><p class="jive-breadcrumbs">Forum: Java EE*beta
            (Imitation)</p>
          <p class="jive-description"> Talk about Java basic questions, welcome everyone visiting! </p>
          </td>
      </tr>
    </tbody>
  </table>
  <div class="jive-buttons">
    <table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td class="jive-icon"><a href="post.jsp"><img src="images/post-16x16.gif" alt="Post new topic" border="0" height="16" width="16"></a></td>
          <td class="jive-icon-label"><a id="jive-post-thread" href="post.jsp">New Thread</a> </td>
        </tr>
      </tbody>
    </table>
  </div>
  <br>
  <table border="0" cellpadding="3" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td><span class="nobreak"> Page:
          1,6 - <span class="jive-paginator"> [ <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=0&amp;isBest=0">Previous</a> | <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=0&amp;isBest=0" class="">1</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=25&amp;isBest=0" class="jive-current">2</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=50&amp;isBest=0" class="">3</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=75&amp;isBest=0" class="">4</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=100&amp;isBest=0" class="">5</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=125&amp;isBest=0" class="">6</a> | <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=50&amp;isBest=0">Next</a> ] </span> </span> </td>
      </tr>
    </tbody>
  </table>
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><div class="jive-thread-list">
            <div class="jive-table">
              <table summary="List of threads" cellpadding="0" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="jive-first" colspan="3"> Topic </th>
                    <th class="jive-author"> <nobr> Author
                      &nbsp; </nobr> </th>
                    <th class="jive-view-count"> <nobr> View
                      &nbsp; </nobr> </th>
                    <th class="jive-msg-count" nowrap="nowrap"> Message</th>
                    <th class="jive-last" nowrap="nowrap"> New Thread</th>
                  </tr>
                </thead>
                <tbody>
                <%
                for(Iterator<Article> it = articles.iterator();it.hasNext();){
                	Article a=it.next();
                	String preStr="";
                	for(int i=0;i<a.getGrade();i++){
                		preStr+="----";
                	}
                %>
                  <tr class="jive-even">
                    <td class="jive-first" nowrap="nowrap" width="1%"><div class="jive-bullet"> <img src="images/read-16x16.gif" alt="read" border="0" height="16" width="16">
          
                      </div></td>
                    <td nowrap="nowrap" width="1%">
                    	<a href="delete.jsp?id=<%=a.getId()%>&isLeaf=<%=a.isLeaf()%>&pid=<%=a.getPid() %>">delete</a>
                    </td>
                    <td class="jive-thread-name" width="95%"><a id="jive-thread-1" href="articledetail.jsp?id=<%=a.getId()%>"><%=preStr+a.getTitle() %></a></td>
                    <td class="jive-author" nowrap="nowrap" width="1%"><span class=""> <a href="http://bbs.chinajavaworld.com/profile.jspa?userID=226030">Barney</a> </span></td>
                    <td class="jive-view-count" width="1%"> 15</td>
                    <td class="jive-msg-count" width="1%"> 5</td>
                    <td class="jive-last" nowrap="nowrap" width="1%"><div class="jive-last-post"> <%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(a.getPdate()) %> <br> by: Barney</div></td>
                  </tr>
                <%
                }
                %>  
                </tbody>
              </table>
            </div>
          </div>
          <div class="jive-legend"></div></td>
      </tr>
    </tbody>
  </table>
  <br>
  <br>
</div>
</body>
</html>
