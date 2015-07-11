<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.cuizhiquan.shopping.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<%
	request.setCharacterEncoding("GB18030");
	String action = request.getParameter("action");  // 此处应该做与前台同样的检查
	if(action != null && action.equals("register"))
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);
		u.setPhone(phone);
		u.setAddr(addr);
		u.setrDate(new Date(System.currentTimeMillis()));
		u.save();
	
%>
		<center> 注册成功 ，谢谢您的注册!</center>
<%
		return;
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户注册</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
-->
		<script language=JavaScript src="script/regcheckdata.js"></script>
	</head>

	<body>
		<form name="form" action="register.jsp" method="post" onSubmit="return checkdata()">
			<input type="hidden" name="action" value="register">
			<table width="750" align="center" border="2">
				<tr>
					<td colspan="2" align="center">用户注册</td>
				</tr>
				
				<tr>
					<td>用户名：</td>
					<td>
						<input type=text name="username" size="30" maxlength="10">
					</td>
				</tr>
				
				<tr>
					<td>密码：</td>
					<td>
						<input type=password name="password" size="15" maxlength="12">
					</td>
				</tr>
				
				<tr>
					<td>密码确认</td>
					<td>
						<input type=password name="password2" size="15" maxlength="12">
					</td>
				</tr>
				
				<tr>
					<td>电话</td>
					<td>
						<input type=text name="phone" size="15" maxlength="12">
					</td>
				</tr>

				<tr>
					<td>地址</td>
					<td>
						<textarea rows="12" cols="80" name="addr"></textarea>
					</td>
				</tr>

				<tr>
					<td></td>
					<td>
						<input type="submit" value="提交"> 
						<input type="reset" value="重置">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
