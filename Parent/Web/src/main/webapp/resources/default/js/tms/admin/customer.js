$(document).ready(function(){
	if ($('#customerForm').length>0){
		$('#customerForm').validate({
			doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
			errorElement : 'span', //default input error message container
			errorClass : 'validate-inline', // default input error message class
			focusInvalid : false, // do not focus the last invalid input
			rules : {
				"number" : {
					required : true					
				},
				"tradingName" : {
					required : true
				},
				"email" : {
					required : true,
					email	 : true
				},
				"licenses" : {
					required : true,
					number	 : true
				},
				"phone" : {
					number	 : true
				},
				"timeZoneId" : {
					required : true
				},
				"token" : {
					required : true
				},
				"dayBegin" : {
					required : true
				},
				"dayEnd" : {
					required : true
				},
				"openedOn" : {
					required : true
				},
				"closedOn" : {
					required : true
				}
				
			},
	        errorPlacement: function (error, element) { // render error placement for each input type
	            error.insertAfter(element); // for other inputs, just perform default behavoir
	            
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
	        	customer.save(form,false);
	        },
	        
	        onfocusin: function( element, event ) {
	        	if ($("#alertMessage").html()!="")
	        		$("#alertMessage").html("")
	        }
		});
		
		$("#dayBegin").datetimepicker({
			pickDate: false,
			format: "hh:mm"
		});
		
		$("#dayEnd").datetimepicker({
			pickDate: false,
			format: "hh:mm"
		});
		
		$('#reportManagement').multiselect({
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
		
		$('#featuresIds').multiselect({
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
		
		$("#openedOn").datetimepicker({
			pickTime: false,
			format: "yyyy-MM-dd",
			pickerPosition : "left"
		});
		$("#closedOn").datetimepicker({
			pickTime: false,
			format: "yyyy-MM-dd",
			pickerPosition : "left"
		});
		
		$("#timeZoneId").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
		$("#outfaceType").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
		$("#otherOutfaceType").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
		
		$("#status").select2({
			placeholder : "Select an option",
			allowClear : true
		});
		
	}
	
	
	customer.sort();
	
});
var customer = {
		sort: function(){
			$("#data-table-sort").dataTable({
		        order : [[ 4, "asc" ]],
		        bAutoWidth : true,
		        columnDefs:[{ 
			    	orderable:false,//禁用排序 
			    	targets:[0,8]   //指定的列 
		    	}] 
		    });
		},
		loadcustomer: function(){
			PageCtrl.load({
				url : webPath + "/customer/list_nd",
				dom : "customer-table",
				param : {
					
				},
				callback : function() {
					customer.sort();
				}
			});
		},
		payrules : function(id) {
			document.location.href = webPath + '/calculationscript/list?companyId='+id;
		},
		create : function() {
			document.location.href = webPath + '/customer/create';
		},
		update : function(id){
			document.location.href = webPath + '/customer/update?id=' + id;
		},
		save : function(form,iscontinue){
			if($("#openedOnValue").val()!=""&&$("#closedOnValue").val()!=""){
				if(!customer.checkdate($("#openedOnValue").val(),$("#closedOnValue").val())){
					argusAlertStrip("alertMessage","warning"," Warning: ClosedOn no less than or equal to OpenedOn");
					return false;
				}
			}
			if($("#dayBeginValue").val()!=""&&$("#dayEndValue").val()!=""){
				if($("#perviousDay").attr("checked")!="checked"&&$("#nextDay").attr("checked")!="checked"){
					var date = new Date();
					var month = date.getMonth() + 1;
					if(month<10){
						month="0"+month;
					}
				    var strDate = date.getDate();
					 var daybegin=$("#dayBeginValue").val();
					 var dayend=$("#dayEndValue").val();
					 var daybeginTime=new Date(date.getFullYear(),month,strDate,daybegin.split(":")[0],daybegin.split(":")[1],00)
					 var dayendTime=new Date(date.getFullYear(),month,strDate,dayend.split(":")[0],dayend.split(":")[1],00)
					 
					if(daybeginTime>dayendTime){
						argusAlertStrip("alertMessage","warning"," Warning: DayEnd no less than or equal to DayBegin");
						return false;
					}
				}
			}
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
			$(form).attr('action', webPath + "/customer/save");
			formTool.submitForm($(form),function(data){
				if (data.message=="success"){					
					argusAlertStrip("alertMessage","success"," Success");
					if(iscontinue){
						document.location.href = webPath + '/customer/create';//history.back(-1);
					}else{						
						customer.backList();
					}
				}else if (data.message == "existNo"){
					$("#customerForm").closest('.help-inline').removeClass('ok');
					argusAlertStrip("alertMessage","warning"," Warning: No is exist.");
				}else if (data.message == "existEmail"){
					$("#customerForm").closest('.help-inline').removeClass('ok');
					argusAlertStrip("alertMessage","warning"," Warning: Email is exist.");
				}
				else {
					argusAlertStrip("alertMessage","error"," Error");
				}
			});
			return false;
		},
		saveAndContinue: function(){
			customer.save($("#customerForm"),true);
		},
		bindingCompany: function(id){
			Loading.start();
			PageCtrl.ajax({
				url : webPath + "/customer/binging?id="+id,
				type : "post",
				dataType: "json",
				success : function(data) {
					Loading.stop();
					if (data.message == "success"){
						argusAlertStrip("alertMessage","success"," success");
					}else{
						argusAlertStrip("alertMessage","error"," Error");
					}
				}
			});
		},
		backList: function(){
			document.location.href = webPath + '/customer/list';
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

