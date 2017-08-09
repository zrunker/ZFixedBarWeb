<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>固定栏</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="固定栏zrunker">
<meta http-equiv="description" content="web前端固定栏效果，上固定栏和侧边固定栏。">
<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.min.js"></script>
	<script type="text/javascript" src="js/respond.min.js"></script>
<![endif]-->

<style type="text/css">
html {
	outline: none;
	padding: 0;
	margin: 0;
	border: none;
	height: 100%;
}

body {
	outline: none;
	padding: 0;
	margin: 0;
	border: none;
	height: 100%;
	font-size: 30px;
}

#top,.fixed_top,#content {
	float: left;
}

#top {
	width: 100%;
	height: 200px;
	background-color: red;
}

.fixed_top {
	background-color: aqua;
	width: 80%;
	height: 100px;
	margin: 20px 10%;
}

#fixed_top_hide {
	display: none;
}

#content {
	width: 80%;
	margin: 20px 10%;
	min-height: 800px;
}

#content_left {
	float: left;
	height: 500px;
	width: 75%;
	background-color: blue;
}

#content_right {
	float: right;
	height: 300px;
	width: 20%;
	background-color: fuchsia;
}
</style>
</head>
<body>
	<!-- 顶部 -->
	<div id="top">顶部</div>
	<!-- 固定顶部 -->
	<div id="top_nav" class="fixed_top">固定顶部栏</div>
	<div id="fixed_top_hide" class="fixed_top">固定顶部栏隐藏</div>
	<!-- 内容区 -->
	<div id="content">
		<div id="content_left">内容区左侧</div>
		<div id="content_right">内容区右侧固定</div>
	</div>
</body>
<!-- 引入jQuery -->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
/* jQuery实现 */
$(function(){
	// 获取window窗体
	var jWindow = $(window);
	
	// 获取右侧固定栏到浏览器顶部的距离
	var elmStartPos = $("#content_right").offset().top;
	<%--Window滚动事件监听-实现右侧固定--%>
	jWindow.scroll(function () {
		// 获取滚动条到顶部的高度
		var p = $(window).scrollTop();
		if (p >= elmStartPos) {
			$("#content_right").css({
				"position": "fixed",// position固定定位
				"width": (0.8 * 0.2 * 100) + "%",// 重置宽度
				"top": 0,// 距离浏览器顶部0
				"right": "10%"// 设置到右边的距离
			});
		} else {
			$("#content_right").css({
				"position": "static",// position默认状态
				"width": "20%"// 重置宽度
			});
		}
	});
});
</script>
</html>
