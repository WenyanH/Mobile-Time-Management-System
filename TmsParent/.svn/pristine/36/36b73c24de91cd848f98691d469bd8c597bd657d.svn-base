$(document).ready(function(){
	report.sort();
	
});
var report = {
		sort: function(){
			$("#report-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{
			    	orderable:false,//禁用排序
			    	targets:[5]   //指定的列
		    	}],
		    	bStateSave : true
		    });
		},
		loadreport: function(){
			PageCtrl.load({
				url : webPath + "/report/list_nd",
				dom : "report-table",
				param : {
				},
				callback : function() {
					report.sort();
				}
			});
		},
		create : function() {
			$.layer({
                type: 1,
                title : "Create a new report",
                shadeClose: true,
                area : [ '525px', '480px' ],
                offset : [ '80px', '' ],
                page: {
                	url : webPath + '/report/create?pjax=true'
                },
                zIndex:2500
            });
		},
		update : function(id){
			$.layer({
                type: 1,
                title : "Modify a report",
                shadeClose: true,
                area : [ '525px', '480px' ],
                offset : [ '80px', '' ],
                page: {
                	url : webPath + '/report/update?pjax=true&id=' + id
                },
                zIndex:2500
            });		
		},
		download : function(id){
			window.open(webPath + "/report/download?id="+id);
		},
		save : function(form){
			if ($("#alertMessage").html()!=""){$("#alertMessage").html("");}
			$(form).attr('action', webPath + "/report/save");
			formTool.submitForm($(form),function(data){
				Loading.stop();
				if (data.message=="success"){
					if ($("#keepon").attr("checked") == "checked"){
						$(":text").val("");
					} else {
						$(".xubox_close").click();
					}
					report.loadreport();
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
			if(!ids){
				argusAlertStrip("alertMessage","warning"," Warning:  Please select at least one.");
				return false;
			}
			argusConfirm("Confirm delete?",function(result){
				if(result){
					Loading.start();
					PageCtrl.ajax({
						url : webPath + "/report/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							report.loadreport();
							Loading.stop();
						}
					});
				}
			});
		},
		initSavePage : function(){
			$('#reportForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"reportType" : {
						required : true	
					},
					"payGroupId" : {
						required : true	
					},
					"paging" : {
						required : true	
					},
					"sort" : {
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
		        	report.save(form);
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
		}
};
		