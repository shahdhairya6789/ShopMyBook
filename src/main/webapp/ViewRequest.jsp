<%@page import="java.util.ArrayList"%>
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
<jsp:include page="myheader.jsp"/>
		<%
			Connection con=MysqlConnection.getConnection();
			String sql="select * from DummyBookDetails;";
			Statement stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			int k=0;
			while(rs.next())
			{
				ArrayList<String> al=new ArrayList<String>();
				String bookname=rs.getString("bookname");
				String email=rs.getString("email");
				String bookid=rs.getString("id");
// 				al.add(email);
// 				al.add(rs.getString("id"));
// 				al.add(rs.getString("booktype"));
// 				al.add(rs.getString("bookname"));
// 				al.add(rs.getString("authorname"));
// 				al.add(rs.getString("id"));
// 				al.add(rs.getString("id"));
// 				al.add(rs.getString("id"));
// 				al.add(rs.getString("id"));
				k++;
				%>
				<span style="font-size: 30px">Request <%=k %>:-</span><br><br>
				&emsp;&emsp;&emsp;&emsp;<span style="font-size: 25px">Email:<%=email %></span>
				<a href="ViewBookDetails.jsp?id=<%= bookid%>">View Book Details</a><br>	
				&emsp;&emsp;&emsp;&emsp;<span style="font-size: 25px">Bookname:<%=bookname %></span><br>
				<%
				%>
				<br>
				<br>
				<%
			}
		%>
</body>
</html>