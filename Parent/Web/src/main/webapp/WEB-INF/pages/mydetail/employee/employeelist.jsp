<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="webpage" uri="/WEB-INF/tlds/pageview.tld"%>

<head>
<%@include file="../../changemenu.jsp"%>
<style>
	.dataTables_info{
	width:50%;
	float:left;
	}
	.dataTables_paginate{
		float:right;
	}
</style>
</head>
<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
				<span><fmt:message key="employeelist.info.employee" /><!--Employees--></span>		
			</div>
			
			<div class="pull-right"> 	
					<button class="btn btn-success" onclick="employee.switchdisplay();" title="Show List/card"><i class=" icon-align-justify"></i> / <i class=" icon-credit-card "></i></button>
					<div class="btn-group">
						
						<button class="btn btn-success" id="searchEmployee" href="#" data-toggle="dropdown">
						<i class="icon-search"></i> 
						Search
						<i class="icon-angle-down"></i>
						</button>
						<div class="dropdown-menu hold-on-click  pull-right">
							<form id="searchEmployeeForm" action='#' onsubmit="return false;" class="form form-horizontal form-left" style="margin: 5px;width:300px;" method="post" accept-charset="UTF-8">	
								<div class='row-fluid'>
									<div class='span12'>
										<div class="control-group">
											<label class="control-label">Status : <!--lastName:--></label>
											<div class="controls">
												<select id="userStatus" name="userStatus" class="span12" data-placeholder=" " tabindex="1" >
													<option value=""></option>
													<c:forEach var="employeeStatus" items="${employeeStatus}">									
														<option value="${employeeStatus}" >${employeeStatus}</option>
													</c:forEach>
												</select>							
											</div>
										</div>
									</div>
								</div>
								<div class='row-fluid'>
									<div class='span12'>
										<div class="control-group">
											<label class="control-label">Department : <!--lastName:--></label>
											<div class="controls">
												<input id="departmentValue" type="text" readonly value="${department.parent.departmentName}" class="span12 input_cursor_pointer" onclick="showMenu();" />
												<input name="department" id="department" type="hidden"  value="${department.parent.id}" class="span12"  />
												<%-- <select id="department" name="department" class="span12" data-placeholder=" " tabindex="1">
													<option value=""></option>
													<c:forEach var="department" items="${departmentList}">
													<option value="${department.id}" >${department.departmentName}</option>
													</c:forEach>
												</select> --%>
											</div>
										</div>
									</div>
								</div>
								<div class='row-fluid'>	
									<div class="control-group">	
										<div class="pull-right"> 	
							            	<button id="searchEmployee" class="btn btn-success" onclick="employee.search();"><i class="icon-ok"></i> 
							            	<span>OK</span>
							            	</button>
										</div>
									</div>
									
								</div>
							</form>	
						</div>
					</div>
	            	<button id="inplaceediting-enable" class="btn btn-success" onclick="employee.create();"><i class="icon-plus "></i> 
	            	<span><fmt:message key="global.info.new" /><!--New--></span>
	            	</button>
	            	<button style="display:none" id="employee_delete_list" class="btn btn-danger" onclick="employee.remove();"><i class="icon-trash"></i> 
					<span><fmt:message key="global.info.delete" /><!--Delete--></span>
					</button>
					
			</div>
		</div>
	</div>
