$(document).ready(function(){
	calculationscript.sort();
	
});
var calculationscript = {
		sort: function(){
			$("#calculationscript-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{
			    	orderable:false,//禁用排序
			    	targets:[5]   //指定的列
		    	}],
		    	bStateSave : true
		    });
		},
		loadcalculationscript: function(){
			PageCtrl.load({
				url : webPath + "/calculationscript/list_nd",
				dom : "calculationscript-table",
				param : {
				},
				callback : function() {
					calculationscript.sort();
				}
			});
		},
		showlog : function(key) {
			window.location.href = webPath + '/calculationscript/loglist?scriptKey='+key;
		},
		create : function(id) {
			window.location.href = webPath + '/calculationscript/create?companyId='+id;
		},
		update : function(id){
			window.location.href = webPath + '/calculationscript/update?id=' + id;
		},
		save : function(form,iscontinue){
			if ($("#alertMessage").html()!=""){$("#alertMessage").html("");}
			$("#scriptContext").val(codepress2.getCode());
			$(form).attr('action', webPath + "/calculationscript/save");
			formTool.submitForm($(form),function(data){
				if (data.message=="success"){					
					argusAlertStrip("alertMessage","success"," Success");
					if(iscontinue){
						document.location.href = webPath + '/calculationscript/create';//history.back(-1);
					}else{						
						calculationscript.backList(data.companyId);
					}
				}else if (data.message == "exist"){
					$("#customerForm").closest('.help-inline').removeClass('ok');
					argusAlertStrip("alertMessage","warning"," Warning: No is exist.");
				}
				else {
					argusAlertStrip("alertMessage","error"," Error");
				}
			});
			return false;
		},
		
		remove : function () {
			var ids="";
			$('input[name="id"]:checked').each(function(){
				ids+=$(this).val()+",";
		    });
			if(!ids){
				argusAlertStrip("alertMessage","warning"," Warning:  Please select at least one.");
				return false;
			}
			argusConfirm("Confirm delete?",function(result){
				if(result){
					Loading.start();
					PageCtrl.ajax({
						url : webPath + "/calculationscript/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							calculationscript.loadcalculationscript();
							Loading.stop();
						}
					});
				}
			});
		},
		saveAndContinue: function(){
			calculationscript.save($("#calculationscriptForm"),true);
		},
		backList: function(id){
			document.location.href = webPath + '/calculationscript/list?companyId='+id;
		},
		initSavePage : function(){
			$('#calculationscriptForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"title" : {
						required : true
					},
					"scriptContext" : {
						required : true	
					}
				},
				
				errorPlacement: function (error, element) { // render error placement for each input type
		        error.insertAfter(element); // for other inputs, just perform default behavior
		            
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
		        	calculationscript.save(form,false);
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
		}
};
		