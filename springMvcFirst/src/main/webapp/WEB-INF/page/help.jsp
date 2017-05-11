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
					<li id="menu_api" class="menu-item menu-item-type-taxonomy menu-item-object-custom ">
						<a href="fetch.html">API接口</a>
					</li>
					<li id="menu_help" class="menu-item menu-item-type-taxonomy menu-item-object-custom current-menu-item">
						<a href="help.html">帮助中心</a>
					</li>
					<li style="margin-right: 10px;" class="menu-item menu-item-type-taxonomy menu-item-object-custom right"><i class="qq-icon" style="cursor: pointer;" onclick="window.open('http://jq.qq.com/?_wv=1027&amp;k=VFVEFs','_blank')"></i>QQ群：66782959 </li>
				</ul>
			</nav>
		</div>
	</div>

<!-- body -->
<div class="entry entry-content">
        <h3 class="replace_title">代填申请快递</h3>
        <table class="table">
            <tr>
                <td colspan="6" class="head">申请人信息</td>

            </tr>
            <tr>
                <td class="first">申请人：</td>
                <td class="input"><input type="text" name="name" value=" " /></td>
                <td class="first">部门：</td>
                <td class="input"><input type="text" name="name" value=" " /></td>
                <td class="first">手机：</td>
                <td class="input"><input type="text" name="name" value=" " /></td>
            </tr>
            <tr>
                <td class="first" >代填人：</td>
                <td class="input" colspan="5"><input type="text" name="name" value=" " /></td>
            </tr>
            <tr>
                <td colspan="6" class="head">收件人信息</td>

            </tr>
            <tr>
                <td class="first">收件人<span class="xing">*</span>：</td>
                <td class="input"><input type="text" name="name" value=" " /></td>
                <td class="first">手机<span class="xing">*</span>：</td>
                <td class="input" colspan="4"><input type="text" name="name" value=" " /></td>
            </tr>
            <tr>
                <td colspan="6" class="head">快递信息</td>

            </tr>
            <tr>
                <td class="first">快递区域<span class="xing">*</span>：</td>
                <td class="input">
                    <select class="replace_range">
                        <option value="value">请选择</option>
                        <option class="replace_civil">国内</option>
                        <option class="replace_abroad">国外</option>
                    </select>
                    <select class="replace_proaddr">
                        <option>请选择</option>
                        <option>北京</option>
                        <option>天津</option>
                        <option>上海</option>
                        <option>广州</option>
                        <option>福建</option>
                        <option>山东</option>
                        <option>辽宁</option>
                        <option>山西</option>
                        <option>河南</option>
                        <option>河北</option>
                        <option>黑龙江</option>
                        <option>大连</option>
                    </select>
                    <select class="replace_counaddr">
                        <option>请选择</option>
                        <option>美国</option>
                        <option>法国</option>
                        <option>英国</option>
                        <option>日本</option>
                        <option>俄国</option>
                        <option>墨西哥</option>
                        <option>巴黎</option>
                        <option>韩国</option>
                    </select>
                </td>
                <td class="first">快递类型<span class="xing">*</span>：</td>
                <td class="input">
                    <select>
                        <option value="value">请选择</option>
                        <option value="value">文件</option>
                        <option value="value">其他</option>
                    </select>
                </td>
                <td class="first">快递公司<span class="xing">*</span>：</td>
                <td class="input">
                    <select>
                        <option value="value">请选择</option>
                        <option value="value">EMS</option>
                        <option value="value">顺丰</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="first">邮编<span class="xing">*</span>：</td>
                <td class="input"><input type="text" name="name" value=" " /></td>
                <td class="first">邮寄地址<span class="xing">*</span>：</td>
                <td colspan="4" class="input"><input class="addr" type="text" name="name" value=" " /></td>

            </tr>
            <tr>
                <td colspan="6" class="head">申请说明</td>
            </tr>
            <tr>
                <td class="secend" style="height:60px;" colspan="6">
                    <textarea rows="4" cols="131" style="resize:none;"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="6" class="head">备注</td>
            </tr>
            <tr>
                <td class="secend" style="height:60px;" colspan="6">
                    <textarea rows="4" cols="131" style="resize:none;"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="6" style="height:40px;">
                    <a href="javascript:;" class="easyui-linkbutton c1" style="width:50px;">提交</a>
                </td>
            </tr>
        </table>
    </div>
    <script>
        $(function () {
            $(".replace_proaddr").hide();
            $(".replace_counaddr").hide();
            1
        })
        $(".replace_range").change(function () {
            var name = $(this).val();
            console.log(name);
            if (name == "国内") {
                $(".replace_proaddr").show();
                $(".replace_counaddr").hide();
            } else if (name == "国外") {
                $(".replace_proaddr").hide();
                $(".replace_counaddr").show();
            } else if (name == "请选择") {
                $(".replace_proaddr").hide();
                $(".replace_counaddr").hide();
            }
        })
    </script>


</body>
</html>