<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.MysqlConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

#viewparent1
{
	margin: 20px;
	float: left;
	clear: left;
}

#viewparent2
{
	margin:20px;
	float: left;
	clear: left;
}
#viewparent3
{
	margin:100px;
	float: right;
	clear: right;
}
</style>

</head>
<body>
<jsp:include page="myheader.jsp"/>
		Top 10 Trending Books this Month:
		<br>
		<br>
		<br>
		<div style="border: 6px solid grey; border-radius:6px; width: 300px; height:100px; margin-top: 100px" id="viewparent3">
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<form action="MainHome.jsp">
				<input type="submit" value="Go to Main Page">
			</form>
	
		</div>
		<%
		Connection con1=MysqlConnection.getConnection();
		Statement stmt1=con1.createStatement();
	 	String sql1="select * from SellBookDetails where email like 'admin' order by quantity;";
	 	ResultSet rs1=stmt1.executeQuery(sql1);
		int k=0;
	 	while(rs1.next()) 
 		{ 
		k++;
		if(k==11)
			break;
		%>
	<img alt="" src="BookImages/<%=rs1.getString("front") %>" id="parent4">
	<div id="parent3">
		<span style="font-size: 30px"><%=rs1.getString("bookname") %></span><br>
		<span style="font-size: 15px">&nbsp; &nbsp; &nbsp; by <%=rs1.getString("authorname") %></span><br><br>
		<span style="font-size: 15px; color: red">&#8377; <span style="font-size: 25px; color: red"><%=rs1.getString("price") %></span></span><br>
		<a href="ViewMoreDetails.jsp?id=<%=rs1.getString("id")%>">View More Details</a>
	</div>
	<hr style="margin-top:70px;width:700px;margin-left: 0px;">
	<%
 	}
 	%>
</body>
</html>