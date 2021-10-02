<html>
<head>
  <meta name="google-signin-client_id" content="964618458675-r5pd87t7ip4fin7opv1i03ng0tcm03at.apps.googleusercontent.com">
</head>
<body>
  <div id="my-signin2">abx</div>
  <a href="#" onclick="signOut();">Sign out</a>
  <script>
  function onSignIn(googleUser) {
      // Useful data for your client-side scripts:
      var profile = googleUser.getBasicProfile();
      console.log("ID: " + profile.getId()); // Don't send this directly to your server!
      console.log('Full Name: ' + profile.getName());
      console.log('Given Name: ' + profile.getGivenName());
      console.log('Family Name: ' + profile.getFamilyName());
      console.log("Image URL: " + profile.getImageUrl());
      console.log("Email: " + profile.getEmail());
      // The ID token you need to pass to your backend:
      var id_token = googleUser.getAuthResponse().id_token;
      console.log("ID Token: " + id_token);
    }
    
    function signOut() {
  	    var auth2 = gapi.auth2.getAuthInstance();
  	    auth2.signOut().then(function () {
  	      console.log('User signed out.');
  	    });
  	  }
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
      var profile = googleUser.getBasicProfile();
      console.log("ID: " + profile.getId()); // Don't send this directly to your server!
      console.log('Full Name: ' + profile.getName());
      console.log('Given Name: ' + profile.getGivenName());
      console.log('Family Name: ' + profile.getFamilyName());
      console.log("Image URL: " + profile.getImageUrl());
      console.log("Email: " + profile.getEmail());
      // The ID token you need to pass to your backend:
      var id_token = googleUser.getAuthResponse().id_token;
      console.log("ID Token: " + id_token);
      var redirectUrl = 'Search.jsp';

      var form = $('<form action="' + redirectUrl + '" method="post">' +
                       '<input type="text" name="id_token" value="' +
                        googleUser.getAuthResponse().id_token + '" />' +
                                                             '</form>');
      $('body').append(form);
      form.submit();
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
</body>
</html>