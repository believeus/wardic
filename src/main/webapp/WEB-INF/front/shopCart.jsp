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

<title>用户中心_IT营</title>

<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="static/public/css/frontCss/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="static/public/js/frontJs/common.js"></script>
<script type="text/javascript" src="js/shopping_flow.js"></script>
</head>

<body>

	<!-- 页面头部引用  begin -->
	<jsp:include page="header.jsp" />
	<!-- 页面头部引用 end -->

	<div class="block table">
		<div class="box">
			<div id="ur_here">
				当前位置: <a href=".">首页</a>
				<code>&gt;</code>
				购物流程
			</div>
		</div>
		<div class="blank"></div>


		<script type="text/javascript" src="static/public/js/frontJs/showdiv.js"></script>
		<script type="text/javascript">
			var user_name_empty = "请输入您的用户名！";
			var email_address_empty = "请输入您的电子邮件地址！";
			var email_address_error = "您输入的电子邮件地址格式不正确！";
			var new_password_empty = "请输入您的新密码！";
			var confirm_password_empty = "请输入您的确认密码！";
			var both_password_error = "您两次输入的密码不一致！";
			var show_div_text = "请点击更新购物车按钮";
			var show_div_exit = "关闭";
		</script>
		<div class="flowBox">
			<div class="step_img">
				<img src="picture/order1.jpg" />
			</div>
			<h6>
				<span>您购买的课程</span>
			</h6>
			<form id="formCart" name="formCart" method="post" action="flow.php">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th bgcolor="#ffffff">商品名称</th>
						<th bgcolor="#ffffff">属性</th>
						<th bgcolor="#ffffff">本店价</th>
						<th bgcolor="#ffffff">购买数量</th>
						<th bgcolor="#ffffff">小计</th>
						<th bgcolor="#ffffff">操作</th>
					</tr>
				</table>
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<td bgcolor="#ffffff">购物金额小计 ￥0.00元</td>
						<td align="right" bgcolor="#ffffff"><input type="button"
							value="清空购物车" class="bnt_blue_1"
							onclick="location.href='flow.php?step=clear'" /> <input
							name="submit" type="submit" class="bnt_blue_1" value="更新购物车" />
						</td>
					</tr>
				</table>
				<input type="hidden" name="step" value="update_cart" />
			</form>
			<table width="99%" align="center" border="0" cellpadding="5"
				cellspacing="0" bgcolor="#dddddd">
				<tr>
					<td bgcolor="#ffffff"><a href="./"><img src="picture/continue.gif" alt="continue" /></a></td>
					<td bgcolor="#ffffff" align="right"><a href="flow.php?step=checkout"><img src="picture/checkout.gif" alt="checkout" /></a></td>
				</tr>
			</table>
		</div>
		<div class="blank"></div>

		<div class="blank5"></div>

	</div>

	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->

</body>
</html>
