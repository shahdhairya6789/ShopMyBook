<html>
<head>
  <meta name="google-signin-client_id" content="384549347645-p98dakt356c8tfj8bf9vm2dkn84m6sm9.apps.googleusercontent.com">
</head>
<body>
  <div id="my-signin2" id="myP"></div>
  <br>
      <img id="myImg">
      <p id="name"></p> 
      <p id="name"></p> <p id="name"></p>      
      <div id="status1"><br>
<!--       <div id="token"> -->
   </div>
  <script>
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
      var profile = googleUser.getBasicProfile();
      var imagurl=profile.getImageUrl();
      var name=profile.getName();
      var email=profile.getEmail();
//       var token = googleUser.getAuthResponse().id_token;
//       document.getElementById("token").innerHTML = token;
      document.getElementById("myImg").src = imagurl;
      document.getElementById("name").innerHTML = name;
      document.getElementById("myP").style.visibility = "hidden";
      document.getElementById("status1").innerHTML = 'Welcome '+name+'!<a href=View.jsp?email='+email+'&name='+name+'/>Continue with Google login</a></p>'
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 240,
        'height': 50,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  </script>
  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
  <button onclick="myFunction()">Sign Out</button>
   <script>
      function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      location.reload();
   }
   </script>
</body>
</html>
