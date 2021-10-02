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
			String cart=request.getParameter("cart");
			String id=request.getParameter("id");
			String quantity=request.getParameter("quantity");
			String price=request.getParameter("price");
			String email=(String)session.getAttribute("email");
 			out.println(cart);
 			out.println(id);
 			out.println(quantity);
 			out.println(price);
 			out.println(email);
 			out.println(cart);
			if(email==null)
			{
				//out.println("Email is null");
				response.sendRedirect("AgainSigninDetails.jsp?cart="+cart+" &id="+id+" &gotopage='AddtoCart' &quantity="+quantity+" &price="+price+"");
			}
			else
			{
			if(cart.charAt(0)=='A')
			{
				out.println(cart);
				out.println(id);
				out.println(quantity);
				out.println(price);
				out.println(email);
				%>
				<script>
					myFunction();
					function myFunction() {
  						alert("Added to Cart!!!!!");
					}
					</script>	
				<%
				out.println("Updated");
				Connection con=MysqlConnection.getConnection();
				out.println("Updated");
				PreparedStatement pst=con.prepareStatement("insert into CartDetails(email,id,price,quantity) values(?,?,?,?)");
				out.println("Updated");
				pst.setString(1, email);
				pst.setString(2, id);
				pst.setString(3, price);
				pst.setString(4, quantity);
				out.println("Update\\d");
				int i=pst.executeUpdate();
				out.println("i is "+i);
				response.sendRedirect("ShowCart.jsp");
			}
			else
			{
// 				out.println("Inner Else");
			}
			}
		%>
</body>
</html>