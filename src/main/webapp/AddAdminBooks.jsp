<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<form action="AddAdminBooks" method="post" enctype="multipart/form-data">
			Type of Book:<select name="bookType">
				<option value="Comics">Comics</option>
  				<option value="Magazine">Magazine</option>
  				<option value="Educational">Educational</option>
  				<option value="Novels">Novels</option>
  				<option value="Biography">Biography</option>
			</select><br>
			Name of book:<input type="text" name="bookName"><br>
			Author of book:<input type="text" name="authorName"><br>
			Price of book:<input type="text" name="price"><br>
			Book quantity:<input type="text" name="quantity"><br>
			Upload images:-<br>
			Front Image of book:<input type="file" name="front"><br>
			Back Image of book:<input type="file" name="back"><br>
			Description:<input type="text" name="description"><br>
			<input type="submit" value="Submit">
		</form>
</body>
</html>