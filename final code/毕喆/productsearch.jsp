<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.sql.*,com.cuizhiquan.shopping.*"%>
<%@ include file="sessioncheck.jsp"%>

<%
	List<Category> categories = Category.getCategories();
	int pageSize = 3;
%>

<%
	request.setCharacterEncoding("GB18030");
	String action = request.getParameter("action");  
	if(action != null && action.equals("complexsearch"))
	{
		int pageNo = 1;
		String strPageNo = request.getParameter("pageNo");
		if(strPageNo != null && !strPageNo.trim().equals(""))
		{
			pageNo = Integer.parseInt(strPageNo);
		}
		
		String keyWord = request.getParameter("keyWord");
		double lowNormalPrice = Double.parseDouble(request.getParameter("lownormalprice"));
		double highNormalPrice = Double.parseDouble(request.getParameter("highnormalprice"));
		double lowMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice"));
		double highMemberPrice = Double.parseDouble(request.getParameter("highmemberprice"));
		int categoryId = Integer.parseInt(request.getParameter("categoryid"));
		
		
		int[] idArray;
		if(categoryId == 0)
		{
			idArray = null;
		}
		else
		{
			idArray = new int[1];
			idArray[0] = categoryId;
		}
		Timestamp startDate = null;
		String strStartDate = request.getParameter("startdate");
		if(strStartDate == null || strStartDate.trim().equals(""))
		{
			startDate = null;
		}
		else
		{
			startDate = Timestamp.valueOf(request.getParameter("startdate"));
		}
		
		Timestamp endDate = null;
		String strEndDate = request.getParameter("enddate");
		if(strEndDate == null || strEndDate.trim().equals(""))
		{
			endDate = null;
		}
		else
		{
			endDate = Timestamp.valueOf(request.getParameter("enddate"));
		}
		
		
		List<Product> products = ProductMgr.getInstance().findProducts(idArray,keyWord, lowNormalPrice,
																   highNormalPrice,lowMemberPrice,
																   highMemberPrice,startDate,
																   endDate,pageNo,pageSize);
%>

	<center>搜索结果</center>
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
  		<a href="productsearch.jsp?action=<%=action%>&pageNo=<%=pageNo-1%>&lownormalprice=<%=lowNormalPrice%>&highnormalprice=<%=highNormalPrice%>&lowmemberprice=<%=lowMemberPrice%>&highmemberprice=<%=highMemberPrice%>&categoryid=<%=categoryId%>">上一页</a>
  		<a href="productsearch.jsp?action=<%=action%>&pageNo=<%=pageNo+1%>&lownormalprice=<%=lowNormalPrice%>&highnormalprice=<%=highNormalPrice%>&lowmemberprice=<%=lowMemberPrice%>&highmemberprice=<%=highMemberPrice%>&categoryid=<%=categoryId%>">下一页</a>
  	</center>
<%
		return;
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
	<script type="text/javascript">
	<!--
		
		function checkdata()
		{
			with(document.forms["complex"])
			{
				if(lownormalprice.value == null || lownormalprice.value == "")
				{
					lownormalprice.value = -1;
				}
				
				if(highnormalprice.value == null || highnormalprice.value == "")
				{
					highnormalprice.value = -1;
				}
				
				if(lowmemberprice.value == null || lowmemberprice.value == "")
				{
					lowmemberprice.value = -1;
				}
				
				if(highmemberprice.value == null || highmemberprice.value == "")
				{
					highmemberprice.value = -1;
				}
			}
		}
	-->
	</script>
  </head>
  
  <body>
  	<center>简单搜索</center>
  	<form action="productsearch.jsp" method="post">
  		<input type="hidden" name="action" value="simplesearch">
  		类别：<select name="categoryid">
  				<%
  					for(Iterator<Category> it = categories.iterator();it.hasNext();)
  					{
  						Category c = it.next(); 
  				%>	
  						<option value="<%=c.getId()%>"> <%=c.getName()%> </option> 
  				<%
  					}
  				%>
  			</select>
  		关键字：<input type="text" name="keyword">
  		<input type="submit" value="搜索">
  	</form>
  	
  	<center>复杂搜索</center>
    <form action="productsearch.jsp" method="post" onsubmit="checkdata()" name="complex">
    	<input type="hidden" name="action" value="complexsearch">
    	<table>
    		<tr>
    			<td>类别：<select name="categoryid">
    						<option value="0">所有类别</option>
  						<%
  							for(Iterator<Category> it = categories.iterator();it.hasNext();)
  							{
  								Category c = it.next(); 
  								String preStr = "";
  								for(int i=0;i<c.getGrade();i++)
  								{
  									preStr += "--";
  								}
  						%>	
  								<option value="<%=c.getId()%>"> <%=preStr + c.getName()%> </option> 
  						<%
  							}
  						%>
  						</select>
  				</td>
    		</tr>
    		
    		<tr>
    			<td>关键字:</td>
    			<td><input type="text" name="keyword"></td>
    		</tr>
    		
    		<tr>
    			<td>normalprice:</td>
    			<td>
    				From:<input type="text" name="lownormalprice">
    				To:<input type="text" name="highnormalprice">
    			</td>
    		</tr>
    		
    		<tr>
    			<td>memberprice:</td>
    			<td>
    				From:<input type="text" name="lowmemberprice">
    				To:<input type="text" name="highmemberprice">
    			</td>
    		</tr>
    		
    		<tr>
    			<td>pdate:</td>
    			<td>
    				From:<input type="text" name="startdate">
    				To:<input type="text" name="enddate">
    			</td>
    		</tr>
    		
    		<tr>
    			<td colspan="2"><input type="submit" value="搜索"></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
