$(document).ready(function(){
	sendreport.sort();
	
});

var sendreport = {
		sort: function(){
			$("#sendreport-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{
			    	orderable:false,//禁用排序
			    	targets:[5]   //指定的列
		    	}],
		    	bStateSave : true
		    });


		},

		loadsendreport: function(){
			PageCtrl.load({
				url : webPath + "/sendreport/list_nd",
				dom : "sendreport-table",
				param : {
					
				},
				callback : function() {
					sendreport.sort();
				}
			});
		},
		
		create : function() {
			
			$.layer({
				type : 2,
				title : "Create a new send report",
				shadeClose: true,
				iframe : {
					src : webPath + '/sendreport/create'
				},
				area : [ '525px', '450px' ],
                offset : [ '100px', '' ]
			});			
			
			
		},
		
		update : function(id){
			
			$.layer({
				type : 2,
				title : "Modify a send report",
				shadeClose: true,
				iframe : {
					src : webPath + '/sendreport/update?id=' + id
				},
				area : [ '525px', '450px' ],
                offset : [ '100px', '' ]
			});
			
			
			
		},
		
		save : function(form){
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
        		$(form).attr('action', webPath + "/sendreport/save");
			formTool.submitForm($(form),function(data){
				Loading.stop();
				if (data.message=="success"){					
					argusAlertStrip("alertMessage","success"," Success");
					
					parent.sendreport.loadsendreport();
				}
				else{
					argusAlertStrip("alertMessage","error"," Error");
				}
			});
			
			return false;	
			/*var id = $("#id").val();
			var code = $("#code").val();
			var name = $("#name").val();
			var punchCode = $("#punchCode").val();
			var description= $("#description").val();
			var taskID = $("#taskID").val();
			
			
            var active;
			var status1 = $("#active").attr("checked");
			if (status1 == "checked") {
				active = true;
			} else {
				active = false;
			}
			
			var usePunchCode;
			var status2 = $("#usePunchCode").attr("checked");
			if (status2 == "checked") {
				usePunchCode = true;
			} else {
				usePunchCode = false;				
			}
			
			var _result = {
					id : id,
					code : code,
					name : name,
					punchCode : punchCode,
					description : description,
					taskID : taskID,
					active : active,
					usePunchCode : usePunchCode
			};

			parent.Loading.start();
			PageCtrl.ajax({
				url : webPath + "/sendreport/save",
				data : JSON.stringify(_result),
				dataType: "json",
				type : "post",
				contentType:"application/json",
			    success : function(data) {
			    	parent.Loading.stop();
					if (data.message=="success"){					
						argusAlertStrip("alertMessage","success"," Success");
						if ($("#keepon").length>0){
							parent.sendreport.loadsendreport();
							
							if ($("#keepon").attr("checked") == "checked"){
								$(":text").val("");
							} else {
								parent.$(".xubox_close").click();
							}
						} else {
							parent.sendreport.loadsendreport();
							parent.$(".xubox_close").click();
						}
						
					}else if (data.message == "exist"){
						$("#sendreportForm").closest('.help-inline').removeClass('ok');
						argusAlertStrip("alertMessage","warning"," Warning: Code or name or punch code has existed.");
					}else {
						argusAlertStrip("alertMessage","error"," Error");
					}
				}
			});
			
			
			return false;*/
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
						url : webPath + "/sendreport/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							sendreport.loadsendreport();
							Loading.stop();
						}
					});
				}
			});
		},
		
		initSavePage : function(){

			$('#sendreportForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"sendTo" : {
						required : true,
						email	 : true
					},
					"reportType" : {
						required : true,								
					},
					"runatTime" : {
						required : true,
						minlength: 3						
					},
					"sendFrequency" : {
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
		        	sendreport.save(form);
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
			
			$("#runatTime").datetimepicker({
				pickTime: true,
				format: "yyyy-MM-dd hh:mm",
				pickerPosition : "left"
			});
			
			$("#usePunchCode").bind("click", function(){
				if($("#usePunchCode").attr("checked")=="checked"){
					$("#punchCode").attr("disabled",false);
				} else {				
					$("#punchCode").attr("disabled",true);	
					$("#punchCode").val("");
					
				}
			});				
			
				
			$('#taskID').multiselect({
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
				
		}
		
		
};
		