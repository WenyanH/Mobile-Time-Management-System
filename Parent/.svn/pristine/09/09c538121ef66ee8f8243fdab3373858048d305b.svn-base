
$(document).ready(function(){
	paygroup.sort();
	
});


var paygroup = {
		sort: function(){
			$("#paygroup-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{ 
			    	orderable:false,//禁用排序 
			    	targets:[5,7]   //指定的列 
		    	}],
		    	bStateSave : true
		    });
		},
		
		loadpaygroup: function(){
			PageCtrl.load({
				url : webPath + "/paygroup/list_nd",
				dom : "paygroup-table",
				param : {
					
				},
				callback : function() {
					paygroup.sort();
				}
			});
		},
		create : function() {
			
			$.layer({
                type: 1,
                title : "Create a new pay group",
                shadeClose: true,
                area : [ '800px', '460px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/paygroup/create?pjax=true'
                },
                zIndex:2500
            });
			
		},
		update : function(id){
			
			$.layer({
                type: 1,
                title : "Modify a pay group",
                shadeClose: true,
                area : [ '800px', '460px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/paygroup/update?pjax=true&id=' + id
                },
                zIndex:2500
            });
			
			
		},
		save : function(){
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
        		
			var id = $("#id").val();
			var code = $("#code").val();
			var name = $("#name").val();
			var dailyHours = $("#dailyHours").val();
			var payPeriod = $("#period").val();
			var startTime = $("#startTime").val();
			var Memo = $("#memo").val();
			
			var active;
			var status = $("#status").attr("checked");
			if (status == "checked") {
				active = true;
			} else {
				active = false;
			}
			
			var acceptEA;
			var acceptea = $("#acceptEA").attr("checked");
			if (acceptea == "checked") {
				acceptEA = true;
			} else {
				acceptEA = false;
			}
			
			var acceptLD;
			var acceptld = $("#acceptLD").attr("checked");
			if (acceptld == "checked") {
				acceptLD = true;
			} else {
				acceptLD = false;
			}
			
			var checkLA;
			var checkla = $("#checkLA").attr("checked");
			if (checkla == "checked") {
				checkLA = true;
			} else {
				checkLA = false;
			}
			
			var checkED;
			var checked = $("#checkED").attr("checked");
			if (checked == "checked") {
				checkED = true;
			} else {
				checkED = false;
			}
			
			var supervisorMAOT;
			var supervisormaot = $("#supervisorMAOT").attr("checked");
			if (supervisormaot == "checked") {
				supervisorMAOT = true;
			} else {
				supervisorMAOT = false;
			}
			
			Loading.start();
			PageCtrl.ajax({
				url : webPath + "/paygroup/save",
				data : {
					id : id,
					code : code,
					name : name,
					active : active,
					dailyHours : dailyHours, 
					payPeriod: payPeriod,
					acceptEA : acceptEA,
					acceptLD : acceptLD,
					checkLA : checkLA,
					checkED : checkED,
					supervisorMAOT : supervisorMAOT,
					startTime : startTime,
					Memo: Memo
				},
				dataType: "json",
				type : "post",
				success : function(data) {
					Loading.stop();
					if (data.message=="success"){					
						argusAlertStrip("alertMessage","success"," Success");
						if ($("#keepon").length>0){
							paygroup.loadpaygroup();
							
							if ($("#keepon").attr("checked") == "checked"){
								$(":text").val("");
							} else {
								$(".xubox_close").click();
							}
						} else {
							paygroup.loadpaygroup();
							$(".xubox_close").click();
						}
						
					}else if (data.message == "exist"){
						$("#paygroupForm").closest('.help-inline').removeClass('ok');
						argusAlertStrip("alertMessage","warning"," Warning: Code or name has existed.");
					}else {
						argusAlertStrip("alertMessage","error"," Error");
					}
				}
			});
			
			
			return false;
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
						url : webPath + "/paygroup/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							paygroup.loadpaygroup();
							Loading.stop();
						}
					});
				}
			});
		},
		initSavePage : function(){

			$('#paygroupForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"code" : {
						required : true				    
					},
					"name" : {
						required : true,
						minlength: 3					
					},
					"dailyHours":{
						range:[0,24],
						isFloatGtZero : true,						
						required : true,
						number : true
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
		        	paygroup.save();
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
		
			
			$("#period").select2({
				placeholder : "Select an option",
				allowClear : true
			});
			
			$("#startdatetime").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd",
				pickerPosition : "left"
			});
			
			var startTime = $("#startTime");
			if (startTime.val()==""){
				var d = new Date();
				var month = d.getMonth()+1;
				if (month<10) 
					month = "0"+month;
				var date = d.getDate()
				if (date<10) 
					date = "0"+date;
				
				
				$("#startTime").val(d.getFullYear()+"-"+ month +"-"+date);
			}
			
			
		}
		
		
};


