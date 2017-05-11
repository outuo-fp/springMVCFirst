<%@page import="com.fp.ssm.common.PageParam"
	import="com.fp.ssm.po.TableIpShowVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/page/include/taglib.jsp"%>
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
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<!-- The styles -->
<link id="bs-css" href="${ctx}/css/bootstrap-cerulean.min.css"
	rel="stylesheet">

<link href="${ctx}/css/charisma-app.css" rel="stylesheet">


<link rel="stylesheet" type="text/css" href="${ctx}/css/index.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.min.css">
<!-- jQuery -->


<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="${ctx}/img/favicon.ico">
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript">
	function change(obj) {
		var test = '#list' + obj;
		var test1 = "${tbList[1].ip }";
		var user = {
			"tableIp.id" : obj
		};
		//alert(${tbList[obj].ip });
		//alert(test );

	
					$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath }/find.shtml",
					data : user,
					success : function(data) {
						var parseJson = $.parseJSON(data);
						alert(parseJson.findTime);

						var ipvar = '<td><input type="text" style="width:80px;" name="fname" value ='+parseJson.ip+' /></td>';
						var iportvar = '<td><input type="text" style="width:40px;" name="fname" value ='+parseJson.port+' /></td>';
						var countryvar = '<td><input type="text" style="width:40px;" name="fname" value ='+parseJson.country+' /></td>';
						var cityvar = '<td><input type="text" style="width:40px;" name="fname" value ='+parseJson.country+' '+parseJson.city+' /></td>';
						var ispvar = '<td><input type="text" style="width:40px;" name="fname" value ='+parseJson.isp+' /></td>';
						var findtimevar = '<td><input type="text" style="width:100px;" name="fname" value ='+parseJson.findTime+' /></td>';

						var clickvar = '<td ><a href="#">返回</a> | <a href="javascript:;" onclick ="save('
								+ obj + ')">保存</a></td>'

						var html = '<td>' + obj + '</td>' + ipvar + iportvar
								+ countryvar + cityvar + ispvar + findtimevar
								+ '<td>完成</td>' + clickvar;
						$(test).empty();
						$(test).append(html);
						//alert(data);
					},
					error : function(textStatus) {
						alert(textStatus);
						return;
					}
				});

	}

	$(function() {
		var data = [ "a", "b", "c", "d" ];
		var html = '<td>${items.id }</td><td></td><td></td><td></td><td></td><td></td><td></td><td>进行中</td><td>完成</td>';
		/* for (var i = 0; i < data.length; i ++) {
		  html += "<td>" + data[i] + "</td>";
		} */
		$("#row").empty();
		$("#row").append(html);

	});
	function updateUser(){
		var form =document.forms[0];
		form.action = "<%=basePath%>saveOrUpdate.shtml";
	    form.method="post";  
	    form.submit();  
	}
</script>
</head>

<body>
	<!-- topbar starts -->
	<div class="navbar navbar-default" role="navigation">

		<div class="navbar-inner">
			<button type="button" class="navbar-toggle pull-left animated flip">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="blank.html"> <img
				alt="Charisma Logo" src="${ctx}/img/logo20.png" class="hidden-xs" />
				<span style="color:#fff;">Charisma</span></a>

			<!-- user dropdown starts -->
			<div class="btn-group pull-right">
				<button class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i><span
						class="hidden-sm hidden-xs"> admin</span> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">Profile</a></li>
					<li class="divider"></li>
					<li><a href="login.html">Logout</a></li>
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
						<div class="nav-sm nav nav-stacked"></div>
						<ul class="nav nav-pills nav-stacked main-menu">
							<!--<li class="nav-header">Main</li>-->
							<li><a class="ajax-link" href="index.html"><i
									class="glyphicon glyphicon-home"></i><span>&nbsp;项目管理</span></a>
							</li>
							<li><a class="ajax-link" href="task.html"><i
									class="glyphicon glyphicon-eye-open"></i><span>&nbsp;任务派发</span></a>
							</li>
							<li><a class="ajax-link" href="items.html"><i
									class="glyphicon glyphicon-edit"></i><span>&nbsp;物料管理</span></a>
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

					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="col-lg-10 col-sm-10">
				<!--         content starts     iframe      -->
				<form class="form-horizontal" role="form">
					
					<fieldset>
					<input type="hidden" name="id" value="${userEdit.id}"/>
						<legend class="text-center"
							style="padding: 2px;background-color: #eeeeee;" >用户编辑</legend>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_host" >项目名称</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_host" type="text"
									value="${userEdit.port }" name="port"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_name">负责人</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_name" type="text"
									value="${userEdit.ip}" name="ip"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_count">数量</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_count" type="text"
									value="${userEdit.city }" name="city"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_money">金额</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_money" type="text"
									value="${userEdit.province }" name="province"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_department">部门</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_department" type="text"
									value="${userEdit.isp}" name="isp"/>
							</div>
							<label class="col-sm-2 control-label" for="ds_contacts">联系人</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_contacts" type="text"
									value="${userEdit.country}" name="country" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ds_time">剩余时间</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_time" type="text"
									placeholder="root" id="disabledInput" value="${userEdit.findTime}" disabled/>
							</div>
							<label class="col-sm-2 control-label" for="ds_stime">交货时间</label>
							<div class="col-sm-4">
								<input class="form-control" id="ds_stime" type="date"
									value="${userEdit.findTime}" />
							</div>
							<label class="col-sm-2 control-label" for="ds_status"
								style="margin-top: 13px;">状态</label>
							<div class="col-sm-10" style="margin-top: 13px;">
								<select class="form-control" id="ds_status">
									<option value="正在进行">正在进行</option>
									<option value="已经完成">已经完成</option>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-12 text-center bg-danger"
								style="padding: 2px;background-color: #eeeeee;">
								<a href="#" class="btn btn-primary active" role="button" onclick="updateUser()">&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;</a>
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