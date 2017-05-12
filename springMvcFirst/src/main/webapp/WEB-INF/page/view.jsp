<%@page import="com.fp.ssm.common.PageParam"
	import="com.fp.ssm.po.TableIpShowVo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/page/include/taglib.jsp"%>
<%-- <%
	request.setAttribute("domain", "http://localhost/spTest/");
%> --%>

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

		$
				.ajax({
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
		/* var data = [ "a", "b", "c", "d" ];
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
	});
</script>
</head>

<body>
	<!-- topbar starts -->
	<div class="navbar navbar-default" role="navigation">

		<div class="navbar-inner">
			
			<a class="navbar-brand" href="index.html"> <img
				alt="Charisma Logo" src="${ctx}/img/logo20.png" class="hidden-xs" />
				<span>outuo</span></a>

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
				<!-- content starts     iframe -->
				<div class="showView">
					<div class="bg text-muted">
						<a href="index.html ">首页</a>&nbsp;/&nbsp;项目查看
					</div>

					<div class="row">

						<div class="col-sm-2 text-danger">ID:</div>
						<div class="col-sm-3">${user.id }</div>
						<div class="col-sm-2 col-sm-offset-2 text-danger">负责人:</div>
						<div class="">${user.ip}</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">项目名称:</div>
						<div class="col-sm-3">${user.port }</div>
						<div class="col-sm-2 col-sm-offset-2 text-danger">数量:</div>
						<div class="">${user.country}</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">金额:</div>
						<div class="col-sm-3">${user.province }</div>
						<div class="col-sm-2 col-sm-offset-2 text-danger">部门:</div>
						<div class="">${user.isp }</div>

					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">联系人:</div>
						<div class="col-sm-3">${user.city }</div>
						<div class="col-sm-2 col-sm-offset-2 text-danger">剩余时间:</div>
						<div class="retime"></div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">交貨時間:</div>
						<div class="col-sm-3" id="protime"><fmt:formatDate value="${user.findTime}" pattern="yyyy/MM/dd"/></div>
						<div class="col-sm-2 col-sm-offset-2 text-danger">状态:</div>
						<div class="">进行中</div>
					</div>

				</div>
				<!-- content end -->
			</div>
		</div>
	</div>
	<!--/.fluid-container-->

	<!-- external javascript -->

	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


</body>

</html>