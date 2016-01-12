
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="permission" uri="/WEB-INF/tlds/permission.tld"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="webpage" uri="/WEB-INF/tlds/pageview.tld"%>

<header>

	<script>
		$(document).ready(function() {

		});

		function showMsg(msg) {
			$("#sysInfoUL")
					.append(
							"<li><a href='#'><div class='widget-body'><div class='pull-left icon'><i class='icon-user text-success'></i></div><div class='pull-left text'>"
									+ msg + "</div></div></a></li><li class='divider'></li>");
		}
	</script>


	<div class='navbar '>
		<div class='navbar-inner'>
			<div class='container-fluid' style="">

				<a class='brand' href='#'
					style="padding-top: 2px; padding-left: 5px;"> <span><img
						src="<webpath:path/>/resources/default/images/logo.png" /> </span>
				</a>
				<ul class="nav pull-left">
					<li class='medium'><a href='<webpath:path/>/dashboard'
						class="console-topbar-btn console-topbar-btn-inverse console-topbar-btn-home">
							<span class="console-topbar-btn-icon icon-home"></span> <span
							class="console-topbar-btn-text nowrap"> <span
								class="ng-binding">Dashboard</span>
						</span>

					</a></li>


				</ul>

				<ul class='nav pull-right'>
					<li class='dropdown medium only-icon '><a
						class='dropdown-toggle' data-toggle='dropdown' href='#'> <i
							class='icon-bell'></i>
							<div class='label'>2</div>
					</a>
						<ul id="sysInfoUL" class='dropdown-menu'>
							<li><a href="<webpath:path/>/notification/all"><i
									class="icon-comment text-warning"></i> 0 ，click</a></li>
							<li><a href="<webpath:path/>/notification/all"><i
									class="icon-comment text-warning"></i> 0 ，click</a></li>
							<!-- <li class="divider"></li> -->
							<%-- <li class="widget-footer">
									<a href="<webpath:path/>/notification/all">查看所有</a>
								</li> --%>
						</ul></li>


					<li class='dropdown medium user-menu'>
						<a class='dropdown-toggle' data-toggle='dropdown' href='javascript:;' style="padding-top: 9px;"> 
							<i class='icon-user'></i> 
							<span class='user-name hidden-phone'><c:out  value="${sessionScope.session_user.email}"  /></span> 
							<b class='caret'></b>
						</a>
						<ul class='dropdown-menu'>
							<li><a href='<webpath:path/>/user/profile'> <i
									class='icon-user'></i> Profile
							</a></li> 
							<li><a href='javascript:;' onclick="updatePassword('');">
									<i class='icon-cog'></i> Change Password
							</a></li>
							<li class='divider'></li>
							<li><a href='javascript:;' onclick="logout();"> <i
									class='icon-signout'></i> Sign out
							</a></li>
						</ul></li>
				</ul>
				<!-- <form accept-charset="UTF-8" action="#" class="navbar-search pull-right hidden-phone" method="get" /><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
                    <button class="btn btn-linkicon-search" name="button" type="submit"></button>
                    <input autocomplete="off" class="search-query span2" id="q_header" name="q" placeholder="Search..." type="text" value="" />
                </form> -->

			</div>
		</div>
	</div>



</header>

