<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,com.bjsxt.bbs.*,java.util.*" %>

<%
boolean logined=false;
String adminLogined= (String)session.getAttribute("adminLogined");
if(adminLogined!=null && adminLogined.trim().equals("true")){
	logined=true;
}

%> 



<%
final int PAGE_SIZE=6;
int pageNo=1;
String strPageNo=request.getParameter("pageNo");
if(strPageNo!=null&&!strPageNo.trim().equals("")){
	try{
		pageNo=Integer.parseInt(strPageNo);
	}catch(NumberFormatException e){
		pageNo=1;
	}
}

if(pageNo<=0) pageNo=1;
int totalPages=0;

List<Article> articles = new ArrayList<Article>();
Connection conn=DB.getConn();
Statement stmtCount=DB.createStmt(conn);
ResultSet rsCount=DB.executeQuery(stmtCount, "select count(*) from article where pid=0");
rsCount.next();
int totalRecords= rsCount.getInt(1);
totalPages=(totalRecords+PAGE_SIZE-1)/PAGE_SIZE;
if(pageNo>totalPages) pageNo=totalPages;

int startPos=(pageNo-1)*PAGE_SIZE;
Statement stmt = DB.createStmt(conn);
String sql="select * from article where pid=0 order by pdate desc limit "+startPos+","+PAGE_SIZE;
ResultSet rs = DB.executeQuery(stmt, sql);
while(rs.next()){
	Article a = new Article();
	a.initFromRs(rs);
	articles.add(a);
}
DB.close(rsCount);
DB.close(stmtCount);

DB.close(rs);
DB.close(stmt);
DB.close(conn);
%>
  
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java EE*beta|Flat</title>
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
        <%=pageNo %>, Total Page:<%=totalPages %>
          - <span class="jive-paginator"> [ <a href="articleflat.jsp?pageNo=<%=pageNo-1%>">Previous</a> | <a href="articleflat.jsp?pageNo=<%=pageNo+1%>">Next</a> ] </span> </span> </td>
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
                int linNum=0;
                for(Iterator<Article> it = articles.iterator();it.hasNext();linNum++){
                	Article a=it.next();
                	String strJive=linNum%2==0?"jive-even":"jive-odd";
                	
                %>
                  <tr class=<%=strJive %>>
                    <td class="jive-first" nowrap="nowrap" width="1%"><div class="jive-bullet"> <img src="images/read-16x16.gif" alt="read" border="0" height="16" width="16">
                      </div></td>
                    <td nowrap="nowrap" width="1%">
                    <%
                    String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
                    url+=request.getContextPath();
                    url+=request.getServletPath()+(request.getQueryString()==null?"":("?"+request.getQueryString()));
                    System.out.println(url);
                    %>
                    <%
                    if(logined){ 
                    %>
                    	<a href="delete.jsp?id=<%=a.getId()%>&isLeaf=<%=a.isLeaf()%>&pid=<%=a.getPid() %>&from=<%=url%>">delete</a>
                    <%
                    }
                    %>	
                    </td>
                    <td class="jive-thread-name" width="95%"><a id="jive-thread-1" href="articledetailflat.jsp?id=<%=a.getId()%>"><%=a.getTitle() %></a></td>
                    <td class="jive-author" nowrap="nowrap" width="1%"><span class=""> <a>Barney</a> </span></td>
                    <td class="jive-view-count" width="1%"> 15</td>
                    <td class="jive-msg-count" width="1%"> 5</td>
                    <td class="jive-last" nowrap="nowrap" width="1%"><div class="jive-last-post"> <%=new java.text.SimpleDateFormat("MM-dd-yyyy HH:mm:ss").format(a.getPdate()) %> <br> by: Barney</div></td>
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
