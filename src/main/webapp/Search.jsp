<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.MysqlConnection"%>
<%@page import="java.sql.Connection"%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
</head>
<body>

<% 
	String a[]=new String[]
	    			 {"Comics","Superman","Batman","Spider-man","X-men","Captain America","Avengers","Naruto","Dragon Ball",
	    			 "Mystery","Gone Girl","The girl on the train","The Cuckoo's Calling","11/22/33","The Silkworm","Dark Places","Career of Evil","Big Little Lies",
	    			 "Romance","Twilight","Fifty Shades of Grey","The Hunger Games","Anna and the French Kiss","A Walk to Remember","Thirteen Reasons Why","Reasons to Breathe","Beautiful Disaster",
	    			 "Science Fiction","The Time Machine","2001: A Space Odyssey","Starship Troopers","The Host","Contact","Frankenstein","Doomsday Book","The Invisible Man",
	    			 "Short Story","Interpreters of Maldives","Tenth of December","Nine Stories","Dubliners","The Lottery","Dear Life","The Grownup","Get in Trouble",
	    			 "Biography","Steve Jobs","The Rise of Theodore Roosevelt","Benjamin Franklin: An American Life","Einstein:His Life and Universe","Teams of Rivals: The Genius of Abraham Lincoln","The Diary of A young Girl","Into The Wild","John Adams",
	    			 "Suspense","The Da Vinci Code","Shutter Island","Angels & Demons","Red Dragon","Mystic River","The Client","Killing Floor","Vigilante",
	    			 "Textbooks","Data Structure","Database Management System","Computer Networks","Computer Organisation","Operating System","Data Algorithms and Analysis","Theory of Computation","Engineering Mathematics"}; 
 
 	String x="";
 	for(int i=0;i<a.length;i++)
 	{
 		x=x+a[i]+',';
 	}
 	String email=(String)session.getAttribute("email");
 	Connection con=MysqlConnection.getConnection();
	String sql="select * from SellBookError where email='"+email+"'";
	Statement stmt = con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	int k=0;
	while(rs.next())
	{
			k++;	
	}
	if(k!=0)
	{
		%>
			<script>
			var n=<%=k%>
			myFunction();
			function myFunction() {
					alert("Please review your uploaded book There is some problem!!!!");
			}
			</script>			
		<%
	}
 %>
	<form action="Search">
<!-- <div class="ui-widget"> -->
<!--   <label for="tags">Tags: </label> -->
<!--   <input id="tags" name="search"> -->
<!-- </div> -->
	<input type="text" id="tags" name="search">
	<input type="submit" value="GO">
 	</form>
 	<form action="SellBook.jsp">
 		<input type="submit" value="Sell Book">
 	</form>
 <script>
  var str="<%=x%>";
  var array = str.split(',');
	console.log(array);
  $( function() {
    $("#tags").autocomplete({
      source: array
    });
  } );
  </script>
  <form action="Review.jsp">
  		<input type="submit" value="Review Book">
  </form>
</body>
</html>