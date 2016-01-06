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
				<span><fmt:message key="userlist.info.user" /><!--User--></span>				
			</div>
			<div class="pull-right"> 	
					<button class="btn btn-success" onclick="user.switchdisplay();" title="Show List/card"><i class=" icon-align-justify"></i> / <i class=" icon-credit-card "></i></button>
	            	<button id="inplaceediting-enable" class="btn btn-success" onclick="user.create();"><i class="icon-plus "></i> 
	            	<span><fmt:message key="global.info.new" /><!--New--></span>
	            	</button>
					<button style="display:none" id="user_delete_list" class="btn btn-danger" onclick="user.remove();"><i class="icon-trash"></i>
					 <span><fmt:message key="global.info.delete" /><!--Delete--></span>
					</button>
					
			</div>
		</div>
	</div>
</div>
<div id="alertMessage"></div>	
<div id="user-table" style="display:none" >
	<div class="row-fluid resource">
	


		<div class="gallery">
			<ul class="unstyled inline">
			
				<c:forEach var="user" items="${users}">
				<li class="picture_li" style="padding-right:0px; padding-left:10px;width:299px">
				    <div class="picture">
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
								</div>
				    		</div>
				    	</div>
					    	
				        <div class="tags">
				        	
				            <%-- <div class="label label-success">${user.email}</div> --%>
				            <div class="label label-warning ">${user.roleName}</div>
				            <c:if test="${user.isEmployee}">
				            <div class="label label-info">Is Employee</div>
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
				            	
				            	
				            	<a class="btn btn-link" onclick="user.updateStatus('${user.id}')">
				                    <i class=" icon-lightbulb" ></i>
				                    Status
				                </a>
					                <!-- <ul class="">
					                	<li>Normal</li>
					                	<li>Clocked</li>
					                	<li>Closed</li>
					                </ul> -->
				                <a class="btn btn-link" onclick="user.update('${user.id}')">
				                    <i class="icon-edit "></i>
				                    Edit
				                </a>
				                <a class="btn btn-link" onclick="user.remove('${user.id}')">
				                    <i class="icon-trash"></i>
				                    Remove
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

<div id="user-list" style="display:none" >
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="user-table-sort" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped">
							<thead>
								<tr class="green-background">
									<th width="" class="selected dataCheck" ><input type="checkbox" class="checkall"/></th>
									<th width="">
									<span><fmt:message key="userlist.info.firstname" /><!--First Name--></span>
									</th>
									<th width="">
									<span><fmt:message key="userlist.info.lastname" /><!--Last Name--></span>
									</th>									
									<th width="">
									<span><fmt:message key="userlist.info.email" /><!--Email--></span>
									</th>
									<th width="">
									<span><fmt:message key="global.info.status" /><!--Status--></span>
									</th>
									<th width=""><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td><input type="checkbox" name="id" value="${user.id}" /></td>
									<td> ${user.firstName}&nbsp;</td>
									<td> ${user.lastName}&nbsp;</td>
									<td>${user.email}&nbsp;</td>
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
									</td>
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="user.update('${user.id}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> 
												<span><fmt:message key="global.info.edit" /><!--Edit--></span>
											</a> 
											<a href="javascript:;" onclick="user.updateStatus('${user.id}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> 
												<span><fmt:message key="global.info.status" /><!--Status--></span>												
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
<script src="<webpath:path/>/resources/default/js/tms/mydetail/user/user.js" type="text/javascript"></script>

