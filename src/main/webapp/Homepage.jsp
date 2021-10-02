<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#parent1{
	width: 300px;
	height: 300px;
	padding: 40px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="myheader.jsp"/>
<%-- <jsp:include page="advertise.html"/> --%>
<a href="ViewBook.jsp?type=Novels"><img src="BookImages/Adminnovel.jpg" id="parent1"></a>
<a href="ViewBook.jsp?type=Educational"><img src="BookImages/Admineducational.jpg" id="parent1"></a>
<a href="ViewBook.jsp?type=Comics"><img src="BookImages/AdminComics.jpg" id="parent1"></a>
<a href="ViewBook.jsp?type=Biography"><img src="BookImages/Adminbiography.png" id="parent1"></a>
<a href="ViewBook.jsp?type=Magazine"><img src="BookImages/Adminmagazine.jpg" id="parent1"></a>
<button style="text-decoration: none"><a href="MainHome.jsp">Go to home page</a></button>
</body>
</html>