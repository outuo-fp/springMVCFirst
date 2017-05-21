<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/common.jsp"%>
				<!--         content starts     iframe      -->
				<form class="form-horizontal" role="form" style="display:block;">
					
					<fieldset>
					<input type="hidden" name="proId" value="${userEdit.proId}"/>
						<legend class="text-center"
							style="padding: 2px;background-color: #eeeeee;" >用户编辑</legend>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_host" >项目名称</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_host" type="text"
									value="${userEdit.proName }" name="proName"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_comment">备注</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_comment" type="text"
									value="${userEdit.comment}" name="comment"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">数量</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_count" type="text"
									value="${userEdit.num }" name="num"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">金额</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									value="${userEdit.totalFee }" name="totalFee"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_req">需求文档</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_req" type="text"
									value="${userEdit.reqUrl }" name="reqUrl" placeholder="请输入文档链接"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_elc">电气文档</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_elc" type="text"
									value="${userEdit.elcUrl }" name="elcUrl"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="mechUrl">机械文档</label>
							<div class="col-sm-4">
								<input class="form-control" id="mechUrl" type="text"
									value="${userEdit.mechUrl }" name="mechUrl"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_soft">软件文档</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_soft" type="text"
									value="${userEdit.softUrl }" name="softUrl"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_department">部门</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_department" type="text"
									value="${userEdit.department}" name="department"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_contacts">客户/电话</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_contacts" type="text"
									value="${userEdit.customer}" name="customer" />
							</div>
						</div>
						<div class="form-group">
							
							<label class="col-sm-2 control-label" for="protime">交货时间</label>
							<div class="col-sm-4">
								<input  class="form-control" class="laydate-icon" name="deadline"  id="protime"  type="text" onclick="laydate()" 
									value="<fmt:formatDate value="${userEdit.deadline}" pattern="yyyy/MM/dd"/>" />
							</div>
							<label class="col-sm-2 control-label" for="ds_status"
								>状态</label>
							<div class="col-sm-4" >
								<select class="form-control" id="ds_status" name="status" >
									<option value="1">报价</option>
									<option value="2">执行</option>
									<option value="3">交货</option>
									<option value="4">售后</option>
									<option value="5">等待签单</option>
								</select>
							</div>
							<div class="form-group">
							
							<label class="col-sm-2 control-label" for="ds_status"
								style="margin-top:16px;">项目负责人</label>
							<div class="col-sm-4" >
							
								<select class="form-control" id="ds_status" name="userId" style="margin-top:16px;">
								<c:forEach items="${tbuser}" var="user">
									<option value="1" >${user.userId}</option>
								</c:forEach>
								</select>
								
							</div>
						</div>

						<div class="row">
							<div class="col-sm-12 text-center bg-danger"
								style="padding: 2px;background-color: #eeeeee;">
								<a href="#" class="btn btn-primary active" role="button" onclick="updateUser()">&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;</a>
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
	function updateUser(){
		var form =document.forms[0];
		form.action = "<%=basePath%>saveOrUpdate.shtml";
	    form.method="post";  
	    form.submit();  
	}
	
</script>


</body>

</html>