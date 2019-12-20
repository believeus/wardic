<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>编程大典</title>
<script src="static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="static/ckeditor/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace('editor', {
			<shiro:notAuthenticated> 
			readOnly : true,
			</shiro:notAuthenticated> 
			extraPlugins : 'imagepaste,uploadimage,image2,mathjax',
			height : 600,
			mathJaxLib : 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
			uploadUrl : 'upload.jhtml',
		})
		 var data={};
     	 data.id=${id};
		 $.post("<%=basePath%>findData.jhtml",data,function(msg){
			 CKEDITOR.instances.editor.setData(msg)
		 });
	});
</script>
</head>

<body style="padding: 0px;margin: 0px">
	<div style="height: 100%;width: 100%;background-color:white;">
		<shiro:authenticated> <div id="menu" style="width: 100%;border:1px solid grey;height: 4%; "></div></shiro:authenticated>
		<div id="editor" style="width: 100%;height: 100%;"></div>
	</div>
</body>
</html>
