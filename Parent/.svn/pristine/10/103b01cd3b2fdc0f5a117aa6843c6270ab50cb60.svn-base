<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
<link href="<webpath:path/>/resources/default/css/search.css"
	rel="stylesheet" type="text/css" />
<style>
.check {
	height: auto;
	width: auto;
	display: block;
}
</style>

<div id="alertMessage"></div>


<div class="tabbable">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#tab1" data-toggle="tab">
                <i class=" icon-reorder "></i>
                Base Info
            </a>
        </li>
        <li id="employee-tab">
            <a href="#tab2" data-toggle="tab">
                <i class="icon-group"></i>
                Employees
            </a>
        </li>
        
    </ul>
    <div class="tab-content">
        <div id="tab1" class="tab-pane active">
            <form id="divisionForm" action="" class="form form-horizontal"  style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	           <input  name="id" type="hidden" id="id" value="${department.id}"/> 
	           <input  type="hidden" id="companyStructure"  value="${department.companyStructure.level.level}"/> 
	           <div class='row-fluid'>
	           		<div class="span6">
	           			<div class="control-group">
							<label class="control-label"><span><font color="red">*</font><fmt:message key="divisioninfo.info.no." /><!--No.:--></span></label>
							<div class="controls">
								<input name="number" type="hidden"  value="${department.number}"/> 
								<span class="help-inline">${department.number}</span>
							</div>
						</div>
	           		</div>
	           		
	           		<div class="span6">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="divisioninfo.info.status" /><!--Status:--></span></label>
							<div class="controls">
								<label class="checkbox inline">
									<input type="checkbox"  name="status"  <c:if test="${department.status}">checked="checked"</c:if>/>Active
								</label>
							</div>
						</div>
	           		</div>
	           </div>
	           
	           <div class='row-fluid'>
	           		<div class="span6">
	           			<div class="control-group">
							<label class="control-label"><span><font color="red">*</font>${structureName} <fmt:message key="divisioninfo.info.name" /><!--Name:--></span></label>
							<div class="controls">
								<input class="span12" name="departmentName" type="text" id="" value="${department.departmentName}" />
							</div>
						</div>
	           		</div>
	           		<div class="span6">
	           			
						<div class="control-group">
							<label class="control-label"><span>Parent:</span></label>
							<div class="controls">
								<input id="parentValue" type="text" readonly value="${department.parent.departmentName}" class="span12 input_cursor_pointer" onclick="showMenu();" />
								<input name="parent" id="parent" type="hidden"  value="${department.parent.id}" class="span12"  />
							</div>
						</div>
	           		</div>
	           </div>
	           
	           <hr class="hr-normal">
	           
	           <%-- <div class='row-fluid'>
	           		<div class="span6">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.paygroup" /><!--Pay Group:--></span></label>
							<div class="controls">
								<select id="paygroup" name="paygroupId" class="span12" data-placeholder=" " tabindex="1" >
									<option value=""></option>
									<c:forEach var="payGroup" items="${payGroups}">
												<option value="${payGroup.id}" <c:if test="${payGroup.id==payGroupId}">selected='selected'</c:if>>${payGroup.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div>
	           		<div class="span6">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.jobcode" /><!--Job Code:--></span></label>
							<div class="controls">
								<select  class="span12" name="jobId" data-placeholder=" " tabindex="2" >
									<option value=""></option>
									<c:forEach var="job" items="${jobs}">
												<option value="${job.id}" <c:if test="${job.id==jobId}">selected='selected'</c:if>>${job.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div>
	           </div> --%>
	           
	           <div class='row-fluid'>
	           		<div class="span6">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.schedule" /><!--Schedule:--></span></label>
							<div class="controls">
								<select  class="span12" data-placeholder=" " tabindex="3" >
									<option value=""></option>
								</select>
							</div>
						</div>
	           		</div>
	           		<%-- <div class="span6">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.position" /><!--Position:--></span></label>
							<div class="controls">
								<select  class="span12" name="positionId" data-placeholder=" " tabindex="4" >
									<option value=""></option>
									<c:forEach var="position" items="${positions}">
												<option value="${position.id}" <c:if test="${position.id==positionId}">selected='selected'</c:if>>${position.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div> --%>
	           </div>
	           
	           <div class='row-fluid'>
	           		<div class="span6">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.timerounding" /><!--Time Rounding:--></span></label>
							<div class="controls">
								<select  class="span12" name="timeRoundingId" data-placeholder=" " tabindex="5" >
									<option value=""></option>
									<c:forEach var="timeRounding" items="${timeRoundings}">
												<option value="${timeRounding.id}" <c:if test="${timeRounding.id==timeRoundingId}">selected='selected'</c:if>>${timeRounding.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div>
	           		<div class="span6">
	           		
	           		</div>
	           </div>
            
            	<div class="text-center row-fluid " id="savebutton" style="display: ;">
					<button class="btn btn-warning" id="saveDiscovery" type="button" onclick="save()">
						<i class="icon-save "></i>
						<span><fmt:message key="global.info.save" /><!--Save--></span>
					</button>
				</div>
            </form>
        </div>
        <div id="tab2" class="tab-pane">
        </div>
        
    </div>
</div>




<script>
	
	function save(){
		Loading.start();
		$("#divisionForm").attr('action', webPath + "/department/save");
		formTool.submitForm($("#divisionForm"),function(data){
			Loading.stop();
			if (data.message=="success"){
				$("#tree").html("");
				department.initTree();
			}else if (data.message == "existName"){
				argusAlertStrip("alertMessage","warning"," Warning: Department  Name is exist.");
			}else if (data.message == "existNumber"){
				argusAlertStrip("alertMessage","warning"," Warning: Department  NO. is exist.");
			}
			else {
				argusAlertStrip("alertMessage","error"," Error");
			}
		});
	}
	
	var setting = {
			async: {
				enable: true,
				url:webPath + "/mydetail/tree"
			},
			view: {
				dblClickExpand: false,
				showIcon: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: beforeClick,
				onClick: onClick
			}
		};

		function beforeClick(treeId, treeNode) {
			var currentId= "${department.id}";
			
			if (treeNode.id==currentId){
				argusAlert("The current node cannot be the parent node.");
				return false;
			}
			
		}
		
		function onClick(e, treeId, treeNode) {
			var currentId= "${department.id}";
			PageCtrl.ajax({
				url : webPath + "/department/ischoose",
				data : {
					id : currentId,
					parentId : treeNode.id
				},
				dataType: "json",
				type : "post",
				success : function(data) {
					if (data.message=="error"){
						hideMenu();
						argusAlert("Cannot use the sub node for parent node.");
						var zTree = $.fn.zTree.getZTreeObj("tree_global");
						var node = zTree.getNodeByParam("id", $("#parent").val(), null);
						zTree.selectNode(node);
						return false;
					}else{
						//var currentId= "${department.id}";
						var zTree = $.fn.zTree.getZTreeObj("tree_global"),
						nodes = zTree.getSelectedNodes(),
						n = "",
						v = "";
						nodes.sort(function compare(a,b){return a.id-b.id;});
						for (var i=0, l=nodes.length; i<l; i++) {
							n += nodes[i].name;
							v += nodes[i].id;
						}
	
						var parentObj = $("#parentValue");
						parentObj.val(n);
						$("#parent").val(v);
						if (treeNode.pId == null){
							$("#parent").val("");
						}
						hideMenu();
					}
				}
			});
		}
	
		function showMenu() {
			
			if ("${department.parent.id}" == $("#parent").val()){
				var zTree = $.fn.zTree.getZTreeObj("tree_global");
				var node = zTree.getNodeByParam("id", $("#parent").val(), null);
				zTree.selectNode(node);
			}
			
			
			
			var parentObj = $("#parentValue");
			var parentOffset = $("#parentValue").offset();
			$("#menuContent_global").css({left:parentOffset.left + "px", top:parentOffset.top + parentObj.outerHeight() + "px"}).slideDown("fast");
			$("#tree_global").width(parentObj.width()-2)
			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent_global").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent_global" || $(event.target).parents("#menuContent_global").length>0)) {
				hideMenu();
			}
		}
		
		
		
		$(document).ready(function() {
			$("select").select2({
				placeholder : "Select an option",
				allowClear : true
			});
			$.fn.zTree.init($("#tree_global"), setting);
			var level=$("#companyStructure").val();
			if(level=='0'){
				PageCtrl.load({
					url : webPath + "/employee/departlist_nd?department=${department.id}",
					dom : "tab2",
					callback : function() {
						Loading.stop();
						employeeSearch.sort();
					}
				});
			}else{
				$("#employee-tab").hide();
			}
			
		});
		
		
</script>