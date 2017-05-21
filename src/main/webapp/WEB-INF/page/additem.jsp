<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/common.jsp"%>
				<!--         content starts     iframe      -->
				<form class="form-horizontal" role="form" action="<%=basePath%>insertitem.shtml" style="display:block;" method="post">
					
					<fieldset>
					<input type="hidden" name="bomId" value="${userEdit.bomId}"/>
						<legend class="text-center"
							style="margin-bottom:13px;background-color: #eeeeee;" >物料添加</legend>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">物料名称</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_count" type="text"
									 name="components"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">型号</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									 name="model"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">数量</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_count" type="text"
									 name="num"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">链接</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									 name="url"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">品牌</label>
							<div class="col-sm-4">
								<input class="form-control"  id="ds_count" type="text"
									 name="brand"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">单价</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									 name="price" "/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">计划完成时间</label>
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
								<c:forEach items="${tbitemuser}" var="useritem">
									<option value="${useritem.proId}" >${useritem.proId}</option>
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
								<select class="form-control" id="ds_sta" name="status" >
									<option value="1">采购</option>
									<option value="2">物流中</option>
									<option value="3">已收货</option>
									<option value="4">客户提供</option>
									
								</select>
							</div>
						<label class="col-sm-2 control-label" for="ds_money">备注</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									 name="comment" />
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
								<!-- <a href="#" class="btn btn-primary active" role="button" onclick="updateitem();">&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;</a> -->
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
		<%-- function updateitem(){
			var form =document.forms[0];
			form.action = "<%=basePath%>saveOritems.shtml";
		    form.method="post";  
		    form.submit();  
		} --%>

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
	
	
	
</script>
	


</body>

</html>