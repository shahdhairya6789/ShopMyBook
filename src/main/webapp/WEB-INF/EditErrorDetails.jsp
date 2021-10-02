<%@page import="java.util.ArrayList"%>
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
</head>
<body>
			Change According to specified:-
			<%
			String id=request.getParameter("email");
			Connection con=MysqlConnection.getConnection();
			String sql="select * from SendErrorDetails where id='"+id+"';";
			Statement stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				request.setAttribute("bookid", rs.getString("id"));
				request.setAttribute("bookname",rs.getString("bookname"));
				request.setAttribute("authorname",rs.getString("authorname"));
				request.setAttribute("price",rs.getString("price"));
				request.setAttribute("quantity",rs.getString("quantity"));
				request.setAttribute("front",rs.getString("front"));
				request.setAttribute("back",rs.getString("back"));
				request.setAttribute("description",rs.getString("description"));
			%>
			<form action="EditErrorDetails" method="post" enctype="multipart/form-data">
			Type of Book:<select name="bookType">
				<option value="Comics">Comics</option>
  				<option value="Magazine">Magazine</option>
  				<option value="Educational">Educational</option>
  			 	<option value="Novels">Novels</option>
			</select><br>
			Name of book:<input type="text" name="bookName" value="<%=request.getAttribute("bookname")%>"><br>
			Author of book:<input type="text" name="authorName" value="<%=request.getAttribute("authorname")%>"><br>
			Price of book:<input type="text" name="price" value="<%=request.getAttribute("price")%>"><br>
			Book quantity:<input type="text" name="quantity" value="<%=request.getAttribute("quantity")%>"><br>
			Upload images:-<br>
			Front Image of book:<input type="file" name="front" value="<%=request.getAttribute("front")%>"><br>
			Back Image of book:<input type="file" name="back" value="<%=request.getAttribute("back")%>"><br>
			Description:<input type="text" name="description" value="<%=request.getAttribute("description")%>"><br>
			<input type="submit" value="Submit">
		</form>
			<%
			}
		%>
</body>
</html>