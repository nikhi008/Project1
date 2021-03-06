<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl">
	<head>
 		<title>Teacher </title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />   		
   		<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
   		<style type="text/css">



				/*Now the CSS*/
				* {margin: 0; padding: 0;}
				
				.tree ul {
					padding-top: 20px; position: relative;
					
					transition: all 0.5s;
					-webkit-transition: all 0.5s;
					-moz-transition: all 0.5s;
				}
				
				.tree li {
					float: left; text-align: center;
					list-style-type: none;
					position: relative;
					padding: 20px 5px 0 5px;
					
					transition: all 0.5s;
					-webkit-transition: all 0.5s;
					-moz-transition: all 0.5s;
				}
				
				/*We will use ::before and ::after to draw the connectors*/
				
				.tree li::before, .tree li::after{
					content: '';
					position: absolute; top: 0; right: 50%;
					border-top: 1px solid #ccc;
					width: 50%; height: 20px;
				}
				.tree li::after{
					right: auto; left: 50%;
					border-left: 1px solid #ccc;
				}
				
				/*We need to remove left-right connectors from elements without 
				any siblings*/
				.tree li:only-child::after, .tree li:only-child::before {
					display: none;
				}
				
				/*Remove space from the top of single children*/
				.tree li:only-child{ padding-top: 0;}
				
				/*Remove left connector from first child and 
				right connector from last child*/
				.tree li:first-child::before, .tree li:last-child::after{
					border: 0 none;
				}
				/*Adding back the vertical connector to the last nodes*/
				.tree li:last-child::before{
					border-right: 1px solid #ccc;
					border-radius: 0 5px 0 0;
					-webkit-border-radius: 0 5px 0 0;
					-moz-border-radius: 0 5px 0 0;
				}
				.tree li:first-child::after{
					border-radius: 5px 0 0 0;
					-webkit-border-radius: 5px 0 0 0;
					-moz-border-radius: 5px 0 0 0;
				}
				
				/*Time to add downward connectors from parents*/
				.tree ul ul::before{
					content: '';
					position: absolute; top: 0; left: 50%;
					border-left: 1px solid #ccc;
					width: 0; height: 20px;
				}
				
				.tree li a{
					border: 1px solid #ccc;
					padding: 5px 10px;
					text-decoration: none;
					color: #666;
					font-family: arial, verdana, tahoma;
					font-size: 11px;
					display: inline-block;
					
					border-radius: 5px;
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					
					transition: all 0.5s;
					-webkit-transition: all 0.5s;
					-moz-transition: all 0.5s;
				}
				
				/*Time for some hover effects*/
				/*We will apply the hover effect the the lineage of the element also*/
				.tree li a:hover, .tree li a:hover+ul li a {
					background: #c8e4f8; color: #000; border: 1px solid #94a0b4;
				}
				/*Connector styles on hover*/
				.tree li a:hover+ul li::after, 
				.tree li a:hover+ul li::before, 
				.tree li a:hover+ul::before, 
				.tree li a:hover+ul ul::before{
					border-color:  #94a0b4;
				}
				
				/*Thats all. I hope you enjoyed it.
				Thanks :)*/

 </style>
 
   		
   	</head>
<body ng-cloak class="ng-cloak">
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />   

 <section id="main-content">
          <section class="wrapper">
          <div class="row">
          	<h1> This is Existing Institute Structure page </h1>
          	<div class="tree">
          	 ${structure}
          	</div>
          </div>
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>