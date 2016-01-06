$(document).ready(function(){
	paytype.sort();
	
});

var paytype = {
		sort: function(){
			$("#paytype-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{
			    	orderable:false,//禁用排序
			    	targets:[6]   //指定的列
		    	}],
		    	bStateSave : true
		    });


		},

			loadpaytype: function(){
			PageCtrl.load({
				url : webPath + "/paytype/list_nd",
				dom : "paytype-table",
				param : {
					
				},
				callback : function() {
					paytype.sort();
				}
			});
		},
		
		create : function() {
			
			$.layer({
                type: 1,
                title : "Create a new pay type",
                shadeClose: true,
                area : [ '525px', '340px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/paytype/create?pjax=true'
                },
                zIndex:2500
            });
			
		},
		
		update : function(id){
			
			$.layer({
                type: 1,
                title : "Modify a pay type",
                shadeClose: true,
                area : [ '525px', '340px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/paytype/update?pjax=true&id=' + id
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
			var exportCode = $("#exportCode").val();
            
            var active;
			var status1 = $("#active").attr("checked");
			if (status1 == "checked") {
				active = true;
			} else {
				active = false;
			}
			
			var leaveStatus;
			var status2 = $("#leaveStatus").attr("checked");
			if (status2 == "checked") {
				leaveStatus = true;
			} else {
				leaveStatus = false;
			}
			
			var convertToDay;
			var status3 = $("#convertToDay").attr("checked");
			if (status3 == "checked") {
				convertToDay = true;
				var ctDay = $("#ctDay").val();
			} else {
				convertToDay = false;
			}
						
			
			
			
			Loading.start();
			PageCtrl.ajax({
				url : webPath + "/paytype/save",
				data : {
					id : id,
					code : code,
					name : name,
					exportCode : exportCode,
					active : active,
					leaveStatus : leaveStatus,
					convertToDay : convertToDay,
					ctDay : ctDay
				},
				dataType: "json",
				type : "post",
			    success : function(data) {
					Loading.stop();
					if (data.message=="success"){					
						argusAlertStrip("alertMessage","success"," Success");
						if ($("#keepon").length>0){
							paytype.loadpaytype();
							
							if ($("#keepon").attr("checked") == "checked"){
								$(":text").val("");
							} else {
								$(".xubox_close").click();
							}
						} else {
							paytype.loadpaytype();
							$(".xubox_close").click();
						}
						
					}else if (data.message == "exist"){
						$("#paytypeForm").closest('.help-inline').removeClass('ok');
						argusAlertStrip("alertMessage","warning"," Warning: Code or name has exist.");
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
						url : webPath + "/paytype/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							paytype.loadpaytype();
							Loading.stop();
						}
					});
				}
			});
		},
		
		initSavePage : function(){
			$('#paytypeForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input				
				rules : {
					"code" : {
						required : true,	
						minlength: 2
					},
					"name" : {
						required : true,
						minlength: 3,
						maxlength: 40
					},
					"exportCode":{						
						required : true						
					},
					"ctDay":{
						range:[1,24]												
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
		        	paytype.save();
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
			
			
			$("#convertToDay").bind("click", function(){
				if($("#convertToDay").attr("checked")=="checked"){
					$("#ctDay").attr("disabled",false);					
				} else {
					$("#ctDay").attr("disabled",true);
					$("#ctDay").val(1+".0");
				}
			});
		}
		
		
};
		