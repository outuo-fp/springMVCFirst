<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/common.jsp"%>
				<!--         content starts     iframe      -->
				<form class="form-horizontal" action="<%=basePath%>insertTask.shtml" method="post" style="display:block;">
					
					<fieldset>
					
						<legend class="text-center"
							style="margin-bottom:13px;background-color: #eeeeee;" >用户编辑</legend>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">任务名称</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_count" type="text"
									 name="taskName"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">内容</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									 name="connent"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">计划时间</label>
							<div class="col-sm-4">
								<input class="form-control" class="laydate-icon" id="ds_count" type="text"
									 name="deadline" onclick="laydate()"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">实际完成时间</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									 name="actualDate" onclick="laydate()"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_status"
								style="margin-top:16px;">项目负责人</label>
							<div class="col-sm-4" >
								<select class="form-control" id="ds_status" name="proId" style="margin-top:16px;">
									<c:forEach items="${tbtaskuser}" var="usertask">
										<option value="${usertask.proId}" >${usertask.proId}</option>
									</c:forEach>
								</select>
							</div>
							 <label class="col-sm-2 control-label" for="ds_status"
								style="margin-top:16px;">任务负责人</label>
							<div class="col-sm-4" >
							
								<select class="form-control" id="ds_status" name="userId" style="margin-top:16px;">
								<c:forEach items="${tbuser}" var="user">
									<option value="${user.userId}" >${user.userId}</option>
								</c:forEach>
								</select>
								
							</div>
						</div> 
						<div class="form-group">
							
							<label class="col-sm-2 control-label" for="ds_sta"
								>类型</label>
							<div class="col-sm-4" >
								<select class="form-control" id="ds_sta" name="type" >
									<option value="1">机械</option>
									<option value="2">电气</option>
									<option value="3">软件</option>
									<option value="4">采购</option>
									<option value="5">售后</option>
								</select>
							</div>
							<label class="col-sm-2 control-label" for="ds_status"
								>状态</label>
							<div class="col-sm-4" >
								<select class="form-control" id="ds_status" name="status" >
									<option value="1">待命</option>
									<option value="2">执行</option>
									<option value="2">已完成</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">创建时间</label>
								<div class="col-sm-4">
									<jsp:useBean id="time" class="java.util.Date"/>  
										<input class="form-control" class="laydate-icon" id="stime" type="text" name="created" value="<%=time%>" disabled/>
									
								</div>
						</div>
						<div class="row">
							<div class="col-sm-12 text-center bg-danger"
								style="padding: 2px;background-color: #eeeeee;">
								<input class="btn  btn-success" type="submit" value="保存" style="padding:2px;width:80px;">
								
								&nbsp;${addUser}<br> 
							</div>
						</div>
					</fieldset>
				</form>
				<!-- content end -->
			</div>
		</div>
	</div>
	<!--/.fluid-container-->

	<!-- external javascript -->



</body>

</html>