	<div class='row-fluid' >
			<div id="alertMessage"></div>

			<div class='span12' style="margin: 0px;">

				<div class="control-group">
					<label class="control-label"> <font color="red">*</font><span>Pay Group:</span></label>
					<div class="controls">
						<select  name="payGroupId" class="span12"
							data-placeholder=" " tabindex="1">
							<option value=""></option>
							<c:forEach var="payGroup" items="${payGroupList}">
								<option value="${payGroup.id}"
									<c:if test="${payGroup.id==report.payGroupId}">selected</c:if>>${payGroup.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>


				<div class="control-group">
					<label class="control-label"> <span>Paging By:</span></label>
					<div class="controls">
						<select name="paging" class="span12"
							data-placeholder=" " tabindex="1">
							<option value=""></option>
							<option value="">Position</option>
							<option value="">Employee</option>
						</select>
					</div>
				</div>


				<div class="control-group">
					<label class="control-label"> <font color="red">*</font><span>Sort By:</span></label>
					<div class="controls">
						<select name="sort" class="span12"
							data-placeholder=" " tabindex="1">
							<option value=""></option>
							<option value="">Surname</option>
							<option value="">First Name</option>
							<option value="">Employee ID</option>
							
							
						</select>
					</div>
				</div>
			</div>
		</div>