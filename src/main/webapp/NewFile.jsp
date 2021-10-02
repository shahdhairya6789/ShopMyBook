<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.MysqlConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
			String id=request.getParameter("id");
		Connection con=MysqlConnection.getConnection();
		String sql="select * from DummyBookDetails where id='"+id+"';";
		Statement stmt = con.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			String bookname=rs.getString("bookname");
			String email=rs.getString("email");
			request.setAttribute("bookid", rs.getString("id"));
			%>
		
			email:-<%=rs.getString("email")%>
			<br>
			BookType:-<%=rs.getString("booktype")%>
			<br>
			
			BookName:-<%=bookname%>
			<br>
			
			AuthorName:-<%=rs.getString("authorname")%>
			<br>
			
			Price:-<%=rs.getString("price")%>
			<br>
			
			Book Description:-<%=rs.getString("description") %><%} %>
</body>
</html>