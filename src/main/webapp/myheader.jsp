<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
</style>
<script src = "assests/js/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="assests/css/header.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- ----------- -->


<!-- <link rel="stylesheet" href="bootstrap.min.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
  
  
<!--   for ajax demo -->
  <script src="assests/js/ajaxDemo.js"></script>
  <link href = "assests/css/jquery-ui.css"
         rel = "stylesheet">
<link href = "assests/css/jquery-ui.structure.css"
         rel = "stylesheet">
<link href = "assests/css/jquery-ui.theme.css"
  	       rel = "stylesheet">
      
            <script src = "assests/js/jquery-ui.min.js"></script>
<style>
/* relevant styles */
.img__wrap {
/*   position: ; */
/*   height: 150px; */
/*   width: 150px; */
display: inline-block;
 margin-left:90px; 
/* display: inline-block; */
}

.img__description {
  
  background: red;
  color: blue;
  visibility: hidden;
  margin-top:30px;
  height:75px;
  opacity: 0;
	border-bottom-left-radius: 150px;
  border-bottom-right-radius: 150px;
  /* transition effect. not necessary */
  transition: opacity .2s, visibility .2s;
}

/*  .img__wrap:hover  .img__description{ */
  /*   visibility: visible;  */
/*    opacity: 1;  */
/*   text-align: center;    */
}	
	
</style>
</head>
<body>

<div class="header">
<!-- 	<div class="header-right" > -->
	<a href="#default" class="logo">Shop Mybook</a>
	<div class="main" style="float:left;margin-left:70px;">  
  <!-- Another variation with a button -->
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Search" id="text1">
    <div class="input-group-append">
      <button class="btn btn-secondary" id="searchBtn" type="button">
        <i class="fa fa-search"></i>
      </button>
    </div>
  </div>
</div>
	<div class="img__wrap">
		<%String email=(String)session.getAttribute("email"); 
    String s[]=null;
    String s1="";
    	if(email!=null){
    		s=email.split("@");
    		s1=s[0];
    	}
    %>									
    <script type="text/javascript">
	function view(e){
		console.log("view");
		var s="${email}";
		if(s!=""){
			window.location.href='ViewProfile.jsp';
		}	
	}
</script>
		<img id="image1" alt="" src="assests/a.png" onclick="view();"/></br>
		<p><%=s1!=null?s1:"!signin"%></p>
<!--   		<p class="img__description" >update</p> -->
	</div>
	
<!-- login/signin button  -->
	<div class="header-right">
    	<a href=<%=email!=null?"Logout":"AgainSigninDetails.jsp"%> class="logo1">
    		<%=email!=null?"   Signout  ":"Login/SignIn"%>
    	</a>
    <a href="#cart" class="logo1"> <span class="fa fa-shopping-cart"></span>&nbsp;Cart</a>
  	</div>
</div>  	
  	

<!-- <div id="demo" class="carousel slide" data-ride="carousel" style="background-color: red;"> -->

<!--   <!-- Indicators --> 
<!--   <ul class="carousel-indicators"> -->
<!--     <li data-target="#demo" data-slide-to="0" class="active"></li> -->
<!--     <li data-target="#demo" data-slide-to="1"></li> -->
<!--     <li data-target="#demo" data-slide-to="2"></li> -->
<!--   </ul> -->
<!--   <!-- The slideshow -->
<!--   <div class="carousel-inner"> -->
<!--     <div class="carousel-item active"> -->
<!--       <img src="assests/z.png" alt="Los Angeles" width="1100" height="500"> -->
<!--     </div> -->
<!--     <div class="carousel-item"> -->
<!--       <img src="assests/a.png" alt="Chicago" width="1100" height="500"> -->
<!--     </div> -->
<!--     <div class="carousel-item"> -->
<!--       <img src="assests/z.png" alt="New York" width="1100" height="500"> -->
<!--     </div> -->
<!--   </div> -->
<!--   <!-- Left and right controls --> 
<!--   <a class="carousel-control-prev" href="#demo" data-slide="prev"> -->
<!--     <span class="carousel-control-prev-icon"></span> -->
<!--   </a> -->
<!--   <a class="carousel-control-next" href="#demo" data-slide="next"> -->
<!--     <span class="carousel-control-next-icon"></span> -->
<!--   </a> -->
<!-- </div> -->

</body>
</html>