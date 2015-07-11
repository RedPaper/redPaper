<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.cuizhiquan.shopping.*" %>
<%@ include file="sessioncheck.jsp" %>

<%!
	private static final int PAGE_SIZE = 3;
%>

<%
	String strPageNo = request.getParameter("pageNo");
	int pageNo = 1;
	if(strPageNo != null)
	{
		pageNo = Integer.parseInt(strPageNo);
	}
	if(pageNo < 1)
	{
		pageNo = 1;
	}
%>
<%
	List<Product> products = new ArrayList<Product>();
	int pageCount = ProductMgr.getInstance().getProducts(products,pageNo,PAGE_SIZE);
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
  			<td>descr</td>
  			<td>normalprice</td>
  			<td>memberprice</td>
  			<td>pdate</td>
  			<td>categoryid</td>
  		</tr>
  		<%
  		for(Iterator<Product> it = products.iterator();it.hasNext();)
  		{
  			Product p = it.next();
  		%>
  			<tr>
  				<td><%=p.getId()%></td>
  				<td><%=p.getName()%></td>
  				<td><%=p.getDescr()%></td>
  				<td><%=p.getNormalprice()%></td>
  				<td><%=p.getMemberprice()%></td>
  				<td><%=p.getPdate()%></td>
  				<td><%=p.getCategoryid()%></td>
  				<td>
  					<a href="productdelete.jsp?id=<%=p.getId()%>">删除</a>
  					<a href="productmodify.jsp?id=<%=p.getId()%>">修改</a>
  				</td>
  			</tr>
  		<%
  		}
  		%>	
  	</table>
  	<center>
  		第<%=pageNo%>页
  		&nbsp;
  		共<%=pageCount%>页
  		&nbsp;
  		
  		<a href="productlist.jsp?pageNo=1">第一页</a>
  		&nbsp;
  		<a href="productlist.jsp?pageNo=<%=pageNo-1%>">上一页</a>
  		&nbsp;
  		<a href="productlist.jsp?pageNo=<%=pageNo+1%>">下一页</a>
  		&nbsp;
  		<a href="productlist.jsp?pageNo=<%=pageCount%>">最后一页</a>
  		
  	</center>
  </body>
</html>
