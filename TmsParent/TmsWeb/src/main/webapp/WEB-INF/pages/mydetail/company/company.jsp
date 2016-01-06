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
<script>
	$(document).ready(function() {
		department.initTree();
		department.companyInfo();
	});
	function createEmployee(){
		var id=$("#node").val();
		if(id!=""){
			employee.create(id);
		}
	}
</script>
<%@include file="../../changemenu.jsp"%>
</head>

<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
				<span><fmt:message key="company.info.company" /><!--Company Profiles--></span>
			</div>
			<div class="pull-right"> 
			<%-- <c:forEach var="c" items="${companyStructureList}">
				<button id="inplaceediting-enable" class="btn btn-success" onclick="department.create();"><i class="icon-plus "></i> 
	            	<span><fmt:message key="global.info.new" /><!--New--> ${c.labelName}</span>
	            </button>
						
			</c:forEach> --%>
				
			</div>
		</div>
	</div>
</div>
<div id="alertMessage"></div>
<div class='row-fluid'>
				<div class="span3 ">

						<!-- BEGIN Portlet PORTLET-->

						<div class="portlet box green">

							<div class="portlet-title">

								<div class="caption"><i class="icon-sitemap "></i><fmt:message key="company.info.companynodes" /><!--Company Nodes--></div>
							</div>

							<div class="portlet-body">
								<div class='row-fluid'>
									<div class='span12 box'>
							            <div id="tree" class="ztree">
							            </div>
								    </div>
								    
								</div>

							</div>

						</div>

						<!-- END Portlet PORTLET-->

					</div>
					
					
					<div class="span9 ">

						<!-- BEGIN Portlet PORTLET-->

						<div class="portlet box green">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i><fmt:message key="company.info.details" /><!--Details--></div>
							</div>

							<div class="portlet-body">
								<div class='row-fluid'>
									
								    <div class='span12 box' id="portlet-content">
								        
								    </div>
								    
								    
								</div>

							</div>

						</div>

						<!-- END Portlet PORTLET-->

					</div>
</div>
<input  type="hidden" id="node" value=""/>
<script src="<webpath:path/>/resources/default/js/tms/mydetail/company/department.js" type="text/javascript"></script>
<script src="<webpath:path/>/resources/default/js/tms/mydetail/employee/employeesearchtable.js" type="text/javascript"></script>
