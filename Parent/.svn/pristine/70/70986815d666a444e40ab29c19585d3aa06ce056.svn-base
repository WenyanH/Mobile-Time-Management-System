
$(document).ready(function(){
	payrolltransfer.sort();
	$("#employeeId").select2({
		placeholder : "Select an option",
		allowClear : true
	});
});


var payrolltransfer = {
		changeEmployee : function(id){
			location.href = webPath + "/payrolltransfer/list?employeeId="+id;
		},
		paycard : function(fromDate,toDate){
			location.href = webPath + "/paycard/list?fromDate="+fromDate+"&toDate="+toDate;
		},
		sort: function(){
			$("#payrolltransfer-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{ 
			    	orderable:false,//禁用排序 
			    	targets:[7]   //指定的列 
		    	}],
		    	bStateSave : true
		    });
		},
		
		loadpayrolltransfer: function(){
			PageCtrl.load({
				url : webPath + "/payrolltransfer/list_nd",
				dom : "payrolltransfer-table",
				param : {
				},
				callback : function() {
					payrolltransfer.sort();
				}
			});
		},
		remove : function () {
			var ids="";
			$('input[name="id"]:checked').each(function(){
				ids+=$(this).val()+",";
		    });

			argusConfirm("Confirm delete?",function(result){
				if(result){
					Loading.start();
					PageCtrl.ajax({
						url : webPath + "/payrolltransfer/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							payrolltransfer.loadpayrolltransfer();
							Loading.stop();
						}
					});
				}
			});
		},
		initSavePage : function(){

			$('#payrolltransferForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"code" : {
						required : true				    
					},
					"fromDate" : {
						required : true				    
					},
					"toDate" : {
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
		        	payrolltransfer.save(form);
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
			$("#from").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd",
				pickerPosition : "left"
			});
			$("#to").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd",
				pickerPosition : "left"
			});
		},
		opend : function(){
			var ids="";
			$('input[name="id"]:checked').each(function(){
				ids+=$(this).val()+",";
		    });
			if(!ids){
				argusAlertStrip("alertMessage","warning"," Warning:  Please select at least one.");
				return false;
			}　
			argusConfirm("Confirm open?",function(result){
				if(result){
					Loading.start();
					PageCtrl.ajax({
						url : webPath + "/payrolltransfer/open?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							payrolltransfer.loadpayrolltransfer();
							Loading.stop();
						}
					});
				}
			});
		},
		closed : function(){
			var ids="";
			$('input[name="id"]:checked').each(function(){
				ids+=$(this).val()+",";
		    });
			if(!ids){
				argusAlertStrip("alertMessage","warning"," Warning:  Please select at least one.");
				return false;
			}　
			argusConfirm("Confirm close ?",function(result){
				if(result){
					Loading.start();
					PageCtrl.ajax({
						url : webPath + "/payrolltransfer/close?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							payrolltransfer.loadpayrolltransfer();
							Loading.stop();
						}
					});
				}
			});
		},
		relcalculate : function(){
			Loading.start();
			PageCtrl.ajax({
				url : webPath + "/payrolltransfer/relcalculate",
				type : "post",
				dataType: "json",
				success : function(data) {
					payrolltransfer.loadpayrolltransfer();
					Loading.stop();
				}
			});
		}
};


