$(document).ready(function(){	
	
});
var profile={
		save : function(form){			
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
			parent.Loading.start();
			 
			$(form).attr('action', webPath + "/user/saveProfile");
			formTool.submitForm($(form),function(data){
				parent.Loading.stop();
				if (data.message=="success"){					
					argusAlertStrip("alertMessage","success"," Success");
				}else if(data.message == "photoBigError") {
					argusAlertStrip("alertMessage","warning"," Warning: The photo is too large");
				}else{
					argusAlertStrip("alertMessage","error"," Error");
				}
			});
			return false;
		},
			
			initSavePage : function(){

				$('#profileForm').validate({
					doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
					errorElement : 'span', //default input error message container
					errorClass : 'validate-inline', // default input error message class
					focusInvalid : false, // do not focus the last invalid input
					rules : {
						"firstName" : {
							required : true							
						},
						"lastName" : {
							required : true													
						}
					},
					
					errorPlacement: function (error, element) { // render error placement for each input type
			        error.insertAfter(element); // for other inputs, just perform default behavior
			            
			        },

			        invalidHandler: function (event, validator) { //display error alert on form submit   
			        	parent.Loading.stop();
			        	
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
			        	profile.save(form,false);
			        },
			        
			        onfocusin: function( element, event ) {
			        	if ($("#alertMessage").html()!="")
			        		$("#alertMessage").html("")
			        }
			        			 

				});
				fileinput();
	}
}
							