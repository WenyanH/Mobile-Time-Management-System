

var employeeSearch = {
		sort: function(){
			$("#employee-table-sort").dataTable({
				bAutoWidth : true,
				bStateSave : true,
				dom: 'C<"clear">lfrtip',
				columnDefs: [
					{orderable:false,targets:[0,19]},
					{visible: false, targets: [6,10,12,13,14,15,16,18]}
				],
				colVis: {
					exclude: [ 0,1,2,3,4,5,7,8,9,10,11,17 ],
		            showAll: "Show all"
				}
			
		    });
		},
		
		loademployee: function(){
			PageCtrl.load({
				url : webPath + "/employee/departlist_nd?department="+$("#department").val(),
				dom : "tab2",
				//param :  $("#searchEmployeeForm").serialize(),
				callback : function() {
					Loading.stop();
					//employeeSearch.sort();
				}
			});
		},
		create : function(departmentId) {
			$.layer({
                type: 1,
                title : "Create a new employee",
                shadeClose: true,
                area : [ '65%', '83%' ],
                offset : [ '50px', '' ],
                page: {
                	url : webPath + '/employee/create?pjax=true&flag=company&departmentId='+departmentId
                },
                zIndex:2500
            });
			
		},
		update : function(id){
			$.layer({
                type: 1,
                title : "Modify an employee",
                shadeClose: true,
                area : [ '65%', '83%' ],
                offset : [ '50px', '' ],
                page: {
                	url : webPath + '/employee/update?pjax=true&flag=company&id=' + id
                },
                zIndex:2500
            });
			
		},
		updateStatus : function(id){
			$.layer({
                type: 1,
                title : "Modify Employee Status",
                shadeClose: true,
                area : [ '400px', '300px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/employee/updateStatus?pjax=true&id=' + id
                },
                zIndex:2500
            });
			
		},
		search:function(){
			Loading.start();
			employeeSearch.loademployee();
			$("#searchEmployee").dropdown('toggle');
		},
		save : function(form){
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
			Loading.start();
		
			PageCtrl.ajax({
				url : webPath + "/employee/save",
				data : $("#employeeForm").serialize(),
				type : "post",
				dataType : "json",
				success : function(data) {
					Loading.stop();
					if (data.message=="success"){					
						argusAlertStrip("alertMessage","success"," Success");
						if ($("#keepon").length>0){
							employeeSearch.loademployee();
							if ($("#keepon").attr("checked") == "checked"){
								$(":text").val("");
							} else {
								$(".xubox_close").click();
							}
						} else {
							employeeSearch.loademployee();
							$(".xubox_close").click();
						}
						
					}else if (data.message == "exist"){
						$("#employeeForm").closest('.help-inline').removeClass('ok');
						argusAlertStrip("alertMessage","warning"," Warning: Code is exist.");
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
						url : webPath + "/employee/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							employeeSearch.loademployee();
							Loading.stop();
						}
					});
				}
			});
		},
		initSavePage : function(){

			$('#employeeForm').validate({
				ignore : "",
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"jobNumber" : {
						required : true
					},
					"firstName" : {
						required : true
					},
					"lastName" : {
						required : true					
					},
					"hireOnDateValue" : {
						required : true
					},
					"departmentId" : {
						required : true
					},
					"dailyHoursValue" : {
						required : true,
						number : true,
						range:[0,24],
						isFloatGtZero : true
						
					},
					"clockId" : {
						required : true,
						number : true,
						min : 1
					},
					"paygroupId" : {
						required : true
					}
				},


		        errorPlacement: function (error, element) { // render error placement for each input type
		            error.insertAfter(element); // for other inputs, just perform default behavoir
//		            if (element.attr("name") != "jobNumber"&&element.attr("name") != "firstName"&&element.attr("name") != "lastName"
//		            	&&element.attr("name") != "hireOnDate"&&element.attr("name") != "departmentId"){
//		            	$("#tab3").click();
//		            } 
		            
		            if (element.attr("name") == "departmentId") {
		            	$("#departmentId-controls div a").attr("style","border-color: #b94a48 !important");
		            }
		            if (element.attr("name") == "paygroupId") {
		            	$("#paygroupId-controls div a").attr("style","border-color: #b94a48 !important");
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
		            if ($(element).attr("name") == "departmentId") {
		            	$("#departmentId-controls div a").attr("style","");
		            }
		            if ($(element).attr("name") == "paygroupId") {
		            	$("#paygroupId-controls div a").attr("style","");
		            }
		        },

		        success: function (label) {
		            label.addClass('valid').closest('.control-group').removeClass('error'); // set success class to the control group
		            label.remove();
		            
		        },
		        
		        submitHandler: function(form){  
		        	employeeSearch.save(form);
		        },
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }
			});
			
			
			$("select").select2({
				placeholder : "Select an option",
				allowClear : true
			});
			
			$("#hireOnDatetime").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd",
				pickerPosition : "left"
			});
			
			$("#terminateDatetime").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd",
				pickerPosition : "left"
			});
			
		}
};