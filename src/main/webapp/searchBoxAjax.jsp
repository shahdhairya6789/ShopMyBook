<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search box</title>
 <link href = "assests/css/jquery-ui.css"
         rel = "stylesheet">
<link href = "assests/css/jquery-ui.structure.css"
         rel = "stylesheet">
<link href = "assests/css/jquery-ui.theme.css"
         rel = "stylesheet">
      <script src = "assests/js/jquery-3.3.1.js"></script>
            <script src = "assests/js/jquery-ui.min.js"></script>
<style>
       .ui-autocomplete {
            max-height: 200px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
        } 
</style>
</head>

<script>									
console.log("hello");
		$(document).ready(function(){
				$('#text1').autocomplete({
					source:function(request,response){
						$.ajax({
		 					type:'POST',
		 					data:{id: $('#text1').val()},
		 					datatype:'text',
		 					url:'SearchAjax2',
// 		 					 success: function (data) {
// 		 						console.log(data);
// 		                            response(data.name);//name is "field name"
// 		                        },

		 					success: function(data){
		 							console.log(data);
		 							var stringList = $.map(data, function(element){
                                        return element.name;//name is "field name"
		 							})
		 							console.log(stringList);
		 							response(stringList);
									
		 					}
		 					
		 				});
					},
					select: function(event, ui) {
 						console.log("select");
 	                   window.location.href = 'index.jsp?q=' + ui.item.value;;
 	                }
				});
		});
	</script>
<body>
	<input type="text" id="text1" value=""/>
</body>
</html>