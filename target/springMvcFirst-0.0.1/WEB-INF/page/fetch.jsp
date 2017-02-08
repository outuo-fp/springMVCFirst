<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setAttribute("domain", "http://localhost/spTest/");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>代理IP提取系统 帮助中心</title>
<link rel="stylesheet" type="text/css" href="css/index.min.css">
</head>
<body>

	<!-- head -->
	<div id="page-header" class="wrap header">
		<header id="masthead" class="site-header" role="banner">
			<div class="hgroup">
				<h1 class="site-title">
					<a class="home-link" href="index.html" title="代理IP提取系统" rel="home">代理IP提取系统</a>
				</h1>
				<h2 class="site-description" id="site-description">最便宜、最稳定、实时更新、API接口、实用软件</h2>
			</div>
			<div class="clear"></div>
		</header>
	</div>

	<!-- menu -->
	<div id="primary-nav">
		<div class="wrap nav">
			<nav id="site-navigation" class="main-navigation" role="navigation">
				<h3 class="menu-toggle">Menu</h3>
				<a class="assistive-text" href="#content" title="Skip to content">Skip to content</a>
				<ul class="nav-menu">
					<li id="menu_index" class="menu-item menu-item-type-custom menu-item-object-custom">
						<a href="index.html">首页</a>
					</li>
					<li id="menu_api" class="menu-item menu-item-type-taxonomy menu-item-object-custom current-menu-item">
						<a href="fetch.html">API接口</a>
					</li>
					<li id="menu_help" class="menu-item menu-item-type-taxonomy menu-item-object-custom ">
						<a href="help.html">帮助中心</a>
					</li>
					<li style="margin-right: 10px;" class="menu-item menu-item-type-taxonomy menu-item-object-custom right"><i class="qq-icon" style="cursor: pointer;" onclick="window.open('http://jq.qq.com/?_wv=1027&amp;k=VFVEFs','_blank')"></i>QQ群：66782959 </li>
				</ul>
			</nav>
		</div>
	</div>

<!-- body -->
<div class="wrap fullwidth">
	<div id="content" style="width: auto;">
		<div id="breadcrumbs">
			<a href="index.html">首页</a>»»&nbsp; 生成API提取接口
		</div>
		<div id="post-2" class="post-2 page type-page status-publish hentry">
			<div class="entry entry-content">
				
				<form id="fetchForm" class="largeinput" accept-charset="UTF-8" method="POST" target="_blank" action="get.html">
					<div class="control-group">
						<label class="control-label" for="name">提取数量</label>
						<div class="controls">
							<input id="num" type="text" name="num" class="span4 required" value="100" placeholder="填入数字,一次做多提取10000个">
							<span class="star">*&nbsp;</span><a href="help/" target="_blank">数量该怎么填?</a>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="name">所在国家</label>
						<div class="controls">
							<input id="num" type="text" name="country" class="span4 required" value="" placeholder="国家，比如中国">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="name">IP运营商</label>
						<div class="controls">
							<select name="isp">
								<option value="">不限</option>
								<option value="电信">电信</option>
								<option value="联通">联通</option>
								<option value="移动">移动</option>
								<option value="网通">网通</option>
							</select>
						</div>
					</div>					
					<div class="submit" style="margin-top: 22px; ">
						<span class="smallbutton"><a id="postcontent" href="javascript:fetchForm.submit();">提取IP</a></span>&nbsp;&nbsp;
						<a href="help/" target="_blank">我提取的代理都能用吗，能用多久？</a>
					</div>
				</form>		
				
				
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="clear"></div>
	<div id="footer">
			<div class="copyright">
				<span class="footerleft">友情链接：
				<a href="http://www.qiaodm.com/" target="_blank" title="敲代码，IT技术任你学">敲代码</a>
				<a href="http://ip.qiaodm.com/" target="_blank" title="敲代码免费代理IP">敲代码免费代理IP</a>
				<a href="http://proxy.goubanjia.com/" target="_blank" title="敲代码免费代理IP">全网代理IP</a>
				<a href="http://wantsee.cn" target="_blank" title="">想看就看</a>
				<a href="http://www.66ip.cn/index.html" target="_blank" title="">66代理</a>
			</span>
			<div class="clear"></div>
		</div>
		<div class="copyright" style="display: none;">
			<span class="footerleft">Copyright © 2015</span>
			<span class="footerright">All rights reserved</span>
			<div class="clear"></div>
		</div>
	</div>
</div>


</body>
</html>