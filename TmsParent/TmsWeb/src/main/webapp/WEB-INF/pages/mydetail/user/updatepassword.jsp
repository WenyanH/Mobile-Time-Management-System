<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<script>
	
	var updatepassword ={

			save : function(){
				if ($("#alertMessage").html()!="")
	        		$("#alertMessage").html("")		
				
				parent.Loading.start();
				
				PageCtrl.ajax({
					url : webPath + "/user/updatepassword",
					data : {
						password : $("#password").val(),
						oldPassword : $("#oldPassword").val()
					},
					dataType: "json",
					type : "post",
					success : function(data) {
						
						parent.Loading.stop();
						
						if (data.message=="success"){
							parent.$(".xubox_close").click();
							parent.argusAlert("You have successfully changed your password. Please relogin the system.",function(){
								location.href = "<webpath:path/>/logout";
							});
						}else{
							argusAlertStrip("alertMessage","warning"," Warning: The old password is not correct");
						}
						
					}					
				})	
						
				return false;
			},

	         initSavePage : function(){

				$('#passwordForm').validate({
					doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
					errorElement : 'span', //default input error message container
					errorClass : 'validate-inline', // default input error message class
					focusInvalid : false, // do not focus the last invalid input
					rules : {
						"oldPassword" : {
							required : true
						},
						"password" : {
							required : true			
							
						},
						"confirmPassword" : {
							equalTo: "#password"
						}
					},

			        errorPlacement: function (error, element) { // render error placement for each input type
			            error.insertAfter(element); // for other inputs, just perform default behavoir
			            
			        },

			        invalidHandler: function (event, validator) { //display error alert on form submit   
			        	Loading.stop();
			        	
			        },

			        highlight: function (element) { // hightlight error inputs
			            $(element).closest('.help-inline').removeClass('ok'); // display OK icon
			            $(element).closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
			        },

			        unhighlight: function (element) { // revert the change dony by hightlight
			            $(element).closest('.control-group').removeClass('error'); // set error class to the control group
			        },

			        success: function (label) {
			            label.addClass('valid').closest('.control-group').removeClass('error'); // set success class to the control group
			            label.remove();
			            
			        },
			        
			        submitHandler: function(form){  
			        	updatepassword.save();
			        },
			        
			        onfocusin: function( element, event ) {
			        	if ($("#alertMessage").html()!="")
			        		$("#alertMessage").html("")
			        }

				});
			
			}			

	};
	$(document).ready(function(){
		updatepassword.initSavePage();
	});
	
	</script>
</head>

<div class='row-fluid' style="width: 505px;padding: 10px">	
<form id="passwordForm" action='#' onsubmit="return false;"
	class="form form-horizontal form-horizontal2" style="margin-bottom: 0;"
	method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id"
		value="${user.id}" />
	<div class='row-fluid' style="height: 170px">
		<div id="alertMessage"></div>
		<div class='span12' style="margin:0px;">
		
		<div class="control-group">
				<label class="control-label"> <span><fmt:message
							key="saveuser.info.oldpassword" /></span>
				</label>
				<div class="controls">
					<input class="span12" name="oldPassword" type="password" id="oldPassword"
						value="" maxlength="64" />

				</div>
			</div>
		
		<div class="control-group">
				<label class="control-label"> <span><fmt:message
							key="saveuser.info.newpassword" /></span>
				</label>
				<div class="controls">
					<input class="span12" name="password" type="password" id="password"
						value="" maxlength="64" />

				</div>
			</div>
			
		<div class="control-group">		
		
				<label class="control-label"> <span><fmt:message
							key="saveuser.info.confirmpassword" /></span>
				</label>
				<div class="controls">
					<input class="span12" name="confirmPassword" type="password" id="confirmPassword" value="" maxlength="64" />

				</div>
			</div>
		
		
		</div>
	</div>	
						
		<div class="row-fluid" id="savebutton">
		<button class="btn btn-warning pull-right" type="submit">
			<i class="icon-save"></i> <fmt:message key="global.info.save" /><!--Save-->
		</button>
	</div>	
	
	
	</form>
	
	