<div class="second-level">
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<a data-toggle="collapse" data-target=".navbar-responsive-collapse"
					class="btn btn-navbar collapsed"> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a href="#" class="brand"><i class="icon-time"></i> CleverTime</a>
				<div class="nav-collapse navbar-responsive-collapse collapse"
					style="height: 0px;">
					<ul class="nav">
						<permission:path roles="superadmin">
							<li class="dropdown" id="customer_li">
								<a class="dropdown-toggle" data-toggle='dropdown' href="javascript:;">Customer</a>
								<ul class='dropdown-menu head-menu'>
									<li id="company_profiles_li"><a
										href="<webpath:path/>/customer/list"> <i
											class="icon-double-angle-right "></i> Customer
									</a></li>

									<li id="employees_li"><a href="<webpath:path/>/staff/list"> <i
											class="icon-double-angle-right "></i> Staff
									</a></li>

									<li id="user_li"><a href="#"> <i
											class="icon-double-angle-right"></i> Report
									</a></li>
								</ul>
							</li>
						</permission:path>

						<li class="dropdown" id="my_details_li">
							<a class="dropdown-toggle" data-toggle='dropdown' href="javascript:;">My Details</a>
							<ul class='dropdown-menu head-menu'>
								<li id="company_profiles_li"><a
									href="<webpath:path/>/dashboard"> <i
										class="icon-home "></i> Dashboard
								</a></li>
								<li id="company_profiles_li"><a
									href="<webpath:path/>/mydetail/company"> <i
										class="icon-briefcase "></i> Company Profiles
								</a></li>

								<li id="employees_li"><a
									href="<webpath:path/>/employee/list"> <i
										class="icon-group "></i> Employees
								</a></li>

								<li id="user_li"><a href="<webpath:path/>/user/list"> <i
										class="icon-user"></i> Users
								</a></li>
							</ul>
						</li>

						<li class="dropdown" id="employee_schedules_li">
							<a class="dropdown-toggle" data-toggle='dropdown' href="javascript:;">Schedules</a>
							<ul class='dropdown-menu head-menu'>
								<li class='' id="leaves_li" draggable="true"><a href="<webpath:path/>/leave/list">
										<i class='icon-bell'></i> <span>Leaves Requests</span>
								</a></li>

								<li class='' id="employeeschedules_li" draggable="true"><a
									href='#'> <i class='icon-group '></i> <span>Employee
											Schedules</span>
								</a></li>

								<li class='' id="recalculate_li" draggable="true"><a
									href='#'> <i class='icon-rotate-right'></i> <span>Recalculate
											Schedule</span>
								</a></li>

								<li class='' id="schedulestemplate_li" draggable="true"><a
									href='#'> <i class='icon-time'></i> <span>Import Schedules</span>
								</a></li>
							</ul>
						</li>
						
						<li class="dropdown " id="common_functions_li">
							<a class="dropdown-toggle" data-toggle='dropdown' href="javascript:;">Common Functions</a>
							<ul class='dropdown-menu head-menu'>
							
								<li class='' id="script_info_li" draggable="true"><a
									href='#'> <i class='icon-time '></i> <span>Time
											Sheet</span>
								</a></li>
								<li class='' id="script_config_li" draggable="true"><a
									href='#'> <i class=' icon-money '></i> <span>Payroll Transfer</span>
								</a></li>
								<li><a href="#"> <i class="icon-bar-chart "></i>
										Generate Reports
								</a></li>

								<li><a href="#"> <i class="icon-bar-chart "></i> Auto
										Send Reports
								</a></li>

								<li><a href="#"> <i class="icon-download"></i> Import Times
								</a></li>

								
							</ul>
						</li>


						<li class="dropdown" id="tms_settings_li">
							<a class=" dropdown-toggle" data-toggle='dropdown' href="javascript:;">Settings</a>
							<ul class='dropdown-menu head-menu'>
								<li><a href="<webpath:path/>/job/list"> <i class="icon-cog"></i> Jobs
								</a></li>
								
								<li><a href="<webpath:path/>/task/list"> <i
										class="icon-cog"></i> Tasks
								</a></li>

								<%-- <li><a href="<webpath:path/>/position/list"> <i
										class="icon-cog"></i> Positions
								</a></li> --%>

								<li><a href="<webpath:path/>/paytype/list"> <i class="icon-cog"></i>
										Pay Types
								</a></li>

								<li><a href="<webpath:path/>/paygroup/list"> <i class="icon-cog"></i>
										Pay Groups
								</a></li>

								<li><a href="<webpath:path/>/schedule/list"> <i class="icon-cog"></i>
										Schedule Templates
								</a></li>

								<li><a href="<webpath:path/>/roundingrules/list" title="Time rounding rule maintenance">
										<i class="icon-cog"></i> Rounding Rules
								</a></li>

								<li><a href="<webpath:path/>/holiday/list"> <i class="icon-cog"></i>
										Public Holidays
								</a></li>
								
								<li><a href="<webpath:path/>/structure/setting"> <i class="icon-cog"></i>
										Company Structure
								</a></li>

								
							</ul>
						</li>

						

					</ul>


				</div>
			</div>
		</div>
	</div>