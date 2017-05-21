<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/common.jsp"%>

					<!-- content starts     iframe -->
						<div class="wrap fullwidth">
	<!-- <div id="content" style="width: auto;"> -->
	
	  <div id="post-2" class="post-2 page type-page status-publish hentry">
	  
	   <div class="search">
	    <form action="<%=basePath%>rolefind.html" method="post">
	   <a> 项目名称：<input type="text" name="tbProjectEx.proName" id="item"/></a>
	   <a> 负责人：<input type="text" name="tbProjectEx.userId" id="principal"/></a>
	   <a> 联系人：<input type="text" name="tbProjectEx.customer" id="phone"/></a>
	   <a><label class="control" for="ds_status" >状态</label>
							
			<select class="selectCorol" id="ds_status" name="tbProjectEx.status" style="padding:8px;"  >
				<option value=""></option>			
				<option value="1">报价</option>
				<option value="2">执行</option>
				<option value="3">交货</option>
				<option value="4">售后</option>
				<option value="5">等待签单</option>
			</select>
	   </a>
	   <a><input type="submit" value="查询"  /></a>
	 </form>
	   <a href="add.html" title="" class="btn btn-primary addBtn" role="button">项目添加</a>
	   
	   </div>
		
		
		<div class="clear"></div>
		<div class="entry entry-content">
		   <br/>
			
				 
				<div id="list">
					<table class="table">
						<thead>
							<tr>
							  	<th>id</th>
								<th>负责人</th>
								<th>项目名称</th>
								<th>客户部门</th>
								<th>客户</th>
								<th>交货时间</th>
								<th>剩余时间</th>
								<th>状态</th>
								<th> &nbsp;&nbsp;操作&nbsp;</th>
								
							</tr>
						</thead>
						<tbody id='tr1' >
							
							<c:forEach items="${tbList }" var="items" >
							<tr  >
							   	<td>${items.proId}</td>
								<td>${items.userId }</td>
								<td class="proname">${items.proName }
									<div class="pro" style="display:none;position:absolute;top:opx;left:139px;">
										<a href="${items.reqUrl }" target="_blank">需求</a>
										<a href="${items.elcUrl }" target="_blank">电气</a>
										<a href="${items.mechUrl }" target="_blank">机械</a>
										<a href="${items.softUrl }" target="_blank">软件</a>
									</div>
								</td>
								<td>${items.department }</td>
								<td>${items.customer }</td>
								<td class="protime">
								
								<fmt:formatDate  value= "${items.deadline}" pattern= "yyyy/MM/dd" />
								   
								</td>
								<td class="retime">
								<%-- 	<jsp:useBean id= "nowDate" class = "java.util.Date" />
									<fmt:formatDate var= "nowStr" value= "${nowDate}" pattern= "yyyy/MM/dd" />
									<c:set var= "interval" value= "${someDate} - ${nowStr}" />
									${interval}
 --%>								</td>
								<td>进行中</td>
								
								<td style="font-weight:bold" ><a href="view.html?id=${ items.proId}">查看</a> | <a href="#" onclick="del('${ items.proId}')">删除</a> | <a href="edit.html?id=${ items.proId}">编辑</a></td>
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
						%> 
						<%
						
							PageParam pageParam = (PageParam)request.getAttribute("pageParam");
							int currPage = pageParam.getCurrPage();
							int totalPage = pageParam.getTotalPage();
							for(int i = 1; i <= totalPage; i ++){
								if(i == currPage){
									%><span class="current">${pageParam.currPage }</span><%
								}else{
									%><a href="index.html?page=<%=i %>"><%=i %></a><%
								}
							}
						%> --%>
						<c:forEach var = "i" begin = "1" end = "${pageParam.totalPage }"  step = "1">
						 <c:choose>
						<c:when test= "${ i == pageParam.currPage  }" >	
							<span class="current">${pageParam.currPage }</span>
						</c:when>
						<c:otherwise>
							<a href="index.html?page=${i }">${i }</a>
						</c:otherwise>
						 </c:choose>
						</c:forEach>
						
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
		$(function(){
			$("#tr1 .proname").hover(function(){
				$(this).find(".pro").css("display","block");
			},function(){
				$(this).find(".pro").css("display","none");
			});
			
			
			//监听select哪个被选中
			$(".selectCorol").change(function(){
				/* $(".selectCorol > option:selected").attr("selected","selected"); */
				
			});
			
		});
		//删除操作
	    function del(id){
	    	if(confirm("是否删除")){
	    		$.get("<%=basePath%>deleteUser.shtml?id="+id,function(data){
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