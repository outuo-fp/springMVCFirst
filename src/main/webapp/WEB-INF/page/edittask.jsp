<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/common.jsp"%>
				<!--         content starts     iframe      -->
				<form class="form-horizontal" role="form" style="display:block;" action="<%=basePath%>saveOrtask.shtml" method="post">
					
					<fieldset>
					<input type="hidden" name="taskId" value="${userEdit.taskId}"/>
						<legend class="text-center"
							style="padding: 2px;background-color: #eeeeee;" >用户编辑</legend>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">任务名称</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_count" type="text"
									value="${userEdit.taskName }" name="taskName"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">内容</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									value="${userEdit.connent }" name="connent"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">计划时间</label>
							<div class="col-sm-4">
								<input class="form-control" class="laydate-icon" id="ds_count" type="text"
									value="${userEdit.deadline }" name="deadline" onclick="laydate()"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">实际完成时间</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									value="${userEdit.actualDate }" name="actualDate" onclick="laydate()"/>
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
									<option value="1" >${user.userId}</option>
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

						<div class="row">
							<div class="col-sm-12 text-center bg-danger"
								style="padding: 2px;background-color: #eeeeee;">
								<!-- <a href="#" class="btn btn-primary active" role="button" onclick="updateUser()">&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;</a> -->
								<input class="btn  btn-success" type="submit" value="保存" style="padding:2px;width:80px;">
								${message}
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
<script type="text/javascript">
	

	$(function() {
	/* 	var data = [ "a", "b", "c", "d" ];
		var html = '<td>${items.id }</td><td></td><td></td><td></td><td></td><td></td><td></td><td>进行中</td><td>完成</td>';
		/* for (var i = 0; i < data.length; i ++) {
		  html += "<td>" + data[i] + "</td>";
		} */
		/*$("#row").empty();
		$("#row").append(html); */
		var protime=$("#protime").text();
		
		function getOffsetDays(time1, time2) {
		    var offsetTime = Math.abs(time1 - time2);
		    return Math.floor(offsetTime / (3600 * 24 * 1e3));
		}
		var time =getOffsetDays((new Date(protime)).getTime(),Date.now());
		var html =time+"天";
		$(".retime").append(html);
		
		//通过value获取下拉框的值
		
		switch(${userEdit.status}){
		  case 1:
			  $("#ds_status option[value=1]").attr("selected", "selected");
		  	break;
		  case 2:
			  $("#ds_status option[value=2]").attr("selected", "selected");
		  	break;
		  case 3:
			  $("#ds_status option[value=3]").attr("selected", "selected");
		  	break;
		  case 4:
			  $("#ds_status option[value='4]").attr("selected", "selected");
		  	break;
		  case 5:
			  $("#ds_status option[value=5]").attr("selected", "selected");
		  	break;
		}
	});
	<%-- function updateUser(){
		var form =document.forms[0];
		form.action = "<%=basePath%>saveOrtask.shtml";
	    form.method="post";  
	    form.submit();  
	} --%>
	
</script>
	


</body>

</html>