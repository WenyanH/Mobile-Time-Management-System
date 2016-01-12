$(document).ready(function(){
	staff.sort();
});
var staff = {
		sort: function(){
			$("#user-table-sort").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{ 
			    	orderable:false,//禁用排序 
			    	targets:[1]   //指定的列 
		    	}],
				bStateSave : true
		    });
		},
		create : function() {
			$.layer({
                type: 1,
                title : "Create staff",
                shadeClose: true,
                area : [ '525px', '336px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/staff/create?pjax=true'
                },
                zIndex:2500
            });
			
			
		},
		loadstaff: function(){
			PageCtrl.load({
				url : webPath + "/staff/list_nd",
				dom : "user-list",
				param : {
					
				},
				callback : function() {
					staff.sort();
				}
			});
		},
		update : function(id){
			
			$.layer({
                type: 1,
                title : "Modify staff",
                shadeClose: true,
                area : [ '525px', '336px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/staff/update?pjax=true&id=' + id
                },
                zIndex:2500
            });
			
		},
		save : function(form,iscontinue){
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
			Loading.start();
			 
			$(form).attr('action', webPath + "/staff/save");
			formTool.submitForm($(form),function(data){
				Loading.stop();
				if (data.message=="success"){	
					argusAlertStrip("alertMessage","success"," Success");
					if ($("#keepon").length>0){
						staff.loadstaff();
						if ($("#keepon").attr("checked") == "checked"){
							$(":text").val("");
							$("#password").val("");
							$("#confirm_password").val("");
						} else {
							$(".xubox_close").click();
						}
					} else {
						staff.loadstaff();
						$(".xubox_close").click();
					}
				}else if (data.message == "userEmailExit"){
					$("#userForm").closest('.help-inline').removeClass('ok');
					argusAlertStrip("alertMessage","warning"," Warning: Email is exist.");
				}else if(data.message == "photoBigError") {
					argusAlertStrip("alertMessage","warning"," Warning: The photo is too large");
				}else if(data.message == "employeeNumerExit") {
					argusAlertStrip("alertMessage","warning"," Warning:  Employee No. is exist.");
				}else if(data.message == "noCompany") {
					argusAlertStrip("alertMessage","warning"," Warning:  The company does not exist.");
				}
				else{
					argusAlertStrip("alertMessage","error"," Error");
				}
			});
			return false;
		},
		remove : function (id) {
			var ids=id;
			if(typeof(id)=="undefined"){
				ids="";
				$('input[name="id"]:checked').each(function(){
					ids+=$(this).val()+",";
			    });
			}
			if(!ids){
				argusAlertStrip("alertMessage","warning"," Warning:  Please select at least one.");
				return false;
			}　
			argusConfirm("Confirm delete?",function(result){
				if(result){
					Loading.start();
					PageCtrl.ajax({
						url : webPath + "/staff/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							Loading.stop();
							if (data.message=="success"){					
								staff.backList();
							}else{
								argusAlertStrip("alertMessage","error"," Error");
							}
						}
					});
				}
			});
		},
		saveAndContinue:function(){
			staff.save($("#staffForm"),true);
		},
		changePassword : function(){
			if ($("#changePassword").attr("checked") == "checked"){
				$("#changePassword").val(true);
				$(".pw-div").slideDown("fast");
			}else{
				$("#changePassword").val(false);
				$(".pw-div").fadeOut("fast");
			}
		},
		backList: function(){
			document.location.href = webPath + '/staff/list';
		},
		initSavePage : function(){

			$('#staffForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"email" : {
						required : true,
						email	 : true
					},
					"password" : {
						required : "#changePassword:checked"
					},
					"confirm_password" : {
						equalTo: "#password"
					}
				},
		        errorPlacement: function (error, element) { // render error placement for each input type
		            error.insertAfter(element); // for other inputs, just perform default behavoir
		            
		            if (element.attr("name") == "roleId") {
		            	$("#roleId-controls div a").attr("style","border-color: #b94a48 !important");
		            }
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
		            if ($(element).attr("name") == "roleId") {
		            	$("#roleId-controls div a").attr("style","");
		            }
		        },

		        success: function (label) {
		            label.addClass('valid').closest('.control-group').removeClass('error'); // set success class to the control group
		            label.remove();
		            
		        },
		        
		        submitHandler: function(form){  
		        	staff.save(form,false);
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
			$("#status").select2({
				placeholder : "Select an option",
				allowClear : true
			});
			//fileinput();
			$(".switch").bootstrapSwitch();
		}
};
