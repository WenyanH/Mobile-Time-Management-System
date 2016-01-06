
$(document).ready(function(){
	paycard.sort();
	$("#employeeId").select2({
		placeholder : "Select an option",
		allowClear : true
	});
});


var paycard = {
		changeEmployee : function(id){
			location.href = webPath + "/paycard/list?employeeId="+id;
		},
		sort: function(){
			$("#paycard-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{ 
			    	orderable:false,//禁用排序
			    	targets:[6]   //指定的列 
		    	}],
		    	bStateSave : true
		    });
		},
		loadpaycard: function(){
			PageCtrl.load({
				url : webPath + "/paycard/list_nd",
				dom : "paycard-table",
				param : {
				},
				callback : function() {
					paycard.sort();
				}
			});
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
						url : webPath + "/paycard/delete?ids="+ids,
						type : "post",
						dataType: "json",
						success : function(data) {
							paycard.loadpaycard();
							Loading.stop();
						}
					});
				}
			});
		}
};


