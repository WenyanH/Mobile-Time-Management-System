<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<script>
	$(document).ready(function(){
		sendreport.initSavePage();
	});
	</script>
</head>
		
	<form id="sendreportForm" action='#' onsubmit="return false;" class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${sendreport.id}"/>
	<div class='row-fluid' style="height:365px">
			<div id="alertMessage"></div>
		
			
				
			   <div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="global.info.sendreport.reporttype" /></span>
					</label>
					<div class="controls">
						<select id="reportType" name="reportType" class="span12" data-placeholder=" " tabindex="1" >
						    <c:if test="${sendreport.id==null}">
							    <option value=""></option>													
								<c:forEach var="reporttypes" items="${reporttypes}">									
								<option value="${reporttypes}" >${reporttypes}</option>
								</c:forEach>
                            </c:if>
							<c:if test="${sendreport.id!=null}">
							    <option value="${sendreport.reportType}">${sendreport.reportType}</option>	 												
								
                            </c:if>
						</select>	
						
					</div>
				</div>	
			
			    <div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="global.info.sendreport.runattime" /></span>
					</label>
					<div class="controls input-append date" id="runatTime" data-date-format="yyyy-mm-dd hh:mm" style="display: block;">
										<input class="span10" name="runatTime" type="text" id="runatTime" value="<fmt:formatDate value="${sendreport.runTimeDisplay}" type="date" pattern="yyyy-mm-dd hh:mm"/>"/>
									    <span class='add-on' style="cursor: pointer;">
								           <i class='icon-calendar'></i>
								        </span>		
									</div>
				</div>

			   <div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="global.info.sendreport.sendto" /></span>
					</label>
					<div class="controls">
						<input class="span12" name="sendTo" type="text" id="sendTo" value="${sendreport.sendTo}" maxlength="40"/>
						
					</div>
				</div>		
				
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="global.info.sendreport.frequency" /></span>
					</label>
					<div class="controls">
						<input class="span12" name="sendFrequency" type="text" id="sendFrequency" value="<c:if test="${sendreport.sendFrequency==null}">1</c:if>${sendreport.sendFrequency}" maxlength="2"/>
						
					</div>
				</div>
				
					<div class="control-group">
					<label class="control-label">
					<span><fmt:message key="global.info.sendreport.parameter" /></span>
					</label>
					<div class="controls">
						<textarea id="parameter" name="parameter" rows="4" class='span12'>${sendreport.parameter}</textarea>
					</div>
				</div>	
				
				
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="global.info.sendreport.sendmodel" /></span>
					</label>
					<div class="controls">
						<input id="departmentValue" type="text" readonly value="${sendreport.departmentValue}" class="span12 input_cursor_pointer" onclick="showMenu();" />
						<input name="department" id="department" type="hidden"  value="${sendreport.department}" class="span12"  />
					</div>
				</div>
					
			 	
		</div>	
	

	<div class="row-fluid" id="savebutton">
		<c:if test="${sendreport.id==null}">
		<label class="checkbox inline">
			<input id="keepon" type="checkbox" value="" >
				<span><fmt:message key="global.info.keepon" /><!--Keep on creating a new item.--></span>
		</label>
		</c:if>
		<button class="btn btn-warning pull-right" type="submit">
			<i class="icon-save"></i> <span><fmt:message key="global.info.save" /><!--Save--></span>
		</button>
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
			sendreport.sort();
			 $.fn.zTree.init($("#tree_global"), setting);
			
		});

	
</script>	

<script src="<webpath:path/>/resources/default/js/tms/admin/sendreport/sendreport.js" type="text/javascript"></script>				