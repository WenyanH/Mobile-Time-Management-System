$(document).ready(function(){	
	$("select").select2({
		placeholder : "Select an option",
		allowClear : true
	});
});


var structure = {
		
		loadstructure: function(){
			//var ii = layer.load('loading...');
			PageCtrl.load({
				url : webPath + "/structure/list_nd",
				dom : "structure-table",
				param : {
					
				},
				callback : function() {
					
				}
			});
		},
		
		update : function(){
			argusConfirm("The node of company profiles has been changed. This operation is not recoverable，do you really want to save it?",function(result){
				if(result){
					if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        		
					
					var trdates = $(".structureTR");
					var datas = [];
					for(var i = 0; i < trdates.length; i++){
						var status = $(trdates[i]).find('#isActive');
						
						var isActive = false;
						if (status.attr("checked")=="checked"){
							isActive = true;
						}
						
						if ($(trdates[i]).find('#isActivePosition').length>0){
							isActive = true;
						}
						
						var date = {
								id : $(trdates[i]).find('#id').val(),
								labelName:$(trdates[i]).find('#labelName').val(),
								timeZone:$(trdates[i]).find('#timeZone').val(),
								isActive:isActive,
							}
						datas.push(date);
						
					}
					
					Loading.start();
					PageCtrl.ajax({
						url : webPath + "/structure/update",
						data : JSON.stringify(datas),
						dataType: "json",
						type : "post",
						contentType:"application/json",
						success : function(data) {
							Loading.stop();
							if (data.message=="success"){					
								argusAlertStrip("alertMessage","success"," Structure has been created successfully.");
							}else {
								argusAlertStrip("alertMessage","error"," Error");
							}
						}
					});
				}
			});
			return false;
		}
}