<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.MysqlConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page import="java.util.ArrayList,com.bean.Project"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">

.container {
  position: relative;
  width: 20%;
}

#parent1{
    width:200px;
    height:800px;
    border-right:1px solid #000;
    margin-right:10px;
    float:left;
/* 	for form */
}

#parent3{
	margin-left: 30%;
}

#parent4{
	width:200px;
    height:200px;
    border:1px solid white;
    margin-left:10px;
    float:left;
}
</style>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="myheader.jsp"/>
	<%
		String type=request.getParameter("type");
		Connection con=MysqlConnection.getConnection();
		Statement stmt=con.createStatement();
		String sql="select * from SellBookDetails where booktype='"+type+"'";
		ResultSet rs=stmt.executeQuery(sql);
		ArrayList<Project> projectList = new ArrayList<Project>();
		while(rs.next()){
    		Project project = new Project();
	    	project.setBooktype(rs.getString("booktype"));
	    	project.setEmail(rs.getString("email"));
	    	project.setId(rs.getString("id"));
	    	project.setBookname(rs.getString("bookname"));
	    	project.setAuthorname(rs.getString("authorname"));
	    	project.setPrice(rs.getString("price"));
	    	project.setQuantity(rs.getString("quantity"));
	    	project.setFront(rs.getString("front"));
	    	project.setBack(rs.getString("back"));
	    	project.setDescription(rs.getString("description"));
    		projectList.add(project);
  		}
  	request.setAttribute("table", projectList);
	%>
<body>
	<div id="parent1">
			<form action="">
				BookType:-<br>
				<input type="checkbox" name="a" value="Novels">Novels<br>
				<input type="checkbox" name="a" value="Educational">Educational<br>
				<input type="checkbox" name="a" value="Comics">Comics<br>
				<input type="checkbox" name="a" value="Magazine">Magazine<br>
				<input type="checkbox" name="a" value="Magazine">Biography<br><br>
				Book Price:-<br>
				<input type="checkbox" name="a" value="Novels">100-200<br>
				<input type="checkbox" name="a" value="Educational">200-300<br>
				<input type="checkbox" name="a" value="Comics">300-400<br>
				<input type="checkbox" name="a" value="Magazine">400-500<br>
				<input type="checkbox" name="a" value="Magazine">Above 500<br>
			</form>
	</div>
	<display:table name="table" sort="list" pagesize="3" id="table1">
		<display:column>
<!-- 		<div id="parent4"> -->
			<img alt="" src="BookImages/${table1.front}" id="parent4">
			<div id="parent3">
				<span style="font-size: 30px">${table1.bookname}</span><br>
				<span style="font-size: 15px">&nbsp; &nbsp; &nbsp; by ${table1.authorname}</span><br><br>
				<span style="font-size: 15px; color: red">&#8377; <span style="font-size: 25px; color: red">${table1.price}</span></span><br>
				<a href="ViewMoreDetails.jsp?id=${table1.id}">View More Details</a>
			</div>
			<hr style="margin-top:70px;width:1030px;margin-left: 0px;">			
		</display:column>
<%-- 		<display:column> --%>
		
<!-- 			<hr style="margin-top:220px;width:1030px;margin-left: 0px;">			 -->
<%-- 		</display:column> --%>
	</display:table>
	
</body>
</html>