</div>
<div id="alertMessage"></div>	
<div id="employee-content">
<div id="employee-table" style="display:none">
	<div class="row-fluid resource">
		<div class="gallery">
			<ul class="unstyled inline" >
				<c:forEach var="user" items="${users}">
				<li class="picture_li" style="padding-right:0px; padding-left:10px;width:299px">
				    <div class="picture has-popover" data-title="${user.firstName} ${user.lastName}" data-toggle="popover"  data-placement="top"
				     data-content='
				     		<table>
				     			<tr>
				     				<td>Hire On Date:</td>
				     				<td>${user.hireOnDateValue} </td>
				     			</tr>
				     			<tr>
				     				<td>Terminate Date:</td>
				     				<td>${user.terminateDateValue}</td>
				     			</tr>
				     		
				     		</table>
				     	
			
				     ' data-html="true">
				    	<img src="<webpath:path/>/resources/default/images/blank.gif" style="width: 100%; height: 160px;"/>
					    	
				    	<c:if test="${user.photo==null||user.photo==''}">
				    	<img src="<webpath:path/>/resources/default/images/user.png" class="res-icon-60" style="width: 60px;"/>
				    	</c:if>
				    	
				    	<c:if test="${user.photo!=null&&user.photo!=''}">
				    	<img src="data:image/png;base64,${user.photo}" style="width: 60px;" class="res-icon-60"/>
				    	</c:if>
				    	
				    	<div class="contents">
				    		<div class="title">	
				    			<span title="${user.firstName} ${user.lastName}">${user.firstName} ${user.lastName}</span>
				    		</div>
				    		<div class="desc row-fluid">
				    			<div class="span9" style="">
									<div class="row-fluid">
										<small> 
											<i class="icon-envelope-alt "></i> ${user.email}
										</small>
									</div>
									<div class="row-fluid">
										<small> 
											<i class="icon-tag"></i> ${user.departmentName}
										</small>
									</div>
								</div>
				    		</div>
				    	</div>
					    	
				        <div class="tags">
				        	
				            <div class="label label-success">${user.jobNumber}</div>
				            <%-- <div class="label label-warning ">${user.roleName}</div> --%>
				            <c:if test="${user.isSupervisor}">
				            <div class="label label-info">Is Supervisor</div>
				            </c:if>
				            <c:if test="${user.isExport}">
				            <div class="label label-info">Is Export</div>
				            </c:if>
				          
							<c:if test="${user.status=='Active'}">
							<span class="label label-success">${user.status}</span>
							</c:if>
							<c:if test="${user.status=='Closed'}">
							<span class="label label-important">${user.status}</span>
							</c:if>
							<c:if test="${user.status=='Inactive'}">
							<span class="label label-warning">${user.status}</span>
							</c:if>
				        </div>
				        
				        <div class="actions">
				            <div class="text-center">
				            	
				            	
				            	<a class="btn btn-link" onclick="employee.updateStatus('${user.employeeId}')">
				                    <i class=" icon-lightbulb "></i>
				                    Status
				                </a>
					            
				                <a class="btn btn-link" onclick="employee.update('${user.employeeId}')">
				                    <i class="icon-edit "></i>
				                    Edit
				                </a>
				                <a class="btn btn-link" onclick="employee.remove('${user.employeeId}')">
				                    <i class="icon-trash"></i>
				                    Remove
				                </a>
				                  <a class="btn btn-link"  onclick="employee.leaves('${user.employeeId}')" > 
												<i class="icon-pencil "></i> 
												Leaves											
								</a>
								<a class="btn btn-link"  onclick="employee.paycard('${user.employeeId}')" > 
												<i class="icon-pencil "></i> 
												Pay card											
								</a>
				            </div>
				        </div>
				        
				       
				    </div>
				</li>
				</c:forEach>  
			</ul>
		</div>
	</div>
