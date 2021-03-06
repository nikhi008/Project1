<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<title>Modify Institute Structure </title>

   	    <script>
   	 $(document).ready(function(){

   	
   		$('#disabledInputForClasses').attr('disabled','disabled'); 

   		$('#disabledSelectForClassesInAddDividion').attr('disabled','disabled'); 

   		$('#AddNewClassSaveBTN').attr('disabled','disabled'); 

   	   $('#saveDivisionSubmitBTN').attr('disabled','disabled'); 

   	 $('#disabledInputForDivisionName').attr('disabled','disabled');
   	 
   	$('#disabledSelectForClassesForDelete').attr('disabled','disabled');
   
   		
   	//----------------select branch in Add Division-------------- 
	   	$('#SelectBranch2').change(function() {
	   	   

	   	 var  others = $(this).find(":selected").val();
	        if(others != 0){      

	        	 $.getJSON("GetClassesList/"+$(this).find(":selected").val(), function(jsonData){
	        	     cb = '';
	        	     $.each(jsonData, function(i,data){
	        	         cb+='<option value="'+data.value+'">'+data.name+'</option>';
	        	     });
	        	     $("#disabledSelectForClassesInAddDividion").html(cb);
	        	});	
		         
	        	 $('#saveDivisionSubmitBTN').attr('disabled','disabled');
	   		     $('#disabledSelectForClassesInAddDividion').removeAttr('disabled'); 
	   		     	                      
	         }else{
	         $('#disabledSelectForClassesInAddDividion').html('<option value="0">--- Select class ---</option>');
	         $('#disabledSelectForClassesInAddDividion').attr('disabled','disabled'); 
	         $('#disabledInputForDivisionName').attr('disabled','disabled'); 
	         $('#saveDivisionSubmitBTN').attr('disabled','disabled'); 
	     
	        }  
	   	});


	  //----------------select branch In delete class from branch-------------- 
	   	$('#SelectBranchForDeleteClass').change(function() {
	   	   

	   	 var  others = $(this).find(":selected").val();
	        if(others != 0){      

	        	 $.getJSON("GetClassesList/"+$(this).find(":selected").val(), function(jsonData){
	        	     cb = '';
	        	     $.each(jsonData, function(i,data){
	        	         cb+='<option value="'+data.value+'">'+data.name+'</option>';
	        	     });
	        	     $("#disabledSelectForClassesForDelete").html(cb);
	        	});	
		        		            
	   		     $('#disabledSelectForClassesForDelete').removeAttr('disabled'); 
	   		     	                      
	         }else{
	         $('#disabledSelectForClassesForDelete').attr('disabled','disabled'); 
	         /* $('#disabledInputForDivisionName').attr('disabled','disabled'); 
	         $('#saveDivisionSubmitBTN').attr('disabled','disabled');  */
	     
	        }  
	   	});

	  //----------------select Class in Add Division-------------- 

	   	$('#disabledSelectForClassesInAddDividion').on('change',function(){
	   	 var  others = $(this).find(":selected").val();

	   	if(others != 0){           
   	        $('#saveDivisionSubmitBTN').removeAttr('disabled'); 
   	   
   	     $('#disabledInputForDivisionName').removeAttr('disabled');   
   	               
   	         }else{
   	         $('#saveDivisionSubmitBTN').attr('disabled','disabled'); 
   	   
   	      $('#disabledInputForDivisionName').attr('disabled','disabled'); 
   	        }  
	   	 
	    });


	  //----------------select branch in Add Class-------------- 
   		       
   	    $('#SelectBranch').on('change',function(){
  	   	    
   	     var  others = $(this).find(":selected").val();
   	        if(others != 0){           
   	        $('#disabledInputForClasses').removeAttr('disabled'); 
   	     $('#AddNewClassSaveBTN').removeAttr('disabled');   
   	               
   	         }else{
   	         $('#disabledInputForClasses').attr('disabled','disabled'); 
   	      $('#AddNewClassSaveBTN').attr('disabled','disabled'); 
   	        }  
 
   	      });
	  
   	
	  //-----------------select branch to delete-------------------

   	 $('#submitBTNdeleteBranch').attr('disabled','disabled');
	
     $('#submitBTNrenameBranch').attr('disabled','disabled'); 
     
   	 $('#delete_branchform').on('change',function(){
	   	    
   	     var  others = $(this).find(":selected").val();
   	        if(others != 0)
   	        {           
   	         $('#submitBTNdeleteBranch').removeAttr('disabled'); 
   	        
   	         $('#submitBTNrenameBranch').removeAttr('disabled');
            }
   	        else
   	        {
   	         $('#submitBTNdeleteBranch').attr('disabled','disabled'); 
   	     
   	         $('#submitBTNrenameBranch').attr('disabled','disabled');
   	        }  
          });
	  
   	  $('#submitBTNrenameBranch').on('click',function(){
   		var selectedBranch = $("#selectBranchForDelete option:selected" ).text();
   		var selectedBranchId = $("#selectBranchForDelete option:selected" ).val();
   		 $("#renameBranchName").val(selectedBranch);
   		 $("#renameBranchId").val(selectedBranchId);
   		 
   	   $("#renameBranchName").on('change',function(){
   	     var renameBranchNameModal=$("#renameBranchName").text();
   	    	if(renameBranchNameModal == null)
   	    		{
   	    		 $('#submitBTNrenameBranchModal').attr('disabled','disabled');
   	    		}
   	    	  else
   	    	   {
   	    	    $('#submitBTNrenameBranchModal').removeAttr('disabled');
   	    	   }
   	    	
   	    });
 
   	     }); 
   	  
   	  
   	 //-----------------select class to delete-------------------

    	 $('#DeleteClassSubmitBTN').attr('disabled','disabled');
 	
      $('#submitBTNrenameClass').attr('disabled','disabled'); 
      
    	 $('#delete_classform').on('change',function(){
 	   	    
    	     var  selectedBranch = $(this).find(":selected").val();
    	     var  selectedClass =$("#disabledSelectForClassesForDelete option:selected").val();
    	        if(selectedBranch != 0 && selectedClass != 0)
    	        {           
    	         $('#DeleteClassSubmitBTN').removeAttr('disabled'); 
    	        
    	         $('#submitBTNrenameClass').removeAttr('disabled');
             }
    	        else
    	        {
    	         $('#DeleteClassSubmitBTN').attr('disabled','disabled'); 
    	     
    	         $('#submitBTNrenameClass').attr('disabled','disabled');
    	        }  
           });
 	  
    	 //-----------------rename class button click and selected value automatically shown in specific tag------------------
    	  $('#submitBTNrenameClass').on('click',function(){
    		var selectedBranch = $("#SelectBranchForDeleteClass option:selected" ).text();
    		var selectedClass= $("#disabledSelectForClassesForDelete option:selected").text();
    	    var selectedClassId = $("#disabledSelectForClassesForDelete option:selected").val();
    	    var selectedBranchId= $("#SelectBranchForDeleteClass option:selected" ).val();
    		 $("#selectedBranchForDeleteClass").val(selectedBranch);
    		 $("#renameClassName").val(selectedClass);
    	     $("#renameClassId").val(selectedClassId); 
    	    $("#selectedBranchIdrenameClass").val(selectedBranchId);
    		 
    	     }); 
    	  
    	  
    	//-----------------select division to delete-------------------
    	
    	
    	$('#disabledSelectForClassesForDeleteDivision').attr('disabled','disabled');
    	$('#disabledSelectForDivisionForDelete').attr('disabled','disabled');
    	$('#submitBTNrenameDivision').attr('disabled','disabled');
    	$('#deleteDivisionSubmitBTN').attr('disabled','disabled');
    	
    	//-------------------------------select Branch to delete division--------------------------
    	$('#SelectBranchForDeleteDivision').change(function() {
    		   	 var  others = $(this).find(":selected").val();
    		        if(others != 0)
    		        {   
    		         $("#disabledSelectForDivisionForDelete").html('<option value="0">--- Select Division ---</option>');
    	    		 $('#disabledSelectForDivisionForDelete').attr('disabled','disabled'); 
    	    		 $('#deleteDivisionSubmitBTN').attr('disabled','disabled'); 
    	    		 $('#submitBTNrenameDivision').attr('disabled','disabled');
    	    		 
    		         $.getJSON("GetClassesList/"+$(this).find(":selected").val(), function(jsonData)
    		          {
    		            cb = '';
    		            $.each(jsonData, function(i,data){
    		        	cb+='<option value="'+data.value+'">'+data.name+'</option>';
    		        	});
    		        	  $("#disabledSelectForClassesForDeleteDivision").html(cb);
    		        	});	
    			        		            
    		   		    $('#disabledSelectForClassesForDeleteDivision').removeAttr('disabled'); 
    		   		   //  $('#deleteDivisionSubmitBTN').removeAttr('disabled');
    		   		   	                      
    		         }
    		         else
    		         {
    		          $('#disabledSelectForClassesForDeleteDivision').html('<option value="0">--- Select Class ---</option>');
    		          $('#disabledSelectForClassesForDeleteDivision').attr('disabled','disabled'); 
    		          $("#disabledSelectForDivisionForDelete").html('<option value="0">--- Select Division ---</option>');
    		     	  $('#disabledSelectForDivisionForDelete').attr('disabled','disabled'); 
    		          $('#deleteDivisionSubmitBTN').attr('disabled','disabled');
    		          $('#submitBTNrenameDivision').attr('disabled','disabled');
    		          //$('#saveDivisionSubmitBTN').attr('disabled','disabled'); 
    		         }  
    	    }); 
    		        
    	//-------------------------------select class to delete division-----------------------------
    		        $("#disabledSelectForClassesForDeleteDivision").change(function(){
                        var selectedClass=$("#disabledSelectForClassesForDeleteDivision option:selected").val();
    		   		    var selectedbranch=$("#SelectBranchForDeleteDivision option:selected").val();
    		   		     if(selectedClass != 0 ){
    		   		    	 if(selectedbranch != 0){
    		   		    	 $.getJSON("GetDivisionList/"+$("#disabledSelectForClassesForDeleteDivision option:selected").val(), function(jsonData){
        		        	     cb = '';
        		        	     $.each(jsonData, function(i,data){
        		        	         cb+='<option value="'+data.value+'">'+data.name+'</option>';
        		        	     });
        		        	     $("#disabledSelectForDivisionForDelete").html(cb);
        		        	});
    		   		    	 
    		   		    	$('#disabledSelectForDivisionForDelete').removeAttr('disabled');
    		   		    	 }
    		   		    } 
    		   		     else{
    		   		    	$("#disabledSelectForDivisionForDelete").html('<option value="0">--- Select Division ---</option>');
    		   		    	$('#disabledSelectForDivisionForDelete').attr('disabled','disabled'); 
    		   		        $('#deleteDivisionSubmitBTN').attr('disabled','disabled');
    		   		        $('#submitBTNrenameDivision').attr('disabled','disabled');
    		   		     }
    		   });
    	
    	//-----------------------------select division to delete------------------------
    	       $("#disabledSelectForDivisionForDelete").change(function(){
   		    	var selectedDivision=$("#disabledSelectForDivisionForDelete option:selected").val();
   		    	var selectedClass=$("#disabledSelectForClassesForDeleteDivision option:selected").val();
   		    	var others=$("#SelectBranchForDeleteDivision").val();
   		    	if(selectedDivision != 0 )
   		    		{
   		    		 if(selectedClass != 0 )
   		    		 {
   		    			 if(others != 0)
   		    			 {
   		    		      $('#deleteDivisionSubmitBTN').removeAttr('disabled');
   		    		      $('#submitBTNrenameDivision').removeAttr('disabled');
   		    		     }
   		    		 }
   		    		}
   		    	    else
   		    	    {
   		    	     $('#deleteDivisionSubmitBTN').attr('disabled','disabled'); 
   		    	     $('#submitBTNrenameDivision').attr('disabled','disabled');
   		    	    }
   		    	});
    	
    	       //-----------------rename division button click and selected value automatically shown in specific tag------------------
    	    	  $('#submitBTNrenameDivision').on('click',function(){
    	    		var selectedBranch = $("#SelectBranchForDeleteDivision option:selected" ).text();
    	    		var selectedClass= $("#disabledSelectForClassesForDeleteDivision option:selected").text();
    	    	    var selectedDivision = $("#disabledSelectForDivisionForDelete option:selected").text();
    	    	    var selectedBranchId= $("#SelectBranchForDeleteDivision option:selected").val();
    	    	    var selectedClassId= $("#disabledSelectForClassesForDeleteDivision option:selected").val();
    	    	    var selectedDivisionId= $("#disabledSelectForDivisionForDelete option:selected").val();
    	    	    
    	    	    $("#selectedBranchIdrenameDivision").val(selectedBranchId);
    	    	    $("#selectedClassIdToRenameDivision").val(selectedClassId);
    	    	    $("#selectedDivisionIdToRename").val(selectedDivisionId);
    	    	    
    	    	    $("#selectedBranchForRenameDivision").val(selectedBranch);
    	    	    $("#selectedClassForRenameDivision").val(selectedClass);
    	    	    $("#selectedDivisionForRename").val(selectedDivision);
    	    	 
    	    		 }); 
    	   });

   </script>	

   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		
