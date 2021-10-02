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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	 
	input:hover[type=submit] {
  		background-color: rgb(176,176,176);
		}
#button 
{
  width: 150px;
margin-left:210px;
 
}
.one,.two,.three{
/* 	background-color:#8b6b61; */
}
fieldset{
	border:none;
   padding: 10px;
/*   box-shadow: 5px 10px 18px #888888; */
margin-top:-13px;
}
p{
	margin-top:10px;
	margin-left:5%;
	font-weight :bold;
	font-size: 20px;
}
#one{
		float: left;
		 display:inline;
		 width:70%;
		 margin-left:5%;
}
#two{
		float: right;
		 display:inline;
		 width:25%; 
}
</style>
</head>
<body>
<jsp:include page="myheader.jsp"/>
		<%
			String id=request.getParameter("id");
			Connection con=MysqlConnection.getConnection();
			String sql="select * from SellBookError where id='"+id+"';";
			Statement stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			if(rs!=null)
			{
				while(rs.next())
				{
					String errordesc=rs.getString("errordesc");
					request.setAttribute("email",rs.getString("email"));
					request.setAttribute("id",rs.getString("id"));
					request.setAttribute("bookname", rs.getString("bookname"));
					request.setAttribute("authorname", rs.getString("authorname"));
					request.setAttribute("price", rs.getString("price"));
					request.setAttribute("quantity", rs.getString("quantity"));
					request.setAttribute("front", rs.getString("front"));
					request.setAttribute("back", rs.getString("back"));
					request.setAttribute("description", rs.getString("description"));
					%>
					Wanna Edit this error:<br>
					Error is:-<%=errordesc %><br>
					
					<div id="one">
		<form action="getBookDetails" method="post" enctype="multipart/form-data">
			<p>Book Details</p>
			<fieldset class="one" style="align:center;width:55%;margin-left:5%;">			
				Type of Book:&emsp;&nbsp;&nbsp;&nbsp;<select name="bookType">
				<option value="Comics">Comics</option>
  				<option value="Magazine">Magazine</option>
  				<option value="Educational">Educational</option>
  			 	<option value="Novels">Novels</option>
			</select><br>
			Name of book:&emsp;&nbsp;&nbsp;<input type="text" name="bookName" value="<%=request.getAttribute("bookname")%>" required><br>
			Author of book:&emsp;<input type="text" name="authorName" value="<%=request.getAttribute("authorname") %>" required><br>
			Price of book:&emsp;&nbsp;&nbsp;&nbsp;<input type="text" name="price" value="<%=request.getAttribute("price") %>" required ><br>
			Book quantity:&emsp;&nbsp;&nbsp;<input type="text" name="quantity" value="<%=request.getAttribute("quantity") %>" required><br>
			
			</fieldset>
<p>Book Images</p>
			<fieldset  class="two"  style="align:center;width:55%;margin-left:5%;">
				
			
			Front Image of book:&emsp;<input type="file" name="front" required><br>
			Back Image of book:&emsp;<input type="file" name="back" value="<%=request.getAttribute("back") %>" required><br>
			</fieldset>	
		<p>Description</p>
		<fieldset  class="three"style="align:center;width:55%;margin-left:5%">
			<input type="text" name="description" value="<%=request.getAttribute("description") %>"><br/>			
		</fieldset>	
			<input type="hidden" name="id" value="<%=request.getAttribute("id")%>">
		<br><input id="button" class="btn btn-primary" type="submit" value="Submit" />
		</form>
</div>
<div id="two">
	<center><img src="assests/something.png"></center>
</div>
					
<!-- 					<form action="EditErrorDetails" method="post" enctype="multipart/form-data"> -->
<!-- 						Type of Book:<select name="bookType"> -->
<!-- 						<option value="Comics">Comics</option> -->
<!--   						<option value="Magazine">Magazine</option> -->
<!--   						<option value="Educational">Educational</option> -->
<!--   			 			<option value="Novels">Novels</option> -->
<!-- 						</select><br> -->
						
						
<%-- 					Name of book:<input type="text" name="bookName" value="<%=request.getAttribute("bookname")%>"><br> --%>
<%-- 					Author of book:<input type="text" name="authorName" value="<%=request.getAttribute("authorname") %>"><br> --%>
<%-- 					Price of book:<input type="text" name="price" value="<%=request.getAttribute("price") %>"><br> --%>
<%-- 					Book quantity:<input type="text" name="quantity" value="<%=request.getAttribute("quantity") %>"><br> --%>
<!-- 					Upload images:-<br> -->
<!-- 					Front Image of book:<input type="file" name="front" value="abc"><br> -->
<%-- 					Back Image of book:<input type="file" name="back" value="<%=request.getAttribute("back") %>"><br> --%>
<%-- 					Description:<input type="text" name="description" value="<%=request.getAttribute("description") %>"><br> --%>
<%-- 					<input type="hidden" name="id" value="<%=request.getAttribute("id")%>"> --%>
<!-- 					<input type="submit" value="Submit"> -->
					</form>
					<%
				}
			}
			else
			{
				out.println("No Data Found");
			}
		%>
</body>
</html>