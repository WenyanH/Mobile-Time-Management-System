<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>

<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="webpage" uri="/WEB-INF/tlds/pageview.tld"%>

<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
				<span><decorator:getProperty property="subtitle" ></decorator:getProperty></span>
			</div>

			<div class="pull-right">
	            	<button id='<decorator:getProperty property="button1" ></decorator:getProperty>' ></button>
					<button id="<decorator:getProperty property="button2" ></decorator:getProperty>" > </button>
					<button id="<decorator:getProperty property="button3" ></decorator:getProperty>" > </button>
			</div>
		</div>
	</div>
</div>

<div id="position-table">
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="<decorator:getProperty property="result.table.id" > </decorator:getProperty>"" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th  class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									<th ><decorator:getProperty property="result.table.col1" > </decorator:getProperty></th>
									<th ><decorator:getProperty property="result.table.col2" > </decorator:getProperty></th>
									<th ><decorator:getProperty property="result.table.col3" > </decorator:getProperty></th>
									<th ><decorator:getProperty property="result.table.col4" > </decorator:getProperty></th>
									<th ><decorator:getProperty property="result.table.col5" > </decorator:getProperty></th>
									<th ></th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>


<script src="<webpath:path/>/resources/default/js/tms/<decorator:getProperty property="js.file" > </decorator:getProperty>" type="text/javascript"></script>


