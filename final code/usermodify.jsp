<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.cuizhiquan.shopping.*" %>

<%
	User u = (User)session.getAttribute("user");
	if(u == null)
	{
		out.println("����δ��¼�����¼��ʹ�ã�");
		return;
	}
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<%
	request.setCharacterEncoding("GB18030");
	String action = request.getParameter("action");  // �˴�Ӧ������ǰ̨ͬ���ļ��
	if(action != null && action.equals("modify"))
	{
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
	
		u.setUsername(username);
		u.setPhone(phone);
		u.setAddr(addr);
		u.update();
%>
		<center> �޸ĳɹ�!</center>
<%
		return;
	}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>�û��޸�</title>

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
		<form name="form" action="usermodify.jsp" method="post">
			<input type="hidden" name="action" value="modify">
			<table width="750" align="center" border="2">
				<tr>
					<td colspan="2" align="center">�û��޸�</td>
				</tr>
				
				<tr>
					<td>�û�����</td>
					<td>
						<input type=text name="username" size="30" maxlength="10" value=<%=u.getUsername()%>>
					</td>
				</tr>
				
			<!--  			
				<tr>
					<td>���룺</td>
					<td>
						<input type=password name="password" size="15" maxlength="12" value=<%=u.getPassword()%>>
					</td>
				</tr>
			-->
				<tr>
					<td>�绰</td>
					<td>
						<input type=text name="phone" size="15" maxlength="12" value=<%=u.getPhone()%>>
					</td>
				</tr>

				<tr>
					<td>��ַ</td>
					<td>
						<textarea rows="12" cols="80" name="addr"><%=u.getAddr()%></textarea>
					</td>
				</tr>

				<tr>
					<td></td>
					<td>
						<input type="submit" value="�ύ"> 
						<input type="reset" value="����">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
