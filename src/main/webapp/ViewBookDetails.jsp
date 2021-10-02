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
<style type="text/css">

.container {
  position: relative;
  width: 20%;
}
#parent1{
    width:200px;
    height:400px;
    border-right:1px solid #000;
    margin-right:10px;
    float:left;
}
#parent2{
	margin-left: 200px
}
#parent3{
	width:200px;
    height:100px;
    border:1px solid red;
    margin-right:10px;
    float:left;
}
#parent4{
	width:200px;
    height:100px;
    border:1px solid red;
    margin-right:10px;
    float:left;
}
img{
width: 180px;
height: 180px;
}

</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="myheader.jsp"/>
<div style="margin-left: 60px;font-size: 20px">
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
			
			Book Description:-<%=rs.getString("description") %>
			<br>
			<br>
			<br>
  			Front Image:-<img src="BookImages/<%=rs.getString("front")%>" alt="Avatar">  
<%--   					AuthorName:-<%=rs.getString("authorname")%><br> --%>
<%--   					BookName:-<%=bookname%><br>  --%>
			<hr>
			<br>
			Back Image:-
  				<img src="BookImages/<%=rs.getString("back")%>" alt="Avatar">   
			<hr>
			
			
			
			<%
		}
		%>
		<form action="SellBookDetails">
			<input type="hidden" name="id" value="<%=request.getAttribute("bookid")%>">
			<input type="submit" value="Accept Book"><br>
		</form>
		--OR--
		<form action="SendError">
			Changes Required:<input type="text" name="errordesc">
			<input type="hidden" name="id" value="<%=request.getAttribute("bookid")%>">
			<input type="submit" value="Comment on Query">
		</form>
	</div>
</body>
</html>