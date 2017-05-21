<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/common.jsp"%>

				<div class="wrap fullwidth">
	<!-- <div id="content" style="width: auto;"> -->
	
	  <div id="post-2" class="post-2 page type-page status-publish hentry">
	  
	   <div class="search">
	    <form action="<%=basePath%>rolefindtask.shtml" method="post">
	   <a> 任务名称：<input type="text" name="tbTaskEx.taskName" id="item"/></a>
	   <a> 负责人：<input type="text" name="tbTaskEx.userId" id="principal"/></a>
	   <a>项目id：<input type="text" name="tbTaskEx.proId" id="phone"/></a>
	   <a><label class="control" for="ds_status" name="tbTaskEx.status">状态</label>
							
			<select class="selectCorol" id="ds_status" name="status" style="padding:8px;">
				<option value="-1">请选择</option>
				<option value="1" >报价</option>
				<option value="2">执行</option>
				<option value="3">交货</option>
				<option value="4">售后</option>
				<option value="5">等待签单</option>
			</select>
	   </a>
	   <a><input type="submit" value="查询"  /></a>
	 </form>
	   <a href="addtask.html" title="" class="btn btn-primary addBtn" role="button">项目添加</a>
	   
	   </div>
		
		
		<div class="clear"></div>
		<div class="entry entry-content">
		   <br/>
			
				 
				<div id="list">
					<table class="table">
						<thead>
							<tr>
							  	<th>id</th>
								<th>项目名称</th>
								<th>任务名称</th>
								<th>任务类型</th>
								<th>负责人</th>
								<th>计划完成时间</th>
								<th>实际完成时间</th>
								<th>状态</th>
								<th> 操作</th>
								
							</tr>
						</thead>
						<tbody id='tr1' >
							
							<c:forEach items="${tbList }" var="items" >
							<tr id="list${items.taskId }" >
								<td>${items.taskId }</td>
								<td>${items.proId }</td>
							   	<td>${items.taskName}</td>
								<td>${items.type }</td>
								<td>${items.userId }</td>
								<td>${items.deadline }</td>
								<td>${items.actualDate }</td>
								<td> ${items.status }</td>
								
								<td style="font-weight:bold" id =${items.taskId }><a href="viewtask.html?id=${ items.taskId}">查看</a> | <a href="#" onclick="del('${ items.taskId}')">删除</a> | <a href="edittask.html?id=${ items.taskId}">编辑</a></td>
							</tr>							
							</c:forEach>

						</tbody>
					</table>
					<!-- <input type="button" onclick="getInnerHTML()" value="Alert innerHTML of table row" />

					<div class="message" id="row">注：表中响应速度是中国测速服务器的测试数据，仅供参考。响应速度根据你机器所在的地理位置不同而有差异。</div>
					 -->
					<div class="wp-pagenavi">
						<span>第</span>
					<%-- 	<%
						
							PageParam pageParam = (PageParam)request.getAttribute("pageParam");
							int currPage = pageParam.getCurrPage();
							int totalPage = pageParam.getTotalPage();
							for(int i = 1; i <= totalPage; i ++){
								if(i == currPage){
									%><span class="current"><%=currPage %></span><%
								}else{
									%><a href="index.html?page=<%=i %>"><%=i %></a><%
								}
							}
						%> --%>
						<%
						
							PageParam pageParam = (PageParam)request.getAttribute("pageParam");
							int currPage = pageParam.getCurrPage();
							int totalPage = pageParam.getTotalPage();
							for(int i = 1; i <= totalPage; i ++){
								if(i == currPage){
									%><span class="current">${pageParam.currPage }</span><%
								}else{
									%><a href="task.html?page=<%=i %>"><%=i %></a><%
								}
							}
						%>
						<span>页</span>
					</div>
				</div>
			<!-- </div> -->
		 </div> 
	</div>
	<div class="clear"></div>
	
<!-- content end -->
				</div>
			</div>
		</div>
		<!--/.fluid-container-->

		<!-- external javascript -->

		<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<<script type="text/javascript">
	//删除数据方法
	  function del(id){
	    	if(confirm("是否删除")){
	    		$.get("<%=basePath%>deleteTask.shtml?id="+id,function(data){
		    		 if("删除成功" == data){  
		               
		                 window.location.reload();  
		             }else{  
		                $.each(data,function(index,item){
		                	alert(data[index].port);
		                });
		             }  
		    	});
	    	}
	    }
	</script>
		
	</body>

</html>