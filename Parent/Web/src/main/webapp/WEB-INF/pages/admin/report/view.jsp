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
			<span>Reports</span>
			</div>
			
		</div>
	</div>
</div>
<div id="alertMessage"></div>	
<div id="report-table">
	<div class="row-fluid">
		
		<div class="report-icon" >
			<div class="span3 box-quick-link green-background">
				<a href="/report/condition?type=TimeCardReport">
					<div class="header">
						<div class=" icon-credit-card "></div>
					</div>
					<div class="content">TimeCard Report</div>
				</a>
			</div>
			<div class="span3 box-quick-link green-background">
				<a href="/report/condition?type=TimeCardDetailsReport">
					<div class="header">
						<div class=" icon-file-alt"></div>
					</div>
					<div class="content">TimeCard Details Report</div>
				</a>
			</div>
			<div class="span3 box-quick-link green-background">
				<a href="#">
					<div class="header">
						<div class="icon-group "></div>
					</div>
					<div class="content">Employees List Report</div>
				</a>
			</div>
			<div class="span3 box-quick-link green-background">
				<a href="/report/condition?type=ExceptionsReport">
					<div class="header">
						<div class=" icon-bar-chart "></div>
					</div>
					<div class="content">Exceptions Report</div>
				</a>
			</div>
			
		</div>
		</div>
		
		
		<div class="row-fluid">
		<div class="report-icon" >
			
			<div class="span3 box-quick-link green-background">
				<a href="#">
					<div class="header">
						<div class="icon-briefcase "></div>
					</div>
					<div class="content">Onsite Report</div>
				</a>
			</div>
			<div class="span3 box-quick-link green-background">
				<a href="#">
					<div class="header">
						<div class="icon-bell "></div>
					</div>
					<div class="content">Leave Report</div>
				</a>
			</div>
			
			<div class="span3 box-quick-link green-background">
				<a href="#">
					<div class="header">
						<div class="icon-time"></div>
					</div>
					<div class="content">Job Hours Summary Report</div>
				</a>
			</div>
			<div class="span3 box-quick-link green-background">
				<a href="#">
					<div class="header">
						<div class="icon-time "></div>
					</div>
					<div class="content">Job Hours Details Report</div>
				</a>
			</div>
			
		</div>
		</div>
		<div class="row-fluid">
		<div class="report-icon" >
			
			<div class="span3 box-quick-link green-background">
				<a href="#">
					<div class="header">
						<div class=" icon-font "></div>
					</div>
					<div class="content">Auditing Report</div>
				</a>
			</div>
		</div>
	</div>
</div>


	