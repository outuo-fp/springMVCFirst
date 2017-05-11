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
<title>信息管理系统</title>
<link rel="stylesheet" type="text/css" href="css/index.min.css">
<link rel="stylesheet" type="text/css" href="css/select.css">
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
   
  
	function change(obj) {
		//alert(obj.parentNode.parentNode.id)
		//var html = '<input name="itemsCustom.name" value="hello" />';
		/*    $.post("find.html",
			    {
			      id:7
			    },
			    function(data,status){
			      alert("数据：" + data + "\n状态：" + status);
			    }); */
	    var html = '<td >${tableIpEx.id }</td><td >${tableIpEx.id }</td><td>${tableIpEx.id }</td><td>编辑</td><td>编辑</td><td>编辑</td><td>编辑</td><td>进行中</td><td style="font-weight:bold">编辑</td>';
		$('#1').html(html);    
	}

	$(function() {
		var data = [ "a", "b", "c", "d" ];
		var html = '<input name="itemsCustom.name" value="hello" />';
		/* for (var i = 0; i < data.length; i ++) {
		  html += "<td>" + data[i] + "</td>";
		} */
		$("#row").empty();
		$("#row").append(html);

	});
</script>
</head>
<body>

	<!-- head -->
	<div id="page-header" class="wrap header">
		<header id="masthead" class="site-header" role="banner">
			 <div class="hgroup">
				<h1 class="site-title">
					<a class="home-link" href="index.html" title="信息管理系统" rel="home">信息管理系统</a>							
				</h1>
				<h2 class="site-description" id="site-description">
				苏州欧拓电子科技有限公司
				</h2>
			</div>
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
						<a href="index.html">项目管理</a>
					</li>
					<li id="menu_api" class="menu-item menu-item-type-taxonomy menu-item-object-custom ">
						<a href="fetch.html">物料管理</a>
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
	   <div>
	   <a> 项目名称：<input name="itemsCustom.name" value="hello" /></a>
	   <a> 商品名称：<input name="itemsCustom.name" /></a>
	   <a> 商品名称：<input name="itemsCustom.name" /></a>
	   <a>商品名称：<input name="itemsCustom.name" /></a>
	   <a><input type="button" value="查询" onclick="queryItems()" /></a>
	   </div>
		<!-- <table width="100%" border=1>
			<tr>
			 <td>商品名称：</td>
			 <td><input name="itemsCustom.name" />
			</td>
			<td>商品名称：<input name="itemsCustom.name" />
			</td>
			<td>商品名称：<input name="itemsCustom.name" />
			</td>
			<td>商品名称：<input name="itemsCustom.name" />
			</td>
			</tr>
			<tr >
			<td><input type="button" value="查询" onclick="queryItems()" />
		     <input type="button" value="批量修改提交" onclick="editItemsAllSubmit()" /></td>
			</tr>
		</table>  -->

					<!-- <blockquote style="font-style:normal;">
				<p><b style="font-size: 14px;">你们的代理IP是怎么获取到的？</b></p>
				<p>① 全网代理IP使用5台4核ECS服务器，运行分布式IP与端口扫描系统，每天扫描IP量几十万条。</p>
				<p>② 我们不间断的运行着IP验证系统，精确地检测每一个代理IP的匿名度、响应时间、数据传输速度、地域、运营商，每秒钟都在验证，保证网站的IP都是高度可用的。</p>
				<p>③ 我们提供了极其丰富的代理筛选和API接口，每次提取的IP不相同，只为更便捷地提取、更便捷的开发。</p>
			</blockquote> -->
			
		
		<div class="clear"></div>
		<div class="entry entry-content">
		   <br/>
			<!--  <div class="entry-title">最新100个可用免费高速HTTP代理IP</div> -->
				 
				<div id="list">
					<table class="table">
						<thead>
							<tr>
							    <th>id</th>
								<th>负责人</th>
								<th>项目名称</th>
								<th>国家</th>
								<th>省市</th>
								<th>运营商</th>
								<th>创建时间</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id='tr1'>
							<tr id="${tableIpEx.id }">
							    <td >${tableIpEx.id }</td>
								<td >${tableIpEx.ip }</td>
								<td>${tableIpEx.port }</td>
								<td>${tableIpEx.country }</td>
								<td>${tableIpEx.province } ${tableIpEx.city }</td>
								<td>${tableIpEx.isp }</td>
								<td>${tableIpEx.findTime }</td>
								<td>进行中</td>
								<td style="font-weight:bold"><a href="#">查看</a> | <a href="#">删除</a> | <a href="javascript:;" onclick ="change(this)">编辑</a></td>
							</tr>							
							

						</tbody>
					</table>
					<input type="button" onclick="getInnerHTML()" value="Alert innerHTML of table row" />

					<div class="message" id="row">注：表中响应速度是中国测速服务器的测试数据，仅供参考。响应速度根据你机器所在的地理位置不同而有差异。</div>
					
					
				</div>
			</div>
		 </div> 
	</div>
	<div class="clear"></div>
	<div id="footer">
			<div class="copyright">
				<span class="footerleft">友情链接：
				<a href="http://www.baidu.com/" target="_blank" title="敲代码，IT技术任你学">敲代码</a>
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