<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
</head>
<body ng-cloak class="ng-cloak">
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

 <aside>
  <section id="main-content">
          <section class="wrapper">  
	
		<c:if test="${!empty SuccessMessage}">
  					  <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>${SuccessMessage}</strong> 
                              </div>
		</c:if>	
		
		<c:if test="${!empty ErrorMessage}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>${ErrorMessage}</strong> 
                              </div>
		</c:if>	
		
		

 <!--collapse start-->
<!-- -----------------------------    Add Branch to Institute  ---------------------------------->  
                      <div><h2>Add</h2></div>
                      <div class="panel-group m-bot20" id="accordion">
                          <div class="panel panel-primary">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                          Add Branch to Institute 
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseOne" class="panel-collapse collapse in">
                                  <div class="panel-body">
			                                  
			                                     <div class="form">
			                                      <form:form class="form-validate form-horizontal " id="register_form" method="post" action="AddNewBranch" modelAttribute="Branch">
			                                  
					                                      <div class="form-group ">
					                                          <label for="cname" class="control-label col-lg-2">New Branch Name <span class="required">*</span></label>
					                                          <div class="col-lg-10">
					                                              <form:input path="name" class="form-control" id="Branch" name="branch" maxlength="50" type="text" required="required" />
					                                          </div>
					                                      </div>
					                                     
					                                      <div class="form-group">
					                                          <div class="col-lg-offset-2 col-lg-10">
					                                              <button class="btn btn-primary" type="submit">Add Branch</button>
					                                          </div>
					                                      </div>
			                                       </form:form>
			                                  
			                              </div>
			                                
                                  </div>
                              </div>
                          </div>
 <!-- -----------------------------   Add Class into Branch ---------------------------------->                          
                          <div class="panel panel-success">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                        Add Class into Branch
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseTwo" class="panel-collapse collapse">
				                  <div class="panel-body">
				
										<form:form modelAttribute="Classes" class="form-validate form-horizontal " id="SelectBranch" action="AddNewClass" method="POST">
											<div class="form-group ">
											
												<label for="fullname" class="control-label col-lg-2">Select The Branch 
												 <span class="required">*</span>
												</label>
												<div class="col-lg-10">
													<form:select path="branch.id" class="form-control input-lg m-bot15" onchange="" form="SelectBranch" id="SelectBranch">
														<option value="0">--- Select Branch---</option>
														<c:forEach items="${BranchesOfInst}" var="branch">
															<option value="${branch.id}">${branch.name}</option>
														</c:forEach>
													</form:select>
												</div>
												
													 <label for="fullname" class="control-label col-lg-2">Add new Class <span class="required">*</span></label>
													<div class="col-lg-10">
														<form:input path="name" class="form-control" id="disabledInputForClasses" type="text" placeholder="Add new class" required="required" />
													</div>								
											</div>
											<div class="form-group">
			                                          <div class="col-lg-offset-2 col-lg-10">
			                                              <button class="btn btn-primary" id="AddNewClassSaveBTN"type="submit">Add Class</button>
			                     					 </div>
			                                </div>
										</form:form>
					
								</div>
                          </div>
                          </div>
                          
                          
                          
 <!-- -----------------------------   Add Division into Class ---------------------------------->
 
                          <div class="panel panel-warning">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                           Add Division into Class
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseThree" class="panel-collapse collapse">
                                  <div class="panel-body">
                                     
										<form:form modelAttribute="Division" class="form-validate form-horizontal " id="AddNewDivision" action="AddNewDivision" method="POST">
											<div class="form-group ">
											
												<label for="fullname" class="control-label col-lg-2">Select The Branch 
												 <span class="required">*</span>
												</label>
												<div class="col-lg-10">
													<form:select path="classes.branch.id" class="form-control input-lg m-bot15 "  form="AddNewDivision" id="SelectBranch2">
														<option value="0">--- Select Branch---</option>
														<c:forEach items="${BranchesOfInst}" var="branch">
															<option value="${branch.id}">${branch.name}</option>
														</c:forEach>
													</form:select>
												</div>
												
													 <label for="fullname" class="control-label col-lg-2">Select the Class <span class="required">*</span></label>
													<div class="col-lg-10">
														<form:select path="classes.id" class="form-control m-bot15" id="disabledSelectForClassesInAddDividion" type="text" placeholder="Add new class" required="required" >
															<option value="0">--- Select Class---</option>
														</form:select>
													</div>		
													
													 <label for="fullname" class="control-label col-lg-2">Add new Division <span class="required">*</span></label>
													<div class="col-lg-10">
														<form:input path="name" class="form-control" id="disabledInputForDivisionName" type="text" placeholder="Add new division" required="required" />
													</div>
																			
											</div>
											<div class="form-group">
			                                          <div class="col-lg-offset-2 col-lg-10">
			                                              <button class="btn btn-primary" id="saveDivisionSubmitBTN" type="submit">Add Division</button>
			                     					 </div>
			                                </div>
										</form:form>
                                  </div>
                              </div>
                          </div>
                     
                      
          <!-- -----------------------------   Delete Branch from Institute  ---------------------------------->  
                      <div><h2>Delete/Rename</h2></div>
                     
                          <div class="panel panel-primary">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                          Delete/Rename Branch from Institute 
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseFour" class="panel-collapse collapse">
                                  <div class="panel-body">
			                               <div class="form">
			                                      <form:form class="form-validate form-horizontal " id="delete_branchform" method="post" action="DeleteBranch" modelAttribute="Classes">
			                                  
					                                      <div class="form-group ">
					                                         <label for="fullname" class="control-label col-lg-2">Select The Branch 
											                	 <span class="required">*</span>
															</label>
															<div class="col-lg-10">
																<form:select path="branch.id" class="form-control input-lg m-bot15" onchange="" form="delete_branchform" id="selectBranchForDelete">
																	<option value="0">--- Select Branch---</option>
																	<c:forEach items="${BranchesOfInst}" var="branch">
																		<option value="${branch.id}" id="optionBranch">${branch.name}</option>
																	</c:forEach>
																</form:select>
															</div>
													     </div>
					                                     
					                                      <div class="form-group">
					                                           <div class="col-lg-offset-2 col-lg-10">
			                                                    <a class="btn btn-primary" data-toggle="modal" id="submitBTNrenameBranch" href="#renameBranchModal">Rename</a>
					                                            <button class="btn btn-danger" type="submit" id="submitBTNdeleteBranch">Delete Branch</button>
					                                            </div>
					                                       </div> 
					                                                
			                                       </form:form>
			                                   </div>
			                               </div>
                              </div>
													           
													            <div class="modal fade" id="renameBranchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										                              <div class="modal-dialog">
										                                  <div class="modal-content">
										                                        <div class="modal-header">
										                                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										                                           <h4 class="modal-title">Rename Branch Name</h4>
										                                        </div>
										                                        
										                                    
										                                     <div class="modal-body">
										                                         <div class="row">
																                    <div class="col-lg-12">
																                      <section class="panel">
																                          <header class="panel-heading">
																                          Make Changes To Institute
																                          </header>
																                          <div class="panel-body">
																                              <div class="form">
																                                 <form:form class="form-validate form-horizontal " id="modal_rename_branchform" method="post" action="modalRenameBranch" modelAttribute="Classes">
																                                      <div class="form-group ">
																                                      	
																                                      	 <br></br>
																                                          <label for="fullname" class="control-label col-lg-2">Branch Id</label>
																                                           <div class="col-lg-10">
																                                              <form:input path="branch.id" class=" form-control" id="renameBranchId" name="fullname" type="text" autocomplete="off" required="required" maxlength="50" readonly="true"  />
																                                          </div>
																                                      	<br></br>
																                                          <label for="fullname" class="control-label col-lg-2">Branch Name <span class="required">*</span></label>
																                                           <div class="col-lg-10">
																                                              <form:input path="branch.name" class=" form-control" id="renameBranchName" name="fullname" type="text" autocomplete="off" required="required" maxlength="50"/>
																                                          </div>
																                                     </div>
																                                    
																                                      <div class="form-group">
																                                          <div class="col-lg-offset-2 col-lg-10">
																                                              <button class="btn btn-primary" type="submit" id="submitBTNrenameBranchModal">Rename</button>
																                                                                                      </div>
																                                      </div>
																                                  </form:form>
																                              </div>
																                          </div>
																                      </section>
																                  </div>
										                                       </div>
																			 </div>
										                                     <div class="modal-footer">
										                                         <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
										                                         
					                                                        </div>
										                                 </div>
										                             </div>
										                     </div>
					                                 </div>
			                                                   
 <!-- -----------------------------------------------   Delete/Rename Class from Branch ---------------------------------->                          
                       <div class="panel panel-success">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                        Delete/Rename Class from Branch
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseFive" class="panel-collapse collapse">
				                  <div class="panel-body">
				                       <div class="form">
				                         <form:form modelAttribute="Division" class="form-validate form-horizontal " id="delete_classform" action="DeleteClassFromBranch" method="POST">
											
											<div class="form-group ">
											     <label for="fullname" class="control-label col-lg-2">Select The Branch 
												  <span class="required">*</span>
												 </label>
												<div class="col-lg-10">
													<form:select path="classes.branch.id" class="form-control input-lg m-bot15" onchange="" form="SelectBranch" id="SelectBranchForDeleteClass">
														<option value="0">--- Select Branch---</option>
														<c:forEach items="${BranchesOfInst}" var="branch">
															<option value="${branch.id}">${branch.name}</option>
														</c:forEach>
													</form:select>
												</div>
												
													 <label for="fullname" class="control-label col-lg-2">Select the Class <span class="required">*</span></label>
													<div class="col-lg-10">
														<form:select path="classes.id" class="form-control m-bot15" id="disabledSelectForClassesForDelete" type="text" placeholder="Select class for delete" required="required" >
															<option value="0">--- Select Class---</option>
														</form:select>
													</div>										
											</div>
											
											<div class="form-group">
			                                          <div class="col-lg-offset-2 col-lg-10">
			                                              <a class="btn btn-primary" data-toggle="modal" id="submitBTNrenameClass" href="#renameClassModal">Rename</a>
			                                              <button class="btn btn-danger" id="DeleteClassSubmitBTN"type="submit">Delete Class</button>
			                     					 </div>
			                                </div>
										</form:form>
				                        </div>
								</div>
                          </div>
                          
                           <div class="modal fade" id="renameClassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										                              <div class="modal-dialog">
										                                  <div class="modal-content">
										                                        <div class="modal-header">
										                                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										                                           <h4 class="modal-title">Rename Class Name</h4>
										                                        </div>
										                                        
										                                  <div class="modal-body">
										                                         <div class="row">
																                    <div class="col-lg-12">
																                      <section class="panel">
																                          <header class="panel-heading">
																                          Make Changes To Institute
																                          </header>
																                          
																							 <div class="panel-body">
																								  <div class="form">
																									     <form:form class="form-validate form-horizontal " id="modal_rename_classform" method="post" action="modalRenameClass" modelAttribute="Division">
																									              <div class="form-group ">
																									              <div class="col-lg-10" style="display:none">
																			                                              <form:input path="classes.branch.id" class=" form-control" id="selectedBranchIdrenameClass" name="fullname" type="text" autocomplete="off" required="required" maxlength="50" readonly="true"  />
																			                                      </div>
																			                                       <div class="col-lg-10" style="display:none">
																			                                              <form:input path="classes.id" class=" form-control" id="renameClassId" name="fullname" type="text" autocomplete="off" required="required" maxlength="50" readonly="true"  />
																			                                          </div>
																			                         
																			                                          <label for="fullname" class="control-label col-lg-2">Branch Name<span class="required">*</span></label>
																			                                           <br>
																			                                           <div class="col-lg-10">
																			                                              <form:input path="classes.branch.name" class=" form-control" id="selectedBranchForDeleteClass" name="fullname" type="text" autocomplete="off" required="required" maxlength="50" readonly="true"/>
																			                                          </div>
																			                                          <br></br>
																			                                          <label for="fullname" class="control-label col-lg-2">Class Name<span class="required">*</span></label>
																			                                           <br>
																			                                           <div class="col-lg-10">
																			                                              <form:input path="classes.name" class=" form-control" id="renameClassName" name="address" type="text" autocomplete="off" required="required" maxlength="50"/>
																			                                          </div>
																			                                      </div>
																			                                    
																			                                      <div class="form-group">
																			                                       <div class="col-lg-offset-2 col-lg-10">
																									                       <button class="btn btn-primary" type="submit" id="submitBTNrenameClassModal">Rename</button>
																									               </div>
																									              </div>
																									     </form:form>
																							       </div>
																				            </div>
																                      </section>
																                  </div>
										                                       </div>
																			 </div>
										                                     <div class="modal-footer">
										                                         <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
										                                    </div>
										                               </div>
										                          </div>
										                   </div>
                                                    </div>
                       
                          
 <!-- -----------------------------   Delete/Rename Division from Class ---------------------------------->
 
                          <div class="panel panel-warning">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                                          Delete/Rename Division from Class
                                      </a>
                                  </h4>
                              </div>
                              
                              <div id="collapseSix" class="panel-collapse collapse">
                                  <div class="panel-body">
                                     
										<form class="form-validate form-horizontal " id="DeleteDivision" action="DeleteDivisionFromClass" method="POST">
											<div class="form-group ">
											
												<label for="fullname" class="control-label col-lg-2">Select The Branch 
												 <span class="required">*</span>
												</label>
												<div class="col-lg-10">
													<select class="form-control input-lg m-bot15 "  form="DeleteDivision" id="SelectBranchForDeleteDivision">
														<option value="0">--- Select Branch---</option>
														<c:forEach items="${BranchesOfInst}" var="branch">
															<option value="${branch.id}">${branch.name}</option>
														</c:forEach>
													</select>
												</div>
												
													 <label for="fullname" class="control-label col-lg-2">Select Class <span class="required">*</span></label>
													<div class="col-lg-10">
														<select class="form-control m-bot15" id="disabledSelectForClassesForDeleteDivision" name="disabledSelectForClassesForDeleteDivision" type="text" placeholder="Select Class" required="required" >
															<option value="0">--- Select Class---</option>
														</select>
													</div>		
													
													 <label for="fullname" class="control-label col-lg-2">Select Division <span class="required">*</span></label>
													<div class="col-lg-10">
														<select class="form-control m-bot15" id="disabledSelectForDivisionForDelete" name="disabledSelectForDivisionForDelete" type="text" placeholder="Select Division" required="required" >
															<option value="0">--- Select Division---</option>
														</select>
													</div>	
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																			
											</div>
											<div class="form-group">
			                                          <div class="col-lg-offset-2 col-lg-10">
			                                          <a class="btn btn-primary" data-toggle="modal" id="submitBTNrenameDivision" href="#renameDivisionModal">Rename</a>
			                                              <button class="btn btn-danger" id="deleteDivisionSubmitBTN" type="submit">Delete</button>
			                     					 </div>
			                                </div>
										</form>
                                  </div>
                              </div>
                              
                               <div class="modal fade" id="renameDivisionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										                              <div class="modal-dialog">
										                                  <div class="modal-content">
										                                        <div class="modal-header">
										                                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										                                           <h4 class="modal-title">Rename Division Name</h4>
										                                        </div>
										                                        
										                                  <div class="modal-body">
										                                         <div class="row">
																                    <div class="col-lg-12">
																                      <section class="panel">
																                          <header class="panel-heading">
																                          Make Changes To Institute
																                          </header>
																                          
																							 <div class="panel-body">
																								  <div class="form">
																									     <form class="form-validate form-horizontal " id="modal_rename_divisionform" method="post" action="modalRenameDivision">
																									              <div class="form-group ">
																									              <div class="col-lg-10" style="display:none">
																			                                              <input class=" form-control" id="selectedBranchIdrenameDivision" name="selectedBranchIdrenameDivision" type="text" autocomplete="off" required="required" maxlength="50" readonly="true"  />
																			                                      </div>
																			                                       <div class="col-lg-10" style="display:none">
																			                                              <input class=" form-control" id="selectedClassIdToRenameDivision" name="selectedClassIdToRenameDivision" type="text" autocomplete="off" required="required" maxlength="50" readonly="true"  />
																			                                          </div>
																			                                          
																			                                          <div class="col-lg-10" style="display:none">
																			                                              <input class=" form-control" id="selectedDivisionIdToRename" name="selectedDivisionIdToRename" type="text" autocomplete="off" required="required" maxlength="50" readonly="true"  />
																			                                          </div>
																			                         
																			                                          <label for="fullname" class="control-label col-lg-2">Branch Name<span class="required">*</span></label>
																			                                           <br>
																			                                           <div class="col-lg-10">
																			                                              <input class=" form-control" id="selectedBranchForRenameDivision" name="selectedBranchForRenameDivision" type="text" autocomplete="off" required="required" maxlength="50" readonly="true"/>
																			                                          </div>
																			                                          <br></br>
																			                                          <label for="fullname" class="control-label col-lg-2">Class Name<span class="required">*</span></label>
																			                                           <br>
																			                                           <div class="col-lg-10">
																			                                              <input class=" form-control" id="selectedClassForRenameDivision" name="selectedClassForRenameDivision" type="text" autocomplete="off" required="required" maxlength="50" readonly="true"/>
																			                                          </div>
																			                                           <br></br>
																			                                          <label for="fullname" class="control-label col-lg-2">Division Name<span class="required">*</span></label>
																			                                           <br>
																			                                           <div class="col-lg-10">
																			                                              <input class=" form-control" id="selectedDivisionForRename" name="selectedDivisionForRename" type="text" autocomplete="off" required="required" maxlength="50"/>
																			                                          </div>
																			                                          
																			                                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																			                                      </div>
																			                                    
																			                                      <div class="form-group">
																			                                       <div class="col-lg-offset-2 col-lg-10">
																									                       <button class="btn btn-primary" type="submit" id="submitBTNrenameDivisionModal">Rename</button>
																									               </div>
																									              </div>
																									     </form>
																							       </div>
																				            </div>
																                      </section>
																                  </div>
										                                       </div>
																			 </div>
										                                     <div class="modal-footer">
										                                         <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
										                                    </div>
										                               </div>
										                          </div>
										                   </div>
                                    </div>
                      </div>
                      <!--collapse end-->
               
       </section>   
   </section> 
    </aside>  
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->                    

</body>
</html>