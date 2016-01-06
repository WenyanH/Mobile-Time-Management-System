<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="webpage" uri="/WEB-INF/tlds/pageview.tld"%>

<head>
<%@include file="../../changemenu.jsp"%>

</head>

<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
			<span>Recalculate</span>
			</div>
			
		</div>
	</div>
</div>
<form id="timeCard" action='#' onsubmit="return false;" class="form form-horizontal" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
<div id="alertMessage"></div>	
<div id="report-table">
	<div class="row-fluid report-icon" >
		<div class="span12">
			<div id="" class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i>
						<span>Recalculate Employee Schedule</span>
					</div>
				</div>
				<div class="portlet-body">
					<div class="row-fluid">
						<div class="span9">
							<div class="control-group">
								<label class="control-label"> <span>Date Range:</span></label>
								<div class="controls input-append date" id="datePerf" style="display: block;">
									<input class="span12" name="datePeriod" type="text" id="datePeriod" value=""/>
									<input class="span12" name="startDate" type="hidden" id="startDate" value=""/>
									<input class="span12" name="endDate" type="hidden" id="endDate" value=""/>
								    
								</div>
								
							</div>
							
							<div class="control-group">
								<label class="control-label"> <span>Update Range:</span></label>
								<div class="controls">
									<select id="updateRange" class="span12" data-placeholder=" " tabindex="1">
										<option value="">Company</option>
										<option value="">Company Nodes</option>
										<option value="">Employees</option>
									</select>
								</div>
								
							</div>
							
							<div class="control-group">
								<label class="control-label"> <span>Company Nodes:</span></label>
								<div class="controls">
									<input id="departmentValue" type="text" readonly  class="span12 input_cursor_pointer" onclick="showMenu();" />
									<input name="department" id="department" type="hidden"   class="span12"  />
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"> <span>Employees:</span></label>
								<div class="controls">
									<select name="employees" id="employees" multiple="multiple" class="" >
										 <c:forEach var="employees" items="${employees}" varStatus="status">
											<option value="${employees.id}">${employees.firstName},${employees.lastName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="row-fluid text-center"  id="savebutton">
		
		
		<button class="btn btn-warning" type="submit">
			<i class=" icon-lightbulb "></i> <span>Recalculate</span>
		</button>
		
	    
	
		</div>
		
	</div>
		
		
		
</div>

</form>
	<script type="text/javascript">

		var setting = {
			async: {
				enable: true,
				url:webPath + "/mydetail/tree?iscompany=false"
			},
			check: {
				enable: true,
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
				beforeClick: beforeClick,
				onCheck: onCheck
			}
		};

		
		function beforeClick(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree_global");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree_global"),
			nodes = zTree.getCheckedNodes(true),
			n = "",
			v = "";
			for (var i=0, l=nodes.length; i<l; i++) {
				n += nodes[i].name + ",";
				v += nodes[i].id + ",";
			}
			if (n.length > 0 ) n = n.substring(0, n.length-1);
			//if (v.length > 0 ) v = v.substring(0, v.length-1);
			var obj = $("#departmentValue");
			 $("#departmentValue").val(n);
			 $("#department").val(v);
		}

		function showMenu() {
			var cityObj = $("#departmentValue");
			var cityOffset = $("#departmentValue").offset();
			console.info({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"})
			$("#menuContent_global").css({"z-index":"9999", left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"});
			$("#tree_global").width($("#departmentValue").width()-2);
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
			$("#updateRange").select2({
				placeholder : "Select an option",
				allowClear : true
			});
			
			$('#employees').multiselect({
				  checkAllText: 'All',
			      uncheckAllText: 'Uncheck',
			      noneSelectedText: "Please select",//'请选择节点'
			      selectedText: "# selected",//'已经选中 # 个节点'
			      classes:"",
			      minWidth:"300px;"

			 }).multiselectfilter({
				  label: "Search",//'搜索:'
			      width: "90",  //override default width set in css file (px). null will inherit 
			      placeholder: '',
			      autoReset: true
				 
			 });
			
			$.fn.zTree.init($("#tree_global"), setting);
			
			
			$("#datePerf").daterangepicker({
		    	timePicker: true, 
		    	timePicker12Hour: false,
		    	timePickerIncrement: 30, 
		    	format: 'YYYY-MM-DD h:mm A',
		    	locale: {
		            firstDay: 1
		        },
		        opens: 'left'
		    }, function(start, end) {
		    	$("#startDate").val(start.format("YYYY-MM-DD"));
		    	$("#endDate").val(end.format("YYYY-MM-DD"));
		        return $("#datePeriod").val(start.format("YYYY-MM-DD") + " to " + end.format("YYYY-MM-DD"));
		    });
		});

	
</script>	