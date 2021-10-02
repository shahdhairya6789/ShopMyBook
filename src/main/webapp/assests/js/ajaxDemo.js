									
console.log("hello");
		$(document).ready(function(){
			$('#searchBtn').on("click", function() {
                window.location.href = 'ViewMoreDetails.jsp?q='+$('#text1').val();
               return false;
            });
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
 	                   window.location.href = 'ViewMoreDetails.jsp?q=' + ui.item.value;
 	                }
				});
		});