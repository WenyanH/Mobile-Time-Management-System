$(document).ready(function(){
	position.sort();
});


var position = {
		sort: function(){
			$("#position-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{ 
			    	orderable:false,//禁用排序 
			    	targets:[5]   //指定的列 
		    	}],
		    	bStateSave : true
		    });
			
			
		},
		
		loadposition: function(){

			//var ii = layer.load('loading...');
			PageCtrl.load({
				url : webPath + "/position/list_nd",
				dom : "position-table",
				param : {
					
				},
				callback : function() {
					position.sort();
				}
			});
		},
		create : function() {
			$.layer({
                type: 1,
                title : "Create a new position",
                shadeClose: true,
                area : [ '525px', '336px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/position/create?pjax=true'
                },
                zIndex:2500
            });
			
		},
		update : function(id){
			$.layer({
                type: 1,
                title : "Modify a position",
                shadeClose: true,
                area : [ '525px', '336px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/position/update?pjax=true&id=' + id
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
			var active;
			var status = $("#status").attr("checked");
			if (status == "checked") {
				active = true;
			} else {
				active = false;
			}
			
			Loading.start();
			PageCtrl.ajax({
				url : webPath + "/position/save",
				data : {
					id : id,
					code : code,
					name : name,
					punchCode : punchCode,
					active : active,
				},
				dataType: "json",
				type : "post",
				success : function(data) {
					Loading.stop();
					if (data.message=="success"){					
						argusAlertStrip("alertMessage","success"," Success");
						if ($("#keepon").length>0){
							position.loadposition();
							
							if ($("#keepon").attr("checked") == "checked"){
								$(":text").val("");
							} else {
								$(".xubox_close").click();
							}
						} else {
							position.loadposition();
							$(".xubox_close").click();
						}
						
					}else if (data.message == "exist"){
						$("#positionForm").closest('.help-inline').removeClass('ok');
						argusAlertStrip("alertMessage","warning"," Warning: Code or name or punch code has exist.");
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
						url : webPath + "/position/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							position.loadposition();
							Loading.stop();
						}
					});
				}
			});
		},
		initSavePage : function(){

			$('#positionForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"code" : {
						required : true,
						minlength: 3
					},
					"name" : {
						required : true,
						minlength: 3
						
					}
				},


		        errorPlacement: function (error, element) { // render error placement for each input type
		            error.insertAfter(element); // for other inputs, just perform default behavoir
		            
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
		        	position.save();
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
		
		}
		
		
};


