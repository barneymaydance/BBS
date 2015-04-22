<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,com.bjsxt.bbs.*,java.util.*" %>  
<%
String strId = request.getParameter("id");
if(strId==null||strId.trim().equals("")){
	out.println("Error Page!");
	return;
}
int id =0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	out.println("Error ID!");
	return;
}

List<Article> articles=new ArrayList<Article>();
Connection conn= DB.getConn();
String sql="select * from article where rootid ="+id+" order by pdate asc";
Statement stmt=DB.createStmt(conn);
ResultSet rs=DB.executeQuery(stmt, sql);
while(rs.next()){
	Article a=new Article();
	a.initFromRs(rs);
	articles.add(a);
}

DB.close(rs);
DB.close(stmt);
DB.close(conn);

%>   
 
    
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java EE*beta|Reply flat</title>
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
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><p class="jive-breadcrumbs"> <a href="articleflat.jsp">Main Page</a> &#187;</p>
          <p class="jive-page-title"> Title: </p></td>
        <td width="1%"><div class="jive-accountbox"></div></td>
      </tr>
    </tbody>
  </table>
  <div class="jive-buttons">
    <table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td class="jive-icon"><a href="http://bbs.chinajavaworld.com/post%21reply.jspa?threadID=744236"><img src="images/reply-16x16.gif" alt="Reply" border="0" height="16" width="16"></a></td>
          <td class="jive-icon-label"><a id="jive-reply-thread"></a> </td>
        </tr>
      </tbody>
    </table>
  </div>
  <br>
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><div id="jive-message-holder">
            <div class="jive-message-list">
              <div class="jive-table">
                <div class="jive-messagebox">
                <!-- for the message -->
                <%  
                for(int i=0;i<articles.size();i++){
                	Article a=articles.get(i);
                	String floor="#"+(i+1);
                %>               
                
                  <table summary="Message" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                      <tr id="jive-message-780144" class="jive-odd" valign="top">
                        <td class="jive-first" width="1%">
						<table border="0" cellpadding="0" cellspacing="0" width="150">
                            <tbody>
                              <tr>
                                <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                      <tr valign="top">
                                        <td style="padding: 0px;" width="1%"><nobr> <a href="http://bbs.chinajavaworld.com/profile.jspa?userID=215489" title="Barney">Barney</a> </nobr> </td>
                                        <td style="padding: 0px;" width="99%"><img class="jive-status-level-image" src="images/level3.gif" alt="" border="0"><br>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <img class="jive-avatar" src="images/avatar-display.png" alt="" border="0"> <br>
                                  <br>
                                  <span class="jive-description"> Post:
                                  34
                                  <br> 
                                  Time:
                                  <%=new java.text.SimpleDateFormat("MM-dd-yyyy").format(a.getPdate())%> <br>
                                  <a href="http://www.linkedin.com/in/barneymaydance" target="_blank"><font color="red">Visit my LinkedIn</font></a> </span> </td>
                              </tr>
                            </tbody>
                          </table>
						  
						  </td>
                        <td class="jive-last" width="99%"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                              <tr valign="top">
                                <td width="1%"></td>
                                <td width="97%">
                                	<span class="jive-subject"> <%=a.getTitle() %></span> 
                                </td>
                                <td class="jive-rating-buttons" nowrap="nowrap" width="1%"></td>
                             
                                <td width="1%"><div class="jive-buttons">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                      <tbody>
                                        <tr>
                                          <td><span class="jive-subject"><%=floor %></span></td>
                                          <td>&nbsp;</td>
                                          <td class="jive-icon"><a href="http://bbs.chinajavaworld.com/post%21reply.jspa?messageID=780144" title=""><img src="images/reply-16x16.gif" alt="»Ø¸´±¾Ö÷Ìâ" border="0" height="16" width="16"></a> </td>
                                          <td class="jive-icon-label"><a href="reply.jsp?id=<%=a.getId()%>&rootid=<%=a.getRootid() %>" title="">Reply</a> </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div></td>
                              </tr>
                              <tr>
                                <td colspan="4" style="border-top: 1px solid rgb(204, 204, 204);"><br>
                               <%=a.getContent() %><br>
                                  <br>
                                </td>
                              </tr>
                              <tr>
                                <td colspan="4" style="font-size: 9pt;"><img src="images/sigline.gif"><br>
                                  <font color="#568ac2">Programming is fun!</font> <br>
                                </td>
                              </tr>
                            </tbody>
                          </table></td>
                      </tr>
                    </tbody>
                  </table>
                  <!-- end -->
                  <%
                   }
                  %>
                </div>
              </div>
            </div>
            <div class="jive-message-list-footer">
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                  <tr>
                    <td nowrap="nowrap" width="1%"></td>
                    <td align="center" width="98%"><table border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                          <tr>
                            <td><a href="articleflat.jsp"><img src="images/arrow-left-16x16.gif" alt="·µ»Øµ½Ö÷ÌâÁÐ±í" border="0" height="16" hspace="6" width="16"></a> </td>
                            <td><a href="articleflat.jsp">Return</a> </td>
                          </tr>
                        </tbody>
                      </table></td>
                    <td nowrap="nowrap" width="1%">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div></td>
        <td width="1%"></td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>
