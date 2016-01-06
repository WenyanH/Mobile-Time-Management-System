$(document).ready(function(){
	schedule.sort();
	
});
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
var schedule = {
		sort: function(){
			$("#schedule-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{
			    	orderable:false,//禁用排序
			    	targets:[7]   //指定的列
		    	}],
		    	bStateSave : true
		    });


		},

		loadschedule: function(){
			PageCtrl.load({
				url : webPath + "/schedule/list_nd",
				dom : "schedule-table",
				param : {
					
				},
				callback : function() {
					schedule.sort();
				}
			});
		},
		
		create : function() {
			
//			$.layer({
//                type: 1,
//                title : "Create a new schedule",
//                shadeClose: true,
//                area : [ '580px', '500px' ],
//                offset : [ '100px', '' ],
//                page: {
//                	url : webPath + '/schedule/create?pjax=true'
//                },
//                zIndex:2500
//            });
			window.location.href = webPath + '/schedule/create';
			
		},
		
		update : function(id){
//			
//			$.layer({
//                type: 1,
//                title : "Modify a schedule",
//                shadeClose: true,
//                area : [ '580px', '500px' ],
//                offset : [ '100px', '' ],
//                page: {
//                	url : webPath + '/schedule/update?pjax=true&id=' + id
//                },
//                zIndex:2500
//            });		
			window.location.href = webPath + '/schedule/update?id=' + id;
		},
		save : function(form,iscontinue){
			if ($("#alertMessage").html()!=""){$("#alertMessage").html("");}
			var clientEvents=$('#calendar').fullCalendar('clientEvents'); //返回数组
			if(clientEvents.length>0){
				for(var i=0;i<clientEvents.length;i++){
					var event=clientEvents[i];
					var start=new Date(event["start"]);
					var end=new Date(event["end"]);
					//alert(event["start"]+"  "+event["end"] +"   "+start.Format("yyyy-MM-dd hh:mm:ss")+"  "+end.Format("yyyy-MM-dd hh:mm:ss"));
					if(i==0){
						$("#eventIds").val(event["id"]);
						$("#eventTitles").val(event["title"]);
						$("#eventStarts").val(start.Format("yyyy-MM-dd hh:mm:ss"));
						$("#eventEnds").val(end.Format("yyyy-MM-dd hh:mm:ss"));
						$("#eventColors").val(event["color"]);
					}else{
						$("#eventIds").val($("#eventIds").val()+","+event["id"]);
						$("#eventTitles").val($("#eventTitles").val()+","+event["title"]);
						$("#eventStarts").val($("#eventStarts").val()+","+start.Format("yyyy-MM-dd hh:mm:ss"));
						$("#eventEnds").val($("#eventEnds").val()+","+end.Format("yyyy-MM-dd hh:mm:ss"));
						$("#eventColors").val($("#eventColors").val()+","+event["color"]);
					}
				}
			}
			$(form).attr('action', webPath + "/schedule/save");
			formTool.submitForm($(form),function(data){
				if (data.message=="success"){					
					argusAlertStrip("alertMessage","success"," Success");
					if(iscontinue){
						document.location.href = webPath + '/schedule/create';//history.back(-1);
					}else{						
						schedule.backList();
					}
				}else if (data.message == "exist"){
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
						url : webPath + "/schedule/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							schedule.loadschedule();
							Loading.stop();
						}
					});
				}
			});
		},
		saveAndContinue: function(){
			schedule.save($("#scheduleForm"),true);
		},
		backList: function(){
			document.location.href = webPath + '/schedule/list';
		},
		showfullcalendar: function(){
			Loading.start();
			PageCtrl.load({
				url : webPath + "/schedule/showfullcalendar?pjax=true",
				dom : "portlet-content",
				callback : function() {
					Loading.stop();
				}
			});
		},
		validateScheduleTime:function(addStart,addEnd){
			var clientEvents=$('#calendar').fullCalendar('clientEvents'); //返回数组
			if(clientEvents.length>0){
				for(var i=0;i<clientEvents.length;i++){
					var event=clientEvents[i];
					var start=new Date(event["start"]);
					var end=new Date(event["end"]);
					if(addStart.getTime()>start.getTime()&&addStart.getTime()<start.getTime()){
	    				return false;
	    			}
	    			if(addEnd.getTime()>end.getTime()&&addEnd.getTime()<end.getTime()){
	    				return false;
	    			}
				}
			}
			return true;
		},
		initSavePage : function(){

			$('#scheduleForm').validate({
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
					},
					"startDate" : {
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
		        	schedule.save(form,false);
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
			
			$("#startTime").datetimepicker({
				pickTime: false,
				format: "yyyy-MM-dd",
				pickerPosition : "left"
			});
			
			$("#periodType").select2({
				placeholder : "Select an option",
				allowClear : true
			});
			
			$("#diffPeriod").select2({
			    placeholder : "Select an option",
		        allowClear : true
			});
			
			$("#diffPeriod").bind("click", function(){
				switch($("#diffPeriod").val()){
				case "":
					$("#periodOffset").attr("disabled",true);
					$("#periodType").attr("disabled",false);
				break;
				default:
				$("#periodOffset").attr("disabled",false);
				$("#periodType").attr("disabled",true);
				
				}
			});				
		},
		
		onChangePeriod: function(){
			var viewType="agendaWeek";
			switch ($("#periodType").val()){
			case "Weekly":
				$("#period").val("1");
				$("#period").attr("readonly",true);		
				$("#days").val("7");
				$("#days").attr("readonly",true);
				viewType="agendaWeek";
			break;
			case "Fortnightly":
				$("#period").val("2");
				$("#period").attr("readonly",true);	
				$("#days").val("7");
				$("#days").attr("readonly",true);	
				viewType="agendaBiWeek";
			break;
			case "Daily":
				$("#period").val("1");
				$("#period").attr("readonly",true);	
				$("#days").val("1");
				$("#days").attr("readonly",true);	
				viewType="agendaDay";
			break;
			case "Custom":
				$("#period").val("1");
				$("#period").attr("readonly",false);	
				$("#days").val("3");
				$("#days").attr("readonly",false);	
				viewType="agendaDay";
			break;
			}
			//schedule.showfullcalendar();
		},
		
		periodMatch: function(){
			 
			PageCtrl.ajax({
				url : webPath + "/schedule/view",
				data : {
					id : $("#diffPeriod").val()			
				},
				dataType: "json",
				type : "post",
			    success : function(data) {
					Loading.stop();
					console.info(data);
					if (data.schedule!=null){
						$("#periodType").val(data.schedule.schedulePeriod).trigger("change");
	//					$("#periodOffset").val(data.schedule.periodOffset).trigger("change");
						$("#period").val(data.schedule.period).trigger("change");
						$("#days").val(data.schedule.days).trigger("change");
						$("#period").attr("disabled",true);	
						$("#days").attr("disabled",true);	
						
					}
						
				}											
						
			});
			
		}
};
		