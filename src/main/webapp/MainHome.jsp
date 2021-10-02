<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.img{
		widht:259px;
		height:194px;
	}
</style>
</head>
<body>
<jsp:include page="myheader.jsp"/>
<%
	String fla=request.getParameter("flag");
	if(fla!=null)
	{
		%>
		<script>
		myFunction();
		function myFunction() {
				alert("Your Book has been sent for review!!!!");
		}
		</script>			
	<%
	}
%>
<div align="center">
<a href="Trending.jsp"><img src="assests/trending.png" id="parent1" class="img-thumbnail" style="width:700px;height:300px;"></a>
</div>

<div align="center">
<a href="Homepage.jsp"><img src="assests/new Books.jpg" id="parent1" class="img-thumbnail" style="width:259px;height:194px;"></a>
<a href="OldBook.jsp"><img src="assests/old books.jpg" id="parent1" class="img-thumbnail" style="width:259px;height:194px;"></a>
<a href="SellBook.jsp"><img src="assests/sell image.jpg" id="parent1" class="img-thumbnail" style="width:259px;height:194px;"></a>
</div>
</body>
</html>