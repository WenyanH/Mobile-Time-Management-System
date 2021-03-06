$(document).ready(function(){
	task.sort();
	
});

var task = {
		sort: function(){
			$("#task-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{
			    	orderable:false,//禁用排序
			    	targets:[5]   //指定的列
		    	}],
		    	bStateSave : true
		    });


		},

			loadtask: function(){
			PageCtrl.load({
				url : webPath + "/task/list_nd",
				dom : "task-table",
				param : {
					
				},
				callback : function() {
					task.sort();
				}
			});
		},
		
		create : function() {
			
			$.layer({
                type: 1,
                title : "Create a new task",
                shadeClose: true,
                area : [ '525px', '380px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/task/create?pjax=true'
                },
                zIndex:2500
            });
			
		},
		
		update : function(id){
			
			$.layer({
                type: 1,
                title : "Modify a task",
                shadeClose: true,
                area : [ '525px', '380px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/task/update?pjax=true&id=' + id
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
			var punchCode = $("#punchCode").val();
			var description= $("#description").val();
            
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
			Loading.start();
			PageCtrl.ajax({
				url : webPath + "/task/save",
				data : {
					id : id,
					code : code,
					name : name,
					punchCode : punchCode,
					description : description,
					active : active,
					usePunchCode : usePunchCode
				},
				dataType: "json",
				type : "post",
			    success : function(data) {
					Loading.stop();
					if (data.message=="success"){					
						argusAlertStrip("alertMessage","success"," Success");
						if ($("#keepon").length>0){
							task.loadtask();
							
							if ($("#keepon").attr("checked") == "checked"){
								$(":text").val("");
							} else {
								$(".xubox_close").click();
							}
						} else {
							task.loadtask();
							$(".xubox_close").click();
						}
						
					}else if (data.message == "exist"){
						$("#taskForm").closest('.help-inline').removeClass('ok');
						argusAlertStrip("alertMessage","warning"," Warning: Code or name or punch code has existed.");
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
						url : webPath + "/task/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							task.loadtask();
							Loading.stop();
						}
					});
				}
			});
		},
		
		initSavePage : function(){

			$('#taskForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"code" : {
						required : true,								
					},
					"name" : {
						required : true,
						minlength: 3						
					},	
					"punchCode" : {
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
		        	task.save();
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
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
			
		}
		
		
};
		