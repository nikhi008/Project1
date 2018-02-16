  	
  	<script>
  		var app = angular.module('myApp', []);
   		app.controller('StudentCtrl', function($scope, $http) {

   		
   			$scope.student=JSON.parse('${studentJSON}');			
   			 			   		  			 			  			
   		});   	
   		</script>