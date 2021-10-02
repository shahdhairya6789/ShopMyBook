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
<!-- <title>Insert title here</title> -->
<!-- <script type="text/javascript" src="assests/js/jquery-3.3.1.js"></script> -->
<script>
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(150)
                .height(200);
               
        };
        reader.readAsDataURL(input.files[0]);
    }
}	
</script>
<style>
	.vl {
	margin-top:50px;
	margin-left:100px;
  border-left: 1px solid black;
  height: 500px;
  
}
#parent1{
    width:300px;
    height:800px;
    border-right:1px solid #000;
    margin-right:40px;
    margin-left:40px;
    float:left;
/* 	for form */
}
</style>
</head>
<body>
<jsp:include page="myheader.jsp"/>
<div style="display:inline-block;" id="parent1">
	<form action="ViewProfile" method="post" enctype="multipart/form-data">
	<img id="blah" src="assests/a.png" alt="your image" style="border-radius:50%;width:40px;height:40px;"/>
	<br>
	Edit:<input type="file" name="file1" id="file1" onchange="readURL(this);" />
	<br>	
	email:	${email}
	<br>
	<input type="submit" value="save">
	</form>
	<form action="Review.jsp">
		<br><input type="submit" value="review">
		
	</form>
</div>
<div class="" style="display:inline-block;">
		View Your Orders:-
		<br>
		<%
		String email=(String)request.getSession().getAttribute("email");
		Connection con1=MysqlConnection.getConnection();
		Statement stmt1=con1.createStatement();
	 	String sql1="select * from SoldDetails where email='"+email+"';";
	 	ResultSet rs1=stmt1.executeQuery(sql1);
	 	int k=0;
	 	while(rs1.next()) 
 		{
	 		k++;
	 		%>
	 		<br>
	 		<a href="ViewOrder.jsp?cartid=<%=rs1.getString("cartid")%>">View Order <%=k %></a>
	 		<%
 		}
		%>
</div>
</body>
</html>