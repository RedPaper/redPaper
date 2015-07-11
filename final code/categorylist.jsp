<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.cuizhiquan.shopping.*" %>
<%@ include file="sessioncheck.jsp" %>
<%
	List<Category> categories = Category.getCategories();
%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<table border="1" align="center">
  		<tr>
  			<td>ID</td>
  			<td>name</td>
  			<td>pid</td>
  			<td>grade</td>
  		</tr>
  		<%
  		for(Iterator<Category> it = categories.iterator();it.hasNext();)
  		{
  			Category c = it.next();
  			String preStr = "";
  			for(int i = 0;i<c.getGrade();i++)
  			{
  				preStr += "----";
  			}
  		%>
  			<tr>
  				<td><%=c.getId()%></td>
  				<td><%=preStr + c.getName()%></td>
  				<td><%=c.getPid()%></td>
  				<td><%=c.getGrade()%></td>
  				<td><a href="categoryadd.jsp?pid=<%=c.getId()%>">添加子类别</td>
  			</tr>
  		<%
  		}
  		%>	
  	</table>
  </body>
</html>
