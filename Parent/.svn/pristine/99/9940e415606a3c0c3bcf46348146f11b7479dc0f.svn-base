$(document).ready(function(){
	calculationscriptlog.sort();
	
});
var calculationscriptlog = {
		sort: function(){
			$("#calculationscriptlog-data-table").dataTable({
		        bAutoWidth : true,
		        columnDefs:[{
			    	orderable:false,//禁用排序
			    	targets:[5]   //指定的列
		    	}],
		    	bStateSave : true
		    });
		},
		showlog : function(id){
			window.location.href = webPath + '/calculationscript/showlog?id=' + id;
		}
}
		