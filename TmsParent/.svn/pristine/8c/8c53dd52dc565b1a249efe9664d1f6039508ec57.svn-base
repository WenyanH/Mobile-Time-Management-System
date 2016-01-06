<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<form class=" form-left2 form-horizontal">
<div class='row-fluid' style="width: 505px;padding: 10px">	
	<div id="dailysetting" class=" span12 box">
		<div class="control-group">
				<label class="control-label"> <span>Start Time：</span></label>
				<div class="controls">
					<input class="span12" name="dailytitle" type="time" id="starttime"
						value="00:00" style="width:100px" /><label style="display:inline"><input type="checkbox" id="prevDay">Previous Day</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"> <span>End Time：</span></label>
				<div class="controls">
					<input class="span12" name="dailytitle" type="time" id="endtime"
						value="00:00" style="width:100px"  /><label  style="display:inline"><input type="checkbox" id="nextDay">Next Day</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"> <span>Postion：</span></label>
				<div class="controls">
					<input id="departmentValue" type="text" readonly value="" class="span12 input_cursor_pointer" onclick="showMenu();" />
					<input name="department" id="department" type="hidden"  value="" class="span12"  />
				</div>
			</div>
	</div>
</div>
<div class="row-fluid" id="savesetionbutton">
			
		
		<button class="btn btn-warning pull-right" type="button" style="margin-right:10px;">
			<i class="icon-save"></i> <span>Save<!--Save--></span>
		</button>
	</div>
</form>



<script>

		var setting = {
			async: {
				enable: true,
				url:webPath + "/mydetail/tree?iscompany=false"
			},
			check: {
				enable: false,
				chkboxType: { "Y" : "s", "N" : "s" }
			},
			view: {
				showIcon: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick
			}
		};
		
		function onClick(e, treeId, treeNode) {
			
			 if (treeNode.structure!=0){
					return false;
				}
				var zTree = $.fn.zTree.getZTreeObj("tree_global"),
				nodes = zTree.getSelectedNodes(),
				n = "",
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					if(nodes[i].structure!='0'){
						argusAlertStrip("alertMessage","warning"," Warning: Only allows the selection of leaf nodest!");
						break;
					}
					n += nodes[i].name;
					v += nodes[i].id;
				}
				var departmentValue = $("#departmentValue");
				departmentValue.val(n);
				$("#department").val(v);
				if (treeNode.pId == null){
					$("#department").val(v);
				}
				hideMenu();
		}

		function showMenu() {
			var cityObj = $("#departmentValue");
			var cityOffset = $("#departmentValue").offset();
			//console.info({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"})
			$("#menuContent_global").css({"z-index":"9999", left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"});

			$("#menuContent_global").slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent_global").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "departmentValue" || event.target.id == "menuContent_global" || $(event.target).parents("#menuContent_global").length>0)) {
				hideMenu();
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#tree_global"), setting);
		});
			

$("#savesetionbutton").click(function(){
	if(sechedule.modifyworksection){
		sechedule.modifyworksection = {
			startTime:$("#starttime").val(),
			endTime:$("#endtime").val(),
			startTimeType:$("#prevDay").attr('checked') ? true:false,
			endTimeType:$("#nextDay").attr('checked') ? true:false,
			departmentId:$("#department").val(),
			departmentName:$("#departmentValue").val()
		}
		sechedule.modifySection();
	}else{
		sechedule.addSection($("#starttime").val(),$("#endtime").val(),$("#prevDay").attr('checked') ? true:false,$("#nextDay").attr('checked') ? true:false, $("#departmentValue").val(),$("#department").val());
	}
	

	$(".xubox_close").click();

})
		if(sechedule.modifyworksection){

			$("#starttime").val(sechedule.modifyworksection.startTime);
			$("#endtime").val(sechedule.modifyworksection.endTime);
			if(sechedule.modifyworksection.startTimeType == 'Previous'){
				$("#prevDay").attr('checked','checked');
			}
			if(sechedule.modifyworksection.endTimeType == 'NextDay'){
				$("#nextDay").attr('checked','checked');
			}
			$("#departmentValue[value='"+ sechedule.departmentValue + "']");
			$("#department[value='"+ sechedule.departmentId + "']");
			
		}	
</script>