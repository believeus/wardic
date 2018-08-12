<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编程攻略</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="padding: 0px;margin: 0px;background-color: #2d3e50;">
  	<div style="color: white;font-weight:bold;text-align: center;line-height: 80px;height: 80px;font-size: 75px;border-bottom: 1px solid grey;">编程大典</div>
    <div style="width: 100%;height: 100%;color: white;font-weight:bold;text-align: center;">
    	<div style="height: 200px;width: 100%;"></div>
    	<div>您当前浏览器是<span style="font-size: 60px;">IE</span>浏览器，该浏览器已经被时代所<span style="font-size: 60px;">淘汰</span>，故本站也不再不支持<span style="font-size: 60px;">IE</span>浏览器！</div>
    	<div>希望您<span style="font-size: 60px;">弃用IE浏览器</span>！为了更好的浏览效果，建议使用<span style="font-size: 60px;color: #ff8556;">火狐</span>或<span style="font-size: 60px;color: #ffce43;">Chrome</span>浏览器</div>
    </div>
  </body>
</html>
