<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.cuizhiquan.shopping.*"%>
<%@ include file="sessioncheck.jsp" %>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	User.delete(id);	
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userdelete.jsp' starting page</title>
    
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
    	É¾³ý³É¹¦£¡
    <script language="javascript">
    <!--
    	window.parent.main.document.location.reload();
    -->
    </script>
  </body>
</html>
