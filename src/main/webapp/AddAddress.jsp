<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
 	margin-left:330px; 
 
 } 
/* .one,.two,.three{ */
/* 	background-color:#b3b3b3; */
/* } */
fieldset{
	border:none;
   padding: 10px;
  box-shadow: 5px 10px 18px #888888;
margin-top:10px;

margin-left:350px;
}
p{
	margin-top:10px;
	margin-left:5%;
	font-weight :bold;
	font-size: 20px;
}
</style>
  
</head>
<body>
	<% 
		String quantitysold=request.getParameter("quantitysold");
		String soldid=request.getParameter("soldid");
		request.setAttribute("soldid", soldid);
	 	request.setAttribute("quantitysold", quantitysold);
	%>
	<div align="center">Select a Delievery Address:-</div><br><br>
	<form action="AddAddress">
			
			<fieldset style="align:center;width:55%;">			

			
			Full Name:<br>
			<input type="text" name="fname" class="form-control" id="usr"><br>
			Phone Number:<br>
			<input type="text" name="mnumber" class="form-control" id="usr"><br>
			Flat, House no., Building, Company, Apartment:<br> 
			<input type="text" name="fnumber" class="form-control" id="usr"><br>
			Area, Colony, Street, Sector, Village: <br>
			<input type="text" name="area" class="form-control" id="usr"><br>
			Landmark e.g. near apollo hospital:<br>
			<input type="text" name="lmark" class="form-control" id="usr">	
			<br>
		<input type="submit" id="button" value="Deliever to this Address">
		<input type="hidden" name="quantitysold" value="<%=request.getAttribute("quantitysold")%>">
		<input type="hidden" name="soldid" value="<%=request.getAttribute("soldid")%>">	
			</fieldset>	</form>
</body>
</html>