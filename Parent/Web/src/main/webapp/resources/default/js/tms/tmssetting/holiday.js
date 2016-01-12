$(document).ready(function(){	
	holiday.sort();	
});


var holiday = {
		
		sort: function(){
			$("#holiday-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{ 
			    	orderable:false,//禁用排序 
			    	targets:[5]   //指定的列 
		    	}],
		    	bStateSave : true
		    });
			
			
		},
		
		loadholiday: function(){

			//var ii = layer.load('loading...');
			PageCtrl.load({
				url : webPath + "/holiday/list_nd",
				dom : "holiday-table",
				param : {
					
				},
				callback : function() {
					holiday.sort();
				}
			});
		},
		create : function() {
			$.layer({
                type: 1,
                title : "Create a new holiday",
                shadeClose: true,
                area : [ '525px', '290px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/holiday/create?pjax=true'
                },
                zIndex:2500
            });
			
		},
		update : function(id){
			
			$.layer({
                type: 1,
                title : "Modify a holiday",
                shadeClose: true,
                area : [ '525px', '290px' ],
                offset : [ '100px', '' ],
                page: {
                	url : webPath + '/holiday/update?pjax=true&id=' + id
                },
                zIndex:2500
            });
			
			
		},
		save : function(){
			if ($("#alertMessage").html()!="")
        		$("#alertMessage").html("")
        		
			var id = $("#id").val();
			var name = $("#name").val();
			var date = $("#date").val();
			var alterdate = $("#alterdate").val();						
			var d = new Date(date);
			var month=d.getMonth()+1;		
			if(month<10)
			{month="0"+month;}	
			var day=d.getDate();
			if(day<10)
			{day="0"+day;}
			var code = d.getFullYear() +"" + month + "" +day ;
			
			Loading.start();
			PageCtrl.ajax({
				url : webPath + "/holiday/save",
				data : {
					id : id,
					code : code,
					name : name,
					date : date,
					alterdate : alterdate
				},
				dataType: "json",
				type : "post",
				success : function(data) {
					Loading.stop();
					if (data.message=="success"){					
						argusAlertStrip("alertMessage","success"," Holiday has been created successfully.");
						
						if ($("#keepon").length>0){
							holiday.loadholiday();
							if ($("#keepon").attr("checked") == "checked"){
								$(":text").val("");
							} else {
								$(".xubox_close").click();
							}
						} else {
							holiday.loadholiday();
							$(".xubox_close").click();
						}
						
					}else if (data.message == "exist"){
						$("#holidayForm").closest('.help-inline').removeClass('ok');
						argusAlertStrip("alertMessage","warning"," Warning: Date has existed .");
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
						url : webPath + "/holiday/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							holiday.loadholiday();
							Loading.stop();
						}
					});
				}
			});
		},
		initSavePage : function(){
			
			$('#holidayForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"name" : {
						required : true,
						minlength: 3					
					},
					"date" : {
						required : true
					},
					"alterdate" : {
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
		        	holiday.save();
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});



			$("#datetime").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd"
			});
			$("#alterdatetime").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd"
			});
			
			
		}
		
		
};


