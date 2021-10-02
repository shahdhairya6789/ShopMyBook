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
</style>

</head>
<body>
<jsp:include page="myheader.jsp"/>
<!-- 	<div id="parent1"> -->
<!-- 			<form action=""> -->
<!-- 				BookType:-<br> -->
<!-- 				<input type="checkbox" name="a" value="Novels">Novels<br> -->
<!-- 				<input type="checkbox" name="a" value="Educational">Educational<br> -->
<!-- 				<input type="checkbox" name="a" value="Comics">Comics<br> -->
<!-- 				<input type="checkbox" name="a" value="Magazine">Magazine<br> -->
<!-- 				<input type="checkbox" name="a" value="Magazine">Biography<br><br> -->
<!-- 				Book Price:-<br> -->
<!-- 				<input type="checkbox" name="a" value="Novels">100-200<br> -->
<!-- 				<input type="checkbox" name="a" value="Educational">200-300<br> -->
<!-- 				<input type="checkbox" name="a" value="Comics">300-400<br> -->
<!-- 				<input type="checkbox" name="a" value="Magazine">400-500<br> -->
<!-- 				<input type="checkbox" name="a" value="Magazine">Above 500<br> -->
<!-- 			</form> -->
<!-- 	</div> -->
	<%
	String cartid=request.getParameter("cartid");
	Connection con=MysqlConnection.getConnection();
	Statement stmt=con.createStatement();
 	String sql="select * from SoldDetails where cartid='"+cartid+"';";
 	ResultSet rs=stmt.executeQuery(sql);
 	while(rs.next())
 	{
 		String soldid=rs.getString("soldid");
 		String quantitysold=rs.getString("quantitysold");
 		String s[]=soldid.split(",");
 		String s1[]=quantitysold.split(",");
 		for(int i=0;i<s.length;i++)
 		{
 			Statement stmt1=con.createStatement();
 		 	String sql1="select * from SellBookDetails where id='"+s[i]+"';";
 		 	ResultSet rs1=stmt1.executeQuery(sql1);
 		 	int k=0;
 		 	while(rs1.next())
 		 	{
 		 		
 		 		%>
 		 		<img alt="" src="BookImages/<%=rs1.getString("front") %>" id="parent4">
 				<div id="parent3">
 					<span style="font-size: 30px"><%=rs1.getString("bookname") %></span><span style="font-size: 30px">&emsp;&emsp;&emsp;&emsp;Quantity:<%=s1[k] %></span><br>
 					<span style="font-size: 15px">&nbsp; &nbsp; &nbsp; by <%=rs1.getString("authorname") %></span><br><br>
 					<span style="font-size: 15px; color: red">&#8377; <span style="font-size: 25px; color: red"><%=rs1.getString("price") %></span></span><br>
 				</div>
 				<hr style="margin-top:70px;width:1030px;margin-left: 0px;">
 		 		<%
 		 		k++;
 		 	}
 		}
 	}
	%>
</body>
</html>