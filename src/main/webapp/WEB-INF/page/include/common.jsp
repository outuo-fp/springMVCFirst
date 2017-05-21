<%@page import="com.fp.ssm.common.PageParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<!-- 引入日期控件 -->
<script src="${ctx}/bower_components/laydate/laydate.js"></script>
		
	
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
		<!-- content 内容开始 -->		
	
