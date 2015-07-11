<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.sql.*,com.cuizhiquan.shopping.*"%>
<%@ include file="sessioncheck.jsp"%>

<%
	request.setCharacterEncoding("GB18030");
	String strPid = request.getParameter("pid");
	int pid = 0;
	if(strPid != null)
	{
		pid = Integer.parseInt(strPid);
	}
	String action = request.getParameter("action");  // 此处应该做与前台同样的检查
	if(action != null && action.equals("add"))
	{
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");
		if(pid == 0)
		{
			Category.addTopCategory(name, descr);
		}
		else
		{
			Category.addChildCategory(pid,name,descr);
		}
	}
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>My JSP 'categoryadd.jsp' starting page</title>
    
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
  	<center>添加根类别</center>
    <form action="categoryadd.jsp" method="post">
    	<input type="hidden" name="action" value="add">
    	<input type="hidden" name="pid" value="<%=pid%>">
    	<table>
    		<tr>
    			<td>类别名称</td>
    			<td><input type="text" name="name"></td>
    		</tr>
    		
    		<tr>
    			<td>类别描述</td>
    			<td><textarea name="descr" rows="8" cols="40"></textarea></td>
    		</tr>
    		
    		<tr>
    			<td colspan="2"><input type="submit" value="提交"></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
