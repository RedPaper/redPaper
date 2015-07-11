<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.sql.*,com.cuizhiquan.shopping.*"%>
<%@ include file="sessioncheck.jsp"%>

<%
	request.setCharacterEncoding("GB18030");
	String action = request.getParameter("action");  // 此处应该做与前台同样的检查
	if(action != null && action.equals("add"))
	{
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");
		double normalprice = Double.parseDouble(request.getParameter("normalprice"));
		double memberprice = Double.parseDouble(request.getParameter("memberprice"));
		int categoryId = Integer.parseInt(request.getParameter("categoryid"));
		
		Product p = new Product();
		p.setId(-1);
		p.setName(name);
		p.setDescr(descr);
		p.setNormalprice(normalprice);
		p.setMemberprice(memberprice);
		p.setPdate(new Timestamp(System.currentTimeMillis()));
		p.setCategoryid(categoryId);
		
		ProductMgr.getInstance().addProduct(p);
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
    <form action="productadd.jsp" method="post">
    	<input type="hidden" name="action" value="add">
    	<table>
    		<tr>
    			<td>name:</td>
    			<td><input type="text" name="name"></td>
    		</tr>
    		
    		<tr>
    			<td>descr:</td>
    			<td><textarea name="descr"></textarea></td>
    		</tr>
    		
    		<tr>
    			<td>normalprice:</td>
    			<td><input type="text" name="normalprice"></td>
    		</tr>
    		
    		<tr>
    			<td>memberprice:</td>
    			<td><input type="text" name="memberprice"></td>
    		</tr>
    		
    		<tr>
    			<td>categoryid:</td>
    			<td><input type="text" name="categoryid"></td>
    		</tr>
    		
    		<tr>
    			<td colspan="2"><input type="submit" value="提交"></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
