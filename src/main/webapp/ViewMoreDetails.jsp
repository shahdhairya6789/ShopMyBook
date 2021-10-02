<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
div{
	display: block;
}
</style>
</head>
<body>
<jsp:include page="myheader.jsp"/>
	<%
	Connection con=MysqlConnection.getConnection();
		String q=request.getParameter("q");
		String id="";
		if(q!=null)
		{
			Statement stmt1=con.createStatement();
			String sql1="select * from SellBookDetails where bookname='"+q+"';";
			ResultSet rs1=stmt1.executeQuery(sql1);
			while(rs1.next())
			{
				id=rs1.getString("id");
			}
		}
		else
			id=request.getParameter("id");
		request.setAttribute("id", id);
		
		Statement stmt=con.createStatement();
		String sql="select * from SellBookDetails where id='"+id+"'";
		ResultSet rs=stmt.executeQuery(sql);
		String front=null,back=null,bookname=null,authorname=null,price=null,quantity=null,description=null,booktype=null;
		while(rs.next())
		{
			front=rs.getString("front");
			back=rs.getString("back");
			bookname=rs.getString("bookname");
			authorname=rs.getString("authorname");
			price=rs.getString("price");
			request.setAttribute("price", price);
			quantity=rs.getString("quantity");
			description=rs.getString("description");
			booktype=rs.getString("booktype");
		}	
	%>
	<div>
	<img alt="" src="BookImages/<%=front%>" height="450px" width="300px" id="viewparent1" style="align-self: left">
	</div>
	<div>
		<br>
		<div style="border: 6px solid grey; border-radius:6px; width: 300px; height:600px; margin-top: 100px" id="viewparent3">
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price:
		<br>&emsp;&nbsp;<span style="font-weight: bold; font-size: 25px; color: red;">&#8377;<%=price%></span>
		<br>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-style: oblique;font-weight:bold; font-size: larger; color:rgba(30, 130, 76, 1);">Stock Available</span><br>
		<form action="AddtoCart.jsp">
			<br>&emsp;&nbsp;Quantity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="quantity">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>	
				<option value="5">5</option>
			</select><br>
	
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="cart" value="Add to Cart" width=500%><br><br>
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="cart" value="Buy Now"width=500%><br>
			<input type="hidden" name="id" value=<%=request.getAttribute("id")%>>
			<input type="hidden" name="price" value=<%=request.getAttribute("price")%>>
		</form>
		</div>
		<span style="font-weight: bolder; font-size: 30px;">&nbsp;&nbsp;<%=bookname%></span>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;by<span style="font-weight: bold; font-size: 15px; color: red;">&nbsp;<%=authorname%></span><br>
		<br><span style="font-weight: bold; font-size: 17px; color: olive;">BookType:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold; font-size: 21px; color: orange;">&nbsp;<%=booktype%></span><br>
		
		<br>&nbsp;&nbsp;&nbsp;&nbsp;<span  style="font-weight: bold;align-self:center; font-family:sans-serif; font-size: 16px; color: navy;text-align: center;">&nbsp;<%=description%></span>
		
	</div>
	<div id="viewparent2">
	<img alt="" src="BookImages/<%=front%>" height="60px" width="60px">
	<img alt="" src="BookImages/<%=front%>" height="60px" width="60px">	
	</div>
	<div id="viewparent2">
	See all 2 images
	</div>
</body>
</html>