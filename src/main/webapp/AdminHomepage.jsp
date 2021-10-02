<%@page import="java.sql.PreparedStatement"%>
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
</head>
<body>
<jsp:include page="myheader.jsp"/></br>
		<div align="center">
		<%
			int k=0;
			Connection con = MysqlConnection.getConnection();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from DummyBookDetails");
			while(rs.next())
			{
				k++;
			}
			out.println("Request Pengding:"+k);
			if(k!=0)
			{
				%>
					<script>
					var n=<%=k%>
					myFunction();
					function myFunction() {
  						alert("You have "+n+" notifications!!!!");
					}
					</script>			
				<%
			}
		%>
		<form action="AddAdminBooks.jsp">
			</br><input type="submit" value="Add Book"></br>
		</form></br>
		<button><a href="ViewRequest.jsp" style="text-decoration: none;color:black">View New Request</a></button>
</div>
</body>
</html>