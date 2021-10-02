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

 	<% 
 	String email=(String)session.getAttribute("email");
 	Connection con=MysqlConnection.getConnection();
 	Statement stmt=con.createStatement();
 	String sql="select s.authorname,s.front,s.bookname,c.quantity,c.price,c.id,c.email from CartDetails c join SellBookDetails s on c.id=s.id where c.email='"+email+"';";
 	ResultSet rs=stmt.executeQuery(sql);
 	int c=0,total=0;
 	String soldid="";
 	String quantitysold="";
 	while(rs.next())
	{
 		soldid=soldid+rs.getString("c.id")+",";
		quantitysold=quantitysold+rs.getString("c.quantity")+",";
		c=c+Integer.parseInt(rs.getString("c.quantity"));
		total=total+(Integer.parseInt(rs.getString("c.quantity"))*Integer.parseInt(rs.getString("c.price")));
	}
 	request.setAttribute("soldid", soldid);
 	request.setAttribute("quantitysold", quantitysold);
	con.close();
	%>
	
		<br>
		<div style="border: 6px solid grey; border-radius:6px; width: 300px; height:600px; margin-top: 100px" id="viewparent3">
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subtotal Items:
		<br>&emsp;&nbsp;<span style="font-weight: bold; font-size: 25px; color: red;"><%=c %></span>
		<br>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-style: oblique;font-weight:bold; font-size: larger; color:rgba(30, 130, 76, 1);">Stock Available</span><br>
			<br>&emsp;&nbsp;Total:&#8377;<%=total %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<br>
		<form action="AddAddress.jsp">
			<input type="submit" value="Place Order">
			<input type="hidden" name="soldid" value="<%=request.getAttribute("soldid")%>">
			<input type="hidden" name="quantitysold" value="<%=request.getAttribute("quantitysold")%>"> 
		</form>
		</div>
	<%
	Connection con1=MysqlConnection.getConnection();
	Statement stmt1=con1.createStatement();
 	String sql1="select s.authorname,s.front,s.bookname,c.quantity,c.price,c.id,c.email from CartDetails c join SellBookDetails s on c.id=s.id where c.email='"+email+"';";
 	ResultSet rs1=stmt1.executeQuery(sql1);
 	
 	while(rs1.next()) 
 	{ 
		
		%>
	<img alt="" src="BookImages/<%=rs1.getString("s.front") %>" id="parent4">
	<div id="parent3">
		<span style="font-size: 30px"><%=rs1.getString("s.bookname") %></span><br>
		<span style="font-size: 15px">&nbsp; &nbsp; &nbsp; by <%=rs1.getString("s.authorname") %>&nbsp; &nbsp; &nbsp;Quantity:<%=rs1.getString("c.quantity") %></span><br><br>
		<span style="font-size: 15px; color: red">&#8377; <span style="font-size: 25px; color: red"><%=rs1.getString("c.price") %></span></span><br>
		<a href="DeletefromCart?id=<%=rs1.getString("c.id")%>">Delete</a>
	</div>
	<hr style="margin-top:70px;width:700px;margin-left: 0px;">
	<%
 	}
 	%> 	
 	<form action="Homepage.jsp">
 		<input type="submit" value="Go to Homepage">
 	</form>
</body>
</html>