</div>
<div id="employee-list" style="display:none">
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="employee-table-sort"  style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck"><input type="checkbox" class="checkall"/></th>
									<th width="">
									<span><fmt:message key="employeelist.info.no" /><!--No.--></span></th>
									<th width="">
									<span><fmt:message key="employeelist.info.firstname" /><!--First Name--></span></th>									
									<th width="">
									<span><fmt:message key="employeelist.info.lastname" /><!--Last Name--></span></th>
									<th width="">
									<span><fmt:message key="employeelist.info.middlename" /><!--Middle Name--></span></th>									
									<th width="">
									<span><fmt:message key="employeelist.info.department" /><!--Department--></span></th>
									
									<th width="">
									<span><fmt:message key="employeelist.info.hireondate" /><!--Hire On Date--></span></th>
									<th width="">
									<span><fmt:message key="employeelist.info.terminatedate" /><!--Terminate Date--></span></th>
									<th width="">
									<span><fmt:message key="global.info.status" /><!--Status--></span></th>			
									<th width="">
									<span><fmt:message key="employeelist.info.issupervisor" /><!--Is Supervisor--></span></th>
									<th width="">
									<span><fmt:message key="employeelist.info.isexport" /><!--Is Export--></span></th>			
									<th width="">
									<span><fmt:message key="employeelist.info.mobile" /><!--Mobile--></span></th>			
									<th width="">
									<span><fmt:message key="employeelist.info.phone" /><!--Phone--></span></th>			
									<th width="">
									<span><fmt:message key="employeelist.info.fax" /><!--Fax--></span></th>	
									<th width="">
									<span><fmt:message key="employeelist.info.clockid" /><!--Clock ID--></span></th>	
									<th width="">
									<span><fmt:message key="employeelist.info.payid" /><!--Pay ID--></span></th>	
									<th width="">
									<span><fmt:message key="employeelist.info.paygroup" /><!--Pay Group--></span></th>	
									<th width="">
									<span><fmt:message key="employeelist.info.timerounding" /><!--Time Rounding--></span></th>			
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --> 
									</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td><input type="checkbox" name="id" value="${user.employeeId}" /></td>
									<td>${user.jobNumber}&nbsp;</td>
									<td>${user.firstName}&nbsp;</td>	
									<td>${user.lastName}&nbsp;</td>
									<td>${user.middleName}&nbsp;
									<c:if test="${user.middleName==''||user.middleName==null}">
						            -</c:if>
									</td>
									<td>${user.departmentName}&nbsp;</td>
									
									<td>${user.hireOnDateValue}&nbsp;</td>
									<td>${user.terminateDateValue}&nbsp;</td>		
									<td>
										<c:if test="${user.status=='Active'}">
										<span class="label label-success">${user.status}</span>
										</c:if>
										<c:if test="${user.status=='Closed'}">
										<span class="label label-important">${user.status}</span>
										</c:if>
										<c:if test="${user.status=='Inactive'}">
										<span class="label label-warning">${user.status}</span>
										</c:if>
										<a href="javascript:;" onclick="employee.updateStatus('${user.employeeId}')" class=""> 
											<i class="icon-pencil "></i> 											
										</a> 
									</td>				
									<td style="text-align:center"> 
									<c:if test="${user.isSupervisor}"><i class="icon-check"></i></c:if>
									<c:if test="${!user.isSupervisor}"><i class="icon-check-empty "></i></c:if> 		
									</td>
									<td style="text-align:center"> 
									<c:if test="${user.isExport}"><i class="icon-check"></i></c:if>
									<c:if test="${!user.isExport}"><i class="icon-check-empty "></i></c:if> 
									</td>															
									<td>${user.mobile}&nbsp;
									<c:if test="${user.mobile==''||user.mobile==null}">
						            -</c:if>
						            </td>
									<td>${user.phone}&nbsp;
									<c:if test="${user.phone==''||user.phone==null}">
						            -</c:if>
						            </td>
									<td>${user.fax}&nbsp;
									<c:if test="${user.fax==''||user.fax==null}">
						            -</c:if>
						            </td>
									<td>${user.clockId}&nbsp;</td>
									<td>${user.payId}&nbsp;
									<c:if test="${user.payId==''||user.payId==null}">
						            -</c:if>
									</td>	
									<td>${user.payGroupName}&nbsp;</td>
									<td>${user.timeRoundingName}&nbsp;
									<c:if test="${user.timeRoundingName==''||user.timeRoundingName==null}">
						            -</c:if>
									</td>
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="employee.update('${user.employeeId}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> 
												<span><fmt:message key="global.info.edit" /><!--Edit--></span>												
											</a> 
											
											
											<a href="javascript:;" onclick="employee.createleave('${user.employeeId}')" class="btn btn-warning btn-mini"> 
												<i class="icon-plus"></i> 
												<span>Leave</span>												
											</a>
											<a href="javascript:;" onclick="employee.leaves('${user.employeeId}')" class="btn btn-warning btn-mini"> 
												<i class="icon-bell "></i> 
												<span>Leaves</span>												
											</a>
											<a href="javascript:;" onclick="employee.paycard('${user.employeeId}')" class="btn btn-warning btn-mini"> 
												<i class=" icon-credit-card  "></i> 
												<span>Pay card</span>												
											</a>
										</div>
									</td>
								</tr>
								</c:forEach> 
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

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
			employee.sort();
			$("#userStatus").select2({
				placeholder : "Select an option",
				allowClear : true
			});
			$.fn.zTree.init($("#tree_global"), setting);
			employee.display();
		});

	
</script>	
<script src="<webpath:path/>/resources/default/js/tms/mydetail/employee/employee.js" type="text/javascript"></script>


