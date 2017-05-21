<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/common.jsp"%>
					<!-- content starts     iframe -->
					<div class="search">
	    <form action="<%=basePath%>rolefinditem.shtml" method="post">
	   <a> 物料名称：<input type="text" name="tbBomEx.components" id="item"/></a>
	   <a> 下单人：<input type="text" name="tbBomEx.userId" id="principal"/></a>
	   <a> 项目ID：<input type="number" name="tbBomEx.proId" id="phonenumber"/></a>
	   <a><label class="control" for="ds_status" >状态</label>
							
			<select class="selectCorol" id="ds_status" name="tbBomEx.status" style="padding:8px;" name="status" >
				<option value="1">采购</option>
				<option value="2">物流中</option>
				<option value="3">已收货</option>
				<option value="2">客户提供</option>
			</select>
	   </a>
	   <a><input type="submit" value="查询"  /></a>
	 </form>
	   <a href="additem.html" title="" class="btn btn-primary addBtn" role="button">项目添加</a>
	   
	   </div>
			
		
		<div class="clear"></div>
		<div class="entry entry-content">
		   <br/>
			
				 
				<div id="list">
					<table class="table">
						<thead>
							<tr>
							    <th>id</th>
								<th>项目id</th>
								<th>下单人id</th>
								<th>部件名称</th>
								<th>型号</th>
								<th>品牌</th>
								<th>单价</th>					
								<th>数量</th>
								<th>链接</th>
								<th>计划交货时间</th>
								<th>状态</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id='tr1' >
							
							<c:forEach items="${tbList }" var="items" >
							<tr id="list${items.bomId }" >
							   	<td>${items.bomId}</td>
								<td>${items.proId }</td>
								<td>${items.userId }</td>
								<td>${items.components }</td>
								<td>${items.model }</td>
								<td> ${items.brand }</td>
								<td>${items.price }</td>
								<td>${items.num }</td>
								<td><a href="${items.url }" target="_blank">${items.url }</a></td>
								<td>${items.deadline }</td>
								<td>${items.status }</td>
								<td>${items.comment }</td>
								<td style="font-weight:bold" id =${items.bomId }><a href="viewitems.html?id=${ items.bomId}">查看</a> | <a href="#" onclick="del('${ items.bomId}')">删除</a> | <a href="edititems.html?id=${ items.bomId}">编辑</a></td>
							</tr>							
							</c:forEach>

						</tbody>
					</table>
					<div class="wp-pagenavi">
						<span>第</span>
					
						<%
						
							PageParam pageParam = (PageParam)request.getAttribute("pageParam");
							int currPage = pageParam.getCurrPage();
							int totalPage = pageParam.getTotalPage();
							for(int i = 1; i <= totalPage; i ++){
								if(i == currPage){
									%><span class="current">${pageParam.currPage }</span><%
								}else{
									%><a href="items.html?page=<%=i %>"><%=i %></a><%
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
		<script type="text/javascript">
		 function del(id){
		    	if(confirm("是否删除")){
		    		$.get("<%=basePath%>deleteitems.shtml?id="+id,function(data){
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