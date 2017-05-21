<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/common.jsp"%>

				<!--         content starts     iframe      -->
				<form class="form-horizontal" action="<%=basePath%>insertUser.shtml" method="post" style="display:block;">
					
					<fieldset>
			
						<legend class="text-center"
							style="margin-bottom:13px;background-color: #eeeeee;" >用户编辑</legend>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_host" >项目名称</label>
							<div class="col-sm-4">
								<input type="text" name="proName" class="form-control" id="ds_host"   />
							</div>
							<label class="col-sm-2 control-label" for="ds_comment" >备注</label>
							<div class="col-sm-4">
								<input type="text" name="comment" class="form-control" id="ds_comment"   />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_status"
								style="margin-top: 13px;">状态</label>
							<div class="col-sm-4" style="margin-top: 13px;">
								<select class="form-control" id="ds_status" name="status">
									<option value="1">报价</option>
									<option value="2">执行</option>
									<option value="3">交货</option>
									<option value="4">售后</option>
									<option value="5">等待签单</option>
								</select>
							</div>
							<label class="col-sm-2 control-label" for="ds_name" style="margin-top: 13px;">项目负责人</label>
							<div class="col-sm-4">
								<select class="form-control" id="ds_status" name="userId" style="margin-top:16px;">
								<c:forEach items="${tbAdduser}" var="user">
									<option value="1" >${user.userId}</option>
								</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">数量</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_count" type="text"
									 name="num"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">金额</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									 name="totalFee"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_department">部门</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_department" type="text"
									 name="department"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_contacts">客户/电话</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_contacts" type="text"
									 name="customer" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_req">需求文档</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_req" type="text"
									 name="reqUrl" placeholder="请输入文档链接"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_elc">电气文档</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_elc" type="text"
									 name="elcUrl" placeholder="请输入文档链接"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_mech">机械文档</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_mech" type="text"
									 name="mechUrl" placeholder="请输入文档链接"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_soft">软件文档</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_soft" type="text"
									 name="softUrl" placeholder="请输入文档链接"/>
							</div>
						</div>
						<div class="form-group">
							
							<label class="col-sm-2 control-label" for="ds_stime">交货时间</label>
							<div class="col-sm-4">
								<input class="form-control" class="laydate-icon" id="ds_stime" type="text" name="deadline" onclick="laydate()" />
							</div>
							
							<label class="col-sm-2 control-label" for="stime">开始时间</label>
							<jsp:useBean id="time" class="java.util.Date"/>  
							<div class="col-sm-4">
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
<script type="text/javascript">
		
	  //添加项目
	    function insertUser(){
			var form =document.forms[0];
			form.action = "<%=basePath%>insertUser.shtml";
		    form.method="post";  
		    form.submit(); 
		}

		</script>
	


</body>

</html>