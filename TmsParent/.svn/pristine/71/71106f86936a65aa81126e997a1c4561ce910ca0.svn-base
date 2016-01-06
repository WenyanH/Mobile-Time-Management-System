$(document).ready(function(){
	leave.sort();
	
});

var leave = {
		sort: function(){
			$("#leave-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{
			    	orderable:false,//禁用排序
			    	targets:[4]   //指定的列
		    	}],
		    	bStateSave : true
		    });


		},

			loadleave: function(){
			PageCtrl.load({
				url : webPath + "/leave/list_nd",
				dom : "leave-table",
				param : {
					
				},
				callback : function() {
					leave.sort();
				}
			});
		},
		
		create : function() {
			$.layer({
                type: 1,
                title : "Create a new leave",
                shadeClose: true,
                area : [ '525px', '480px' ],
                offset : [ '80px', '' ],
                page: {
                	url : webPath + '/leave/create?pjax=true'
                },
                zIndex:2500
            });
			
		},
		
		update : function(id){
			
			$.layer({
                type: 1,
                title : "Modify a leave",
                shadeClose: true,
                area : [ '525px', '480px' ],
                offset : [ '80px', '' ],
                page: {
                	url : webPath + '/leave/update?pjax=true&id=' + id
                },
                zIndex:2500
            });		
			
		},
		
		save : function(form){
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
        		if($("#byWorkHours").attr("checked")){
        			if($("#fromLeaveTime").val()!=""&&$("#toLeaveTime").val()!=""){
        				var date = new Date();
    					var month = date.getMonth() + 1;
    					if(month<10){
    						month="0"+month;
    					}
    				    var strDate = date.getDate();
    					 var daybegin=$("#fromLeaveTime").val();
    					 var dayend=$("#toLeaveTime").val();
    					 var daybeginTime=new Date(date.getFullYear(),month,strDate,daybegin.split(":")[0],daybegin.split(":")[1],00)
    					 var dayendTime=new Date(date.getFullYear(),month,strDate,dayend.split(":")[0],dayend.split(":")[1],00)
    					 
    					if(daybeginTime>dayendTime){
    						argusAlertStrip("alertMessage","warning"," Warning: To no less than or equal to From");
    						return false;
    					}
        			}	
        		}else{
        			if($("#fromDate").val()!=""&&$("#toDate").val()!=""){
        				if(!leave.checkdate($("#fromDate").val(),$("#toDate").val())){
        					argusAlertStrip("alertMessage","warning"," Warning: ToDate no less than or equal to FromDate");
        					return false;
        				}
        			}
        		}
    			
        	Loading.start();
			$(form).attr('action', webPath + "/leave/save");
			formTool.submitForm($(form),function(data){
				Loading.stop();
				if (data.message=="success"){
					if ($("#keepon").attr("checked") == "checked"){
						$(":text").val("");
					} else {
						$(".xubox_close").click();
					}
					leave.loadleave();
				}else if (data.message == "exist"){
					argusAlertStrip("alertDepartmentMessage","warning"," Warning: The code is exist.");
				}
				else {
					argusAlertStrip("alertDepartmentMessage","error"," Error");
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
						url : webPath + "/leave/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							leave.loadleave();
							Loading.stop();
						}
					});
				}
			});
		},
		
		initSavePage : function(){		

			$('#leaveForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"employeeID" : {
						required : true					
					},
					"typeID" : {
						required : true
					},
					"duration" : {						
						range:[0,100]
					},
					"fromDate" : {
						required : true					
					},	
					"toDate" : {
						required : true									
					},			
					"fromLeaveTime" : {
						required : true	
					},
					"toLeaveTime" : {
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
		        	leave.save(form);		
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
			
			
			
			$("#employeeID").select2({
				placeholder : "Select an option",
				allowClear : true
			});	
			
			$("#typeID").select2({
				placeholder : "Select an option",
				allowClear : true
			});	
			
			$("#fromLeave").datetimepicker({
				pickDate: false,
				format: "hh:mm"
			});
			
			$("#toLeave").datetimepicker({
				pickDate: false,
				format: "hh:mm"
			});
			
				
			$("#fromDatetime").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd"
			});
			
			$("#toDatetime").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd"
			});
			$("#byWorkHoursSwitch").bootstrapSwitch();
			leave.workHoursOnChange();
			
		},
		workHoursOnChange : function(){
			if($("#byWorkHours").attr("checked")){
				$("#durationline").hide();
				$("#toDateline").hide();
				$("#fromLeaveTimeline").slideDown("fast");
				$("#toLeaveTimeline").slideDown("fast");
				$("#toDate").val($("#fromDate").val());		
				$("#duration").val(0+".0");
				
			} else {
				$("#durationline").slideDown("fast");
				$("#toDateline").slideDown("fast");
				$("#fromLeaveTimeline").hide();
				$("#fromLeaveTime").val("");
				$("#toLeaveTimeline").hide();
				$("#toLeaveTime").val("");				
			}
		},
		checkdate: function(startDate,endDate){   
			var sDate = new Date(startDate.replace('//-/g', '//'));
			var eDate = new Date(endDate.replace('//-/g', "//"));
			if(sDate < eDate){
				return true;
			}
			return false;
		}
		
};
		