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
                area : [ '525px', '560px' ],
                offset : [ '100px', '' ],
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
                area : [ '525px', '560px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/leave/update?pjax=true&id=' + id
                },
                zIndex:2500
            });		
			
		},
		
		save : function(){
			
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
      		
			var id = $("#id").val();
			var typeID = $("#typeID").val();
			var employeeID = $("#employeeID").val();	
			var duration = $("#duration").val();	
			var fromDate = $("#fromDate").val();			
			var toDate = $("#toDate").val();			
            var fromLeaveTime = $("#fromLeaveTime").val();	
            var toLeaveTime = $("#toLeaveTime").val();	
            var Memo = $("#memo").val();	          
            var byWorkHours;
            var description;
			var status = $("#byWorkHours").attr("checked");
			if (status == "checked") {
				byWorkHours = true;
				description=fromDate + " " + fromLeaveTime + " "+ "to" +" "+ toLeaveTime;
			} else {
				byWorkHours = false;
				description=fromDate + " "+ "to" +" "+ toDate;
			}
			
			
			
			
			
			Loading.start();
			 
			PageCtrl.ajax({
				url : webPath + "/leave/save",
				data : {
					id : id,
					typeID : typeID,
					employeeID : employeeID,
					duration : duration,
					fromDate : fromDate,
					toDate : toDate,
					fromLeaveTime : fromLeaveTime,
					toLeaveTime : toLeaveTime,
					Memo : Memo,
					byWorkHours : byWorkHours,
					description : description
				},
				dataType: "json",
				type : "post",
			    success : function(data) {
			    
					Loading.stop();
					if (data.message=="success"){					
						argusAlertStrip("alertMessage","success"," Success");
						if ($("#keepon").length>0){
							leave.loadleave();
							
							if ($("#keepon").attr("checked") == "checked"){
								$(":text").val("");
							} else {
								$(".xubox_close").click();
							}
						} else {
							leave.loadleave();
							$(".xubox_close").click();
						}
						
					}else if (data.message == "exist"){
						$("#leaveForm").closest('.help-inline').removeClass('ok');
						argusAlertStrip("alertMessage","warning"," Warning: Leave has existed.");
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
		        	leave.save();		
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
				$("#byWorkHours").bind("click", function(){
				if($("#byWorkHours").attr("checked")=="checked"){
					$("#durationline").css("display","none");
					$("#toDateline").css("display","none");
					$("#fromLeaveTimeline").css("display","block");
					$("#toLeaveTimeline").css("display","block");
					$("#toDate").val($("#fromDate").val());		
					$("#duration").val(0+".0");
					
				} else {
					$("#durationline").css("display","block");
					$("#toDateline").css("display","block");
					$("#fromLeaveTimeline").css("display","none");
					$("#fromLeaveTime").val("");
					$("#toLeaveTimeline").css("display","none");	
					$("#toLeaveTime").val("");				
				}
			});
				
				
				$("#usePunchCode").bind("click", function(){
					if($("#usePunchCode").attr("checked")=="checked"){
						$("#punchCode").attr("disabled",false);
					} else {				
						$("#punchCode").attr("disabled",true);	
						$("#punchCode").val("");
						
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
		}
		
		
};
		