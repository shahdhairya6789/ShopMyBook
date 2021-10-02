<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
      <link rel="stylesheet" href="Signup.css">
      <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="964618458675-r5pd87t7ip4fin7opv1i03ng0tcm03at.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>

<body>
<%
	String cart=request.getParameter("cart");
	request.setAttribute("cart", cart);
	String id=request.getParameter("id");
	request.setAttribute("id", id);
	String gotopage=request.getParameter("gotopage");
	request.setAttribute("gotopage", gotopage);
	String quantity=request.getParameter("quantity");
	request.setAttribute("quantity", quantity);
	String price=request.getParameter("price");
	request.setAttribute("price", price);
	%>
  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>
          <%
            	String error=(String)request.getAttribute("error");
            	if(error!=null)
            		out.println(error);
            %>
            </h1>
          <form action="CheckSignup" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
            
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" name="fName" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" name="lName" required autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
          </div>
      		<input type="hidden" name="cart" value=<%=request.getAttribute("cart")%>>
          	<input type="hidden" name="id" value=<%=request.getAttribute("id")%>>
          	<input type="hidden" name="gotopage" value=<%=request.getAttribute("gotopage")%>>
          	<input type="hidden" name="quantity" value=<%=request.getAttribute("quantity")%>>
          	<input type="hidden" name="price" value=<%=request.getAttribute("price")%>>    
          <div class="g-signin2" data-onsuccess="onSignIn" data-redirecturi="http://localhost:8080/ShopMyBook/Search.jsp"></div>
			<br>		
          <br>
                   
          <button type="submit" class="button button-block">Next</button>
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="Checklogin" method="post">
          
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" required/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
          	<input type="hidden" name="cart" value=<%=request.getAttribute("cart")%>>
          	<input type="hidden" name="id" value=<%=request.getAttribute("id")%>>
          	<input type="hidden" name="gotopage" value=<%=request.getAttribute("gotopage")%>>
          	<input type="hidden" name="quantity" value=<%=request.getAttribute("quantity")%>>
          	<input type="hidden" name="price" value=<%=request.getAttribute("price")%>>
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          
          <div class="g-signin2" data-onsuccess="onSignIn" data-redirecturi="http://localhost:8080/ShopMyBook/Search.jsp"></div>
			<br>		
          <br>
          
          <button class="button button-block">Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="Signup.js"></script>
</body>

</html>