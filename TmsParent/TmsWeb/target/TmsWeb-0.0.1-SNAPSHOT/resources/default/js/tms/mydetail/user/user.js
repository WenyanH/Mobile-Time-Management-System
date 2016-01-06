$(document).ready(function(){
	if ($('#userForm').length>0){
		$('#userForm').validate({
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
				},
				"roleId" : {
					required : true
				},
				"email" : {
					required : true,
					email	 : true
				},
				"password" : {
					required : "#changePassword:checked"
				},
				"confirm_password" : {
					required : "#changePassword:checked",
					equalTo: "#password"
				},
				"roleId": {
					required : true
				},
				"jobNumber" : {
					required : "#isEmployee:checked"
				},
				"hireOnDateValue" : {
					required : "#isEmployee:checked"
				},
				"terminateDateValue" : {
					required : "#isEmployee:checked"
				},
				"clockId" : {
					required : "#isEmployee:checked",
					number : "#isEmployee:checked",
					min : 1
				},
				"payId" : {
					required : "#isEmployee:checked"
				},
				"paygroupId" : {
					required : "#isEmployee:checked"
				},
				"departmentValue" : {
					required : true
				}
				
			},


	        errorPlacement: function (error, element) { // render error placement for each input type
	            error.insertAfter(element); // for other inputs, just perform default behavoir
	            
	            if (element.attr("name") == "roleId") {
	            	$("#roleId-controls div a").attr("style","border-color: #b94a48 !important");
	            }
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
	            if ($(element).attr("name") == "roleId") {
	            	$("#roleId-controls div a").attr("style","");
	            }
	        },

	        success: function (label) {
	            label.addClass('valid').closest('.control-group').removeClass('error'); // set success class to the control group
	            label.remove();
	            
	        },
	        
	        submitHandler: function(form){  
	        	user.save(form,false);
	        },
	        
	        onfocusin: function( element, event ) {
	        	if ($("#alertMessage").html()!="")
	        		$("#alertMessage").html("")
	        }
	        
		});
		user.isExport();
		
		$("#roleId").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
		$("#employeeId").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
		$("#paygroupId").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
		$("#positionId").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
		$("#jobId").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
		$("#timeRoundingId").select2({
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
		
		$("#employeeStatus").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
		
		fileinput();
	}
	$("#roleId").change(function(){ 
		controlCheckBox();
	});
	user.sort();
	controlCheckBox();
	user.display();
});
function controlCheckBox(){
	var p1=$("#roleId").children('option:selected').html();
	if(p1=="supervisor"){
		$("input:checkbox[name='departments']").attr("disabled",false);
		$("input:checkbox[name='funs']").attr("disabled",false);
	}else{
		$("input:checkbox[name='departments']").attr("disabled",true);
		$("input:checkbox[name='funs']").attr("disabled",true);
	}
}
var user = {
		sort: function(){
			$("#user-table-sort").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{ 
			    	orderable:false,//禁用排序 
			    	targets:[5]   //指定的列 
		    	}],
				bStateSave : true
		    });
		},
		loaduser: function(){
			PageCtrl.load({
				url : webPath + "/user/list_nd",
				dom : "user-table",
				param : {
					
				},
				callback : function() {
					user.sort();
				}
			});
		},
		create : function() {
			
			window.location.href = webPath + '/user/create';
			
			/*$.layer({
				type : 2,
				title : "Create a new user",
				shadeClose: true,
				iframe : {
					src : webPath + '/user/create'
				},
				area : [ '1000px', '550px' ],
				offset : [ '40px', '' ]
			});*/
		},
		update : function(id){
			
			window.location.href = webPath + '/user/update?id=' + id;
			
			/*$.layer({
				type : 2,
				title : "Modify a user",
				shadeClose: true,
				iframe : {
					src : webPath + '/user/update?id=' + id
				},
				area : [ '1000px', '550px' ],
				offset : [ '40px', '' ]
			});*/
		},
		updateStatus:function(id){
			$.layer({
                type: 1,
                title : "Modify a User Status",
                shadeClose: true,
                area : [ '525px', '176px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/user/updateStatus?pjax=true&id=' + id
                },
                zIndex:2500
            });	
		},		
		save : function(form,iscontinue){
			if($("#hireOnDateValue").val()!=""&&$("#terminateDate").val()!=""){
				if(!user.checkdate($("#hireOnDateValue").val(),$("#terminateDate").val())){
					argusAlertStrip("alertMessage","warning"," Warning: Hire On no less than or equal to Terminate Date");
					return false;
				}
			}
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
			parent.Loading.start();
			 
			$(form).attr('action', webPath + "/user/save");
			formTool.submitForm($(form),function(data){
				parent.Loading.stop();
				if (data.message=="success"){					
					argusAlertStrip("alertMessage","success"," Success");
					if(iscontinue){
						document.location.href = webPath + '/user/create';//history.back(-1);
					}else{						
						user.backList();
					}
				}else if (data.message == "userEmailExit"){
					$("#userForm").closest('.help-inline').removeClass('ok');
					argusAlertStrip("alertMessage","warning"," Warning: Email is exist.");
				}else if(data.message == "photoBigError") {
					argusAlertStrip("alertMessage","warning"," Warning: The photo is too large");
				}else if(data.message == "employeeNumerExit") {
					argusAlertStrip("alertMessage","warning"," Warning: Employee ID or ClockId is exist.");
				}else if(data.message == "noCompany") {
					argusAlertStrip("alertMessage","warning"," Warning: The company does not exist.");
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
						url : webPath + "/user/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							Loading.stop();
							if (data.message=="success"){					
								employee.backList();
							}else{
								argusAlertStrip("alertMessage","error"," Error");
							}
						}
					});
				}
			});
		},
		isEmployee : function(){
			if ($("#isEmployee").attr("checked") == "checked"){
				$("#employeeInfo").show();
				$("#savebutton").hide();
				$("#savebutton").addClass("savebuttonfixed");
				$("#savebutton").width($("#userForm").width()-20);
				$("#savebutton").fadeIn("slow");
				$("#isEmployee").val(true);
			}else{
				$("#employeeInfo").fadeOut("fast");
				$("#savebutton").removeClass("savebuttonfixed");
				$("#isEmployee").val(false);
			}
		},
		isExport : function(){
			if ($("#isExport").attr("checked") == "checked"){
				$("#isExport").val(true);
			}else{
				$("#isExport").val(false);
			}
		},
		saveAndContinue:function(){
			user.save($("#userForm"),true);
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
			document.location.href = webPath + '/user/list';
		},
		checkdate: function(startDate,endDate){   
			var sDate = new Date(startDate.replace('//-/g', '//'));
			var eDate = new Date(endDate.replace('//-/g', "//"));
			if(sDate < eDate){
				return true;
			}
			return false;
		},
		switchdisplay:function(){
			var display=$.cookie('tmsUserDisplay');
			if(display=='list'){
				$.cookie('tmsUserDisplay', 'table', { expires:60, path: '/' });
			}else{
				$.cookie('tmsUserDisplay', 'list', { expires:60, path: '/' });
			}
			user.display();
		},
		display:function(){
			var display=$.cookie('tmsUserDisplay');
			if(display=="table"){
				$("#user_delete_list").hide();
				$("#user-list").hide();
				$("#user-table").show();
			}else{
				$("#user_delete_list").show();
				$("#user-list").show();
				$("#user-table").hide();
			}
		},
		initFunction : true,
		isSupervisor : function(){
			if ($("#roleId").val() == 3){
				$("#managementControlGroup").slideDown("fast");
				$("#funControlGroup").slideDown("fast");
				if (this.initFunction){
					$('#funs').multiselect({
						  checkAllText: 'All',
					      uncheckAllText: 'Uncheck',
					      noneSelectedText: "Please select",//'请选择节点'
					      selectedText: "# selected",//'已经选中 # 个节点'
					      classes:"",
					      minWidth:"300px;"
						 
					 }).multiselectfilter({
						  label: "Search",//'搜索:'
					      width: "90",  //override default width set in css file (px). null will inherit 
					      placeholder: '',
					      autoReset: true
						 
					 });
					this.initFunction = false;
				}
				
			}else{
				$("#managementControlGroup").fadeOut("fast");
				$("#funControlGroup").fadeOut("fast");
			}
		}
		
};
