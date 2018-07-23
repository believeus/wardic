<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />

<title>用户注册</title>

<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="static/public/css/frontCss/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/static/public/js/jquery.js"></script>
<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
<script type="text/javascript">
	$().ready(function() {

		var $inputForm = $("#formUser");
		// 表单验证
		$inputForm.validate({
			rules : {
				username : {
					required : true,
					rangelength:[5,16],
					remote:"/is_registered_un.jhtml"
				},
				email : {
					email:true,
					required : true,
					remote:"/is_registered_el.jhtml"
				},
				password : {
					required : true
				},
				confirm_password : {
					required : true,
					equalTo : "#password"
				}
			},
			messages : {
				username : {
					required : "<font color='#FF0000'>请填写用户名</font>",
					rangelength : "<font color='#FF0000'>输入长度必须介于 5 和 16 之间的字符串（汉字算一个字符）。</font>",
					remote: "<font color='#FF0000'>用户名已存在，请重新输入</font>"
				},
				email : {
					email:"<font color='#FF0000'>请填写正确Email格式</font>",
					required : "<font color='#FF0000'>请填写邮箱</font>",
					remote: "<font color='#FF0000'>邮箱已存在，请重新输入</font>"
				},
				password : {
					required : "<font color='#FF0000'>请填写密码</font>",
				},
				confirm_password : {
					required : "<font color='#FF0000'>请确认密码</font>",
					equalTo : "<font color='#FF0000'>两次输入密码不一致</font>"
				}
			},
			 submitHandler:function(form){
		           form.submit();
		        }    
		});

	});
</script>
</head>
<body>
	<!-- 页面头部引用  begin -->
	<jsp:include page="header.jsp" />
	<!-- 页面头部引用 end -->
	<div class="block box">
		<div id="ur_here">
			<div class="box">
				<div id="ur_here">
					当前位置: <a href=".">首页</a>
					<code>&gt;</code>
					用户注册
				</div>
			</div>
			<div class="blank"></div>
		</div>
	</div>
	<div class="blank"></div>
	<div class="usBox clearfix">
		<div class="regtitle">用户注册</div>
		<div class="usBox_2 f_l clearfix">
			<form action="/register/save.jhtml" method="post" id="formUser" enctype="multipart/form-data">
				<table width="100%" border="0" align="left" cellpadding="5" cellspacing="3">
					<tr>
						<td width="13%" align="right">用户名</td>
						<td width="87%">
							<input name="username" type="text" size="25" id="username" class="inputBg" /> 
						</td>
					</tr>
					<tr>
						<td align="right">邮&nbsp;&nbsp;&nbsp;&nbsp;箱</td>
						<td>
							<input name="email" type="text" size="25" id="email" class="inputBg" /> 
						</td>
					</tr>
					<tr>
						<td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
						<td>
						<input name="password" type="password" id="password" class="inputBg" style="width:179px;" /> 
						</td>
					</tr>
					<tr>
						<td align="right">确认密码</td>
						<td>
							<input name="confirm_password" type="password" id="conform_password" class="inputBg" style="width:179px;" />
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="left">
							<input type="submit" value="" class="us_Submit_reg" />
						</td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td class="actionSub"><a href="/login.jhtml">我已有账号，我要登录</a><br />
							<a href="findPassword.jhtml">您忘记密码了吗？</a></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="usTxt" style="padding-top:60px; padding-bottom:60px;">
			<strong>如果您是会员，请登录</strong> <br /> <strong class="f4">友情提示：</strong><br />
			您已经有本站账户请登录 <br />
			<br /> <a href="/login.jhtml"><img src="/static/public/images/bnt_ur_log.gif" /></a>
		</div>
	</div>
	<div class="blank"></div>
	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->
</body>
</html>
