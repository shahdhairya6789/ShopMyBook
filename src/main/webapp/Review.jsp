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
<jsp:include page="myheader.jsp"/>
		<%
			String email=(String)session.getAttribute("email");
			Connection con=MysqlConnection.getConnection();
			String sql="select * from SellBookError where email='"+email+"';";
			Statement stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
				int k=0;
				while(rs.next())
				{
					k++;
					String errordesc=rs.getString("errordesc");
					String bookid=rs.getString("id");
					%>
					<br>
				<div style="margin-left: 100px;">
					Click below link to edit:<br>
					Error is :-<br><br>
					<a href="ViewErrorDetails.jsp?id=<%= bookid%>"><%=errordesc %></a><br>
				<br>
				<br>
					
				<%
				}
				
			if(k==0)
			{
				%>
				Nothing to Review!!!!
				<%
			}
		%>
		<form action="Search.jsp">
			<input type="submit" value="Go to Homepage">
		</form>
		</div>
</body>
</html>