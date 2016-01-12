<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="webpage" uri="/WEB-INF/tlds/pageview.tld"%>

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
				            <c:if test="${user.status=='Normal'}">
								<div class="label label-success">${user.status}</div>
							</c:if>
							<c:if test="${user.status=='Closed'}">
								<div class="label label-important">${user.status}</div>
							</c:if>
							<c:if test="${user.status=='Clocked'}">
								<div class="label label-warning">${user.status}</div>
							</c:if>
				        </div>
				        
				        <div class="actions">
				            <div class="text-center">
				            	
				            	
				            	<a class="btn btn-link">
				                    <i class=" icon-lightbulb "></i>
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