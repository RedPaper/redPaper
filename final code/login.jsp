<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.cuizhiquan.shopping.*" %>
<%
	String action = request.getParameter("action");
	if(action != null && action.equals("login"))
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User u = null;
		try
		{
			u = User.validate(username,password);
		}catch(UserNotFoundException e)
		{	
			out.println("�û������ڣ�");
			return;
		}catch(PasswordNotCorrectException e)
		{
			out.println("���벻��ȷ��");
			return;
		}
		session.setAttribute("user", u);
		response.sendRedirect("selfservice.jsp");
	}
%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
  	<form action="login.jsp" method="post">
		<input type="hidden" name="action" value="login"/>
		<table border="1" align="center">
			<tr>
				<td colspan="2" align="center">�û���¼</td> 
			</tr>
			<tr>
				<td>�û���:</td>
				<td><input type="text" size="10" name="username"/></td>
			</tr>
			
			<tr>
				<td>����:</td>
				<td><input type="password" size="10" name="password"/></td>
			</tr>
		
			<tr>
				<td></td>
				<td><input type="submit" value="login"/><input type="reset" value="reset"/></td>
			</tr>
		</table>
	</form>
  </body>
</html>
