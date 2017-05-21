<%@page import="com.fp.ssm.common.PageParam"
		import="com.fp.ssm.po.TableIpShowVo"
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file= "/WEB-INF/page/include/taglib.jsp" %>
<%-- <%
	request.setAttribute("domain", "http://localhost/spTest/");
%> --%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html>
<html lang="en">

	<head>
		<!--
        ===
        This comment should NOT be removed.

        Charisma v2.0.0

        Copyright 2012-2014 Muhammad Usman
        Licensed under the Apache License v2.0
        http://www.apache.org/licenses/LICENSE-2.0

        http://usman.it
        http://twitter.com/halalit_usman
        ===
    -->
		<meta charset="utf-8">
		<title>苏州欧拓信息管理系统</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
		<meta name="author" content="Muhammad Usman">

		<!-- The styles -->
		<link id="bs-css" href="${ctx}/css/bootstrap-cerulean.min.css" rel="stylesheet">

		<link href="${ctx}/css/charisma-app.css" rel="stylesheet">
		
		<link rel="stylesheet" type="text/css" href="${ctx}/css/index.min.css">
		<!-- jQuery -->
		

		<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

		<!-- The fav icon -->
		<link rel="shortcut icon" href="${ctx}/img/favicon.ico">
		<script src="${ctx}/js/jquery.min.js"></script>
	<script type="text/javascript">
	   
	   function change(obj)
	   {
	       var test= '#list' + obj;
	       var test1 = "${tbList[1].ip }";
	       var user = {"tableIp.id":obj};
		   //alert(${tbList[obj].ip });
		  //alert(test );
		  
		    $.ajax({
		    	type:"post",
		    	url:"${pageContext.request.contextPath }/find.shtml",
		    	data:user,
		    	success:function(data)
		    	{
		    		var parseJson = $.parseJSON(data);
		    		alert(parseJson.findTime);
		    	
		    		var ipvar = '<td><input type="text" style="width:80px;" name="fname" value ='+parseJson.ip+' /></td>';
		    		var iportvar = '<td><input type="text" style="width:40px;" name="fname" value ='+parseJson.port+' /></td>';
		    		var countryvar = '<td><input type="text" style="width:40px;" name="fname" value ='+parseJson.country+' /></td>';
		    		var cityvar = '<td><input type="text" style="width:40px;" name="fname" value ='+parseJson.country+' '+parseJson.city+' /></td>';
		    		var ispvar = '<td><input type="text" style="width:40px;" name="fname" value ='+parseJson.isp+' /></td>';
		    		var findtimevar = '<td><input type="text" style="width:100px;" name="fname" value ='+parseJson.findTime+' /></td>';
					
					var clickvar='<td ><a href="#">返回</a> | <a href="javascript:;" onclick ="save('+obj+')">保存</a></td>'
		    		
		    		var html = '<td>'+ obj+'</td>'+ipvar+iportvar+countryvar+cityvar+ispvar+findtimevar+'<td>完成</td>'+clickvar;
		    		$(test).empty();
		    		$(test).append(html);
		    	//alert(data);
		    	},
		    	error: function(textStatus){ 
		    		alert(textStatus);
	              return;  
	       		 }  
		    });
		    
		    
	   }
	
	    $(function () {
	      var data = ["a", "b", "c", "d"];
	      var html = '<td>${items.id }</td><td></td><td></td><td></td><td></td><td></td><td></td><td>进行中</td><td>完成</td>';
	      /* for (var i = 0; i < data.length; i ++) {
	        html += "<td>" + data[i] + "</td>";
	      } */
	      $("#row").empty();
	      $("#row").append(html);
	      
	    });
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
	   /*  function queryItems(){
	    	var item = $("#item").val();
	    	var principal =$("#principal").val();
	    	var phonenumber =$("#phonenumber").val();
	    	var selectCorol =$(".selectCorol").val();
	    	var params ={
	    			"item":item,
	    			"principal":principal,
	    			"selectCorol":selectCorol
	    		} */
	    	
	    	<%-- $.ajax({
	    		url:"<%=basePath%>rolefind.shtml?adm="+new Date().getTime(),
	    		type:"post",
	    		data:params,
	    		dataType:"json",
	    		success:function(data){
	    		/* alert(data) */
	    			var data =JSON.stringify(data);
	    			console.log(data)
	    		 }
	    	}); --%>
	    	
	    
	  </script>
	</head>

	<body>
		<!-- topbar starts -->
		<div class="navbar navbar-default" role="navigation">

			<div class="navbar-inner">
				<button type="button" class="navbar-toggle pull-left animated flip">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
            	</button>
				<a class="navbar-brand" href="index.html"> <img alt="Charisma Logo" src="${ctx}/img/logo20.png" class="hidden-xs" />
					<span>outuo</span></a>

				<!-- user dropdown starts -->
				<div class="btn-group pull-right">
					<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> admin</span>
	                    <span class="caret"></span>
                	</button>
					<ul class="dropdown-menu">
						<li>
							<a href="#">Profile</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="login.html">Logout</a>
						</li>
					</ul>
				</div>
				<!-- user dropdown ends -->

				<!-- theme selector starts -->
				
				<!-- theme selector ends -->

			</div>
		</div>
		<!-- topbar ends -->
		<div class="ch-container">
			<div class="row">

				<!-- left menu starts -->
				<div class="col-sm-2 col-lg-2">
					<div class="sidebar-nav">
						<div class="nav-canvas">
							<div class="nav-sm nav nav-stacked">

							</div>
							<ul class="nav nav-pills nav-stacked main-menu">
								<!--<li class="nav-header">Main</li>-->
								<li>
									<a class="ajax-link" href="index.html"><i class="glyphicon glyphicon-home"></i><span>&nbsp;项目管理</span></a>
								</li>
								<li>
									<a class="ajax-link" href="task.html"><i class="glyphicon glyphicon-eye-open"></i><span>&nbsp;任务派发</span></a>
								</li>
								<li>
									<a class="ajax-link" href="items.html"><i class="glyphicon glyphicon-edit"></i><span>&nbsp;物料管理</span></a>
								</li>

							</ul>
							<!-- <label id="for-is-ajax" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>-->
						</div>
					</div>
				</div>
				<!--/span-->
				<!-- left menu ends -->

				<noscript>
	            <div class="alert alert-block col-md-12">
	                <h4 class="alert-heading">Warning!</h4>
	
	                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
	                    enabled to use this site.</p>
	            </div>
       		 </noscript>

				<div id="content" class="col-lg-10 col-sm-10">
					<!-- content starts     iframe -->
					<div class="search">
	    <form action="<%=basePath%>rolefind.shtml" method="post">
	   <a> 项目名称：<input type="text" name="item" id="item"/></a>
	   <a> 负责人：<input type="text" name="principal" id="principal"/></a>
	   <a> 联系人：<input type="number" name="phonenumber" id="phonenumber"/></a>
	   <a><label class="control" for="ds_status" >状态</label>
							
			<select class="selectCorol" id="ds_status" name="itemsCustom.name" style="padding:8px;"  >
				<option value="-1">待定</option>
				<option value="0">正在进行</option>
				<option value="1">已经完成</option>
			</select>
	   </a>
	   <a><input type="submit" value="查询"  /></a>
	 </form>
	   <a href="add.html" title="" class="btn btn-primary addBtn" role="button">项目添加</a>
	   
	   </div>
			
		
		<div class="clear"></div>
		<div class="entry entry-content">
		   <br/>
			<!--  <div class="entry-title">最新100个可用免费高速HTTP代理IP</div> -->
				 
				<div id="list">
					<table class="table">
						<thead>
							<tr>
							    <th>id</th>
								<th>项目名称</th>
								<th>部件</th>
								<th>型号</th>
								<th>品牌</th>
								<th>单价</th>
								<th>数量</th>					
								<th>剩余时间</th>
								<th>计划交货</th>
								<th>实际交货</th>
								<th>状态</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id='tr1' >
							
							<!-- <tr id="list1" >
							    <td>进行中</td>
								<td>进行中苏打水SF的酚AF分</td>
								<td>进行中</td>
								<td>进行中</td>
								<td>进行中</td>
								<td>进行中</td>
								<td>进行中</td>
								<td><a style ='strong' href="https://www.baidu.com/">链接</a></td>
								<td>进行中</td>
								<td>进行中</td>
								<td>进行中</td>
								<td>进行中但是故事的故事的故事</td>
								<td style="font-weight:bold" id =1><a href="#">查看</a> | <a href="#">删除</a> | <a id='' href="javascript:;" onclick ="change(1)">编辑</a></td>
							</tr>							 -->
							<c:forEach items="${itemList }" var="items" >
							<tr id="list${items.id }" >
							   	<td>${items.id}</td>
								<td>${items.ip }</td>
								<td>${items.port }</td>
								<td>${items.country }</td>
								<td>${items.province }</td>
								<td> ${items.city }</td>
								<td>${items.isp }</td>
								<td>${items.findTime }</td>
								<td>进行中</td>
								<td>进行中</td>
								<td>进行中</td>
								<td></td>
								<td style="font-weight:bold" id =${items.id }><a href="view.html?id=${ items.id}">查看</a> | <a href="#" onclick="del('${ items.id}')">删除</a> | <a href="edit.html?id=${ items.id}">编辑</a></td>
							</tr>							
							</c:forEach>

						</tbody>
					</table>
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

		
	</body>

</html>