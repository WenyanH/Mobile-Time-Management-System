
$(document).ready(function(){
	
});

var department = {
		initTree : function(){
			PageCtrl.ajax({
				url : webPath + "/mydetail/tree",
				type : "post",
				dataType : "json",
				success : function(data) {
					var treeObj = $.fn.zTree.init($("#tree"), department.treeSetting(), data);
					
					if ($("#node").val()!=""){
						var node = treeObj.getNodeByParam("id", $("#node").val(), null);
						treeObj.selectNode(node);
					}else{
						var nodes = treeObj.getNodes();
						if (nodes.length>0) {
							treeObj.selectNode(nodes[0]);
						}
					}
					
				}
			});
			
		},
		treeSetting : function(){
			var setting = {
					view: {
						showIcon: false,
						addHoverDom: function(treeId, treeNode){
							var sObj = $("#" + treeNode.tId + "_span");
							if ($("#addBtn_"+treeNode.tId).length>0) return;
							if ($("#removeBtn_"+treeNode.tId).length>0) return;
							
							var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='add node' onfocus='this.blur();'></span>";
							var removeStr = "<span class='button remove' id='removeBtn_" + treeNode.tId + "' title='remove' onfocus='this.blur();'></span>";
							if (treeNode.pId!=0&&treeNode.pId!=null){
								sObj.after(removeStr);
								var removebtn = $("#removeBtn_"+treeNode.tId);
								if (removebtn) removebtn.bind("click", function(){
									argusConfirm("Please confirm  remove.",function(result){
										if (result){
											PageCtrl.ajax({
												url : webPath + "/department/delete?ids=" + treeNode.id,
												type : "post",
												dataType : "json",
												success : function(data) {
													if (data.message == "success") {
														department.initTree();
														argusAlertStrip("alertMessage", "success", " ok.");
													} else if (data.message == "children") {
														argusAlertStrip("alertMessage", "warning"," Warning: Please delete the child nodes.");
													}
												}
											});
										}
									})
									return false;
								});
							}
							
							if (treeNode.structure!=0){
								sObj.after(addStr);
								var addbtn = $("#addBtn_"+treeNode.tId);
								if (addbtn) addbtn.bind("click", function(){
									department.create(treeNode.id);
									return false;
								});
							}

						},
						removeHoverDom: function(treeId, treeNode){
							if (treeNode.structure!=0){
								$("#addBtn_"+treeNode.tId).unbind().remove();
							}
							if (treeNode.pId!=0&&treeNode.pId!=null){
								$("#removeBtn_"+treeNode.tId).unbind().remove();
							}
						}
					},
					data: {
						simpleData: {
							enable: true
						}
					},
					
					callback: {
						onClick: function (event, treeId, treeNode, clickFlag) {
							if(treeNode.pId==null){
								department.companyInfo(treeNode.id);
							}else{
								department.divisionInfo(treeNode.id);
								$("#node").val(treeNode.id);
							}
						}
					}
				};
			
			return setting;
		},
		create : function(id) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			var node = zTree.getSelectedNodes();
			console.info(node[0].id);
			$.layer({
                type: 1,
                title : "Create a new node",
                shadeClose: true,
                area : [ '500px', '340px'],
                offset : [ '80px', '' ],
                page: {
                	url : webPath + '/department/create?pjax=true&id='+id
                },
                zIndex:2500
            });
			
			
		},
		save : function(form){
			if ($("#alertDepartmentMessage").html()!="")
        		$("#alertDepartmentMessage").html("")
			Loading.start();
			$(form).attr('action', webPath + "/department/save");
			formTool.submitForm($(form),function(data){
				Loading.stop();
				if (data.message=="success"){
					if ($("#keepon").attr("checked") == "checked"){
						$(":text").val("");
					} else {
						$(".xubox_close").click();
					}
					$("#tree").html("");
					department.initTree();
				}else if (data.message == "existName"){
					argusAlertStrip("alertDepartmentMessage","warning"," Warning: Department  Name is exist.");
				}else if (data.message == "existNumber"){
					argusAlertStrip("alertDepartmentMessage","warning"," Warning: Department  NO. is exist.");
				}
				else {
					argusAlertStrip("alertDepartmentMessage","error"," Error");
				}
			});
			return false;
		},
		companyInfo : function(){
			Loading.start();
			PageCtrl.load({
				url : webPath + "/mydetail/companyinfo_nd",
				dom : "portlet-content",
				callback : function() {
					Loading.stop();
				}
			});
		},
		divisionInfo : function(id) {
			Loading.start();
			PageCtrl.load({
				url : webPath + "/department/divisioninfo_nd?departmentId=" + id,
				dom : "portlet-content",
				callback : function() {
					Loading.stop();
				}
			});
		},
		initSavePage : function(){

			$('#departmentForm').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"number" : {
						required : true
					},
					"departmentName" : {
						required : true
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
		        	department.save(form);
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertDepartmentMessage").html()!="")
		        		$("#alertDepartmentMessage").html("")
		        }

			});
			
			/*$("#companyStructure").select2({
				placeholder : "Select an option",
				allowClear : true
			});
			*/
			
			$("#scheduleId").select2({
				placeholder : "Select an option",
				allowClear : true
			});
		
			
			$("#timeRoundingId").select2({
				placeholder : "Select an option",
				allowClear : true
			});
		
		}
		
		
};
