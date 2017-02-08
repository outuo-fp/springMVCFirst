<%@page import="com.fp.ssm.common.PageParam"
		import="com.fp.ssm.po.TableIpShowVo"
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%
	request.setAttribute("domain", "http://localhost/spTest/");
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>代理IP提取系统</title>
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
					<li id="menu_index" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item">
						<a href="index.html">首页</a>
					</li>
					<li id="menu_api" class="menu-item menu-item-type-taxonomy menu-item-object-custom ">
						<a href="fetch.html">API接口</a>
					</li>
					<li id="menu_help" class="menu-item menu-item-type-taxonomy menu-item-object-custom">
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
	<div id="post-2" class="post-2 page type-page status-publish hentry">
		<div class="entry entry-content">
			<blockquote style="font-style:normal;">
				<p><b style="font-size: 14px;">你们的代理IP是怎么获取到的？</b></p>
				<p>① 全网代理IP使用5台4核ECS服务器，运行分布式IP与端口扫描系统，每天扫描IP量几十万条。</p>
				<p>② 我们不间断的运行着IP验证系统，精确地检测每一个代理IP的匿名度、响应时间、数据传输速度、地域、运营商，每秒钟都在验证，保证网站的IP都是高度可用的。</p>
				<p>③ 我们提供了极其丰富的代理筛选和API接口，每次提取的IP不相同，只为更便捷地提取、更便捷的开发。</p>
			</blockquote>
		</div>
		<div class="clear"></div>
		<div class="entry entry-content">
			<div class="entry-title">最新100个可用免费高速HTTP代理IP</div>
				 
				<div id="list">
					<table class="table">
						<thead>
							<tr>
								<th>IP</th>
								<th>PORT</th>
								<th>国家</th>
								<th>省市</th>
								<th>运营商</th>
								<th>录入时间</th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${tbList }" var="items">
							<tr>
								<td>${items.ip }</td>
								<td>${items.port }</td>
								<td>${items.country }</td>
								<td>${items.province } ${items.city }</td>
								<td>${items.isp }</td>
								<td>${items.findTime }</td>
							</tr>							
							</c:forEach>

						</tbody>
					</table>
					<p class="message">注：表中响应速度是中国测速服务器的测试数据，仅供参考。响应速度根据你机器所在的地理位置不同而有差异。</p>
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
									%><a href="index.html?page=<%=i %>"><%=i %></a><%
								}
							}
						%>
						<span>页</span>
					</div>
				</div>
			</div>
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