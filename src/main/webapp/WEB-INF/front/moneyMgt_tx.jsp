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

<title>用户中心_资金管理_提现</title>

<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="static/public/css/frontCss/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="static/public/js/frontJs/hm.js"></script>
<script type="text/javascript" src="static/public/js/frontJs/common.js"></script>
<script type="text/javascript" src="static/public/js/frontJs/user.js"></script>
<script type="text/javascript">
//收藏本站 bbs.ecmoban.com
function AddFavorite(title, url) {
  try {
      window.external.addFavorite(url, title);
  }
catch (e) {
     try {
       window.sidebar.addPanel(title, url, "");
    }
     catch (e) {
         alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
     }
  }
}
</script>
</head>

<body>

	<!-- 页面头部引用  begin -->
	<jsp:include page="header.jsp" />
	<!-- 页面头部引用 end -->

	<div class="block clearfix">
		<div class="box">
		 <div id="ur_here">
		当前位置: <a href="http://www.itying.com/">首页</a> <code>&gt;</code> 用户中心 
		</div>
		</div>
		<div class="blank"></div>  
		  <div class="AreaL">
			<div class="box">
			 <div class="box_1">
			  <div class="userCenterBox">
				<div class="userMenu">
		<a href="http://www.itying.com/user.php"><img src="static/public/images/frontImages/u1.gif"> 欢迎页</a>
		<a href="http://www.itying.com/user.php?act=profile"><img src="static/public/images/frontImages/u2.gif"> 用户信息</a>
		<a href="http://www.itying.com/user.php?act=order_list"><img src="static/public/images/frontImages/u3.gif"> 我的订单</a>
		<a href="http://www.itying.com/user.php?act=address_list"><img src="static/public/images/frontImages/u4.gif"> 收货地址</a>
		<a href="http://www.itying.com/user.php?act=collection_list"><img src="static/public/images/frontImages/u5.gif"> 我的收藏</a>
		<!--
		<a href="user.php?act=message_list"><img src="themes/itying/images/u6.gif"> 我的留言</a>

		<a href="user.php?act=tag_list"><img src="themes/itying/images/u7.gif"> 我的标签</a>

		<a href="user.php?act=booking_list"><img src="themes/itying/images/u8.gif"> 缺货登记</a>
		<a href="user.php?act=bonus"><img src="themes/itying/images/u9.gif"> 我的红包</a>
		-->



		<a href="http://www.itying.com/user.php?act=affiliate"><img src="static/public/images/frontImages/u10.gif"> 我的推荐</a><a href="http://www.itying.com/user.php?act=comment_list"><img src="static/public/images/frontImages/u11.gif"> 我的评论</a>
		<!--<a href="user.php?act=group_buy">我的团购</a>-->
		<!--
		<a href="user.php?act=track_packages"><img src="themes/itying/images/u12.gif"> 跟踪包裹</a>
		-->
		<a href="http://www.itying.com/user.php?act=account_log"><img src="static/public/images/frontImages/u13.gif"> 资金管理</a>
		<a href="http://www.itying.com/user.php?act=logout" style="background:none; text-align:right; margin-right:10px;"><img src="static/public/images/frontImages/bnt_sign.gif"></a>
		</div>      </div>
			 </div>
			</div>
		  </div>
		  
		  
		  <div class="AreaR">
			<div class="box">
			 <div class="box_1">
			  <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
					  <script type="text/javascript">
							  var surplus_amount_empty = "请输入您要操作的金额数量！";
							  var surplus_amount_error = "您输入的金额数量格式不正确！";
							  var process_desc = "请输入您此次操作的备注信息！";
							  var payment_empty = "请选择支付方式！";
						  </script>
				<h5><span>会员余额</span></h5>
				<div class="blank"></div>
				 <table bgcolor="#dddddd" border="0" cellpadding="5" cellspacing="1" width="100%">
				  <tbody><tr>
					<td align="right" bgcolor="#ffffff"><a href="http://www.itying.com/user.php?act=account_deposit" class="f6">充值</a> | <a href="http://www.itying.com/user.php?act=account_raply" class="f6">提现</a> | <a href="http://www.itying.com/user.php?act=account_detail" class="f6">查看帐户明细</a> | <a href="http://www.itying.com/user.php?act=account_log" class="f6">查看申请记录</a> </td>
				  </tr>
				</tbody></table>
								<form name="formSurplus" method="post" action="user.php" onsubmit="return submitSurplus()">
				<table bgcolor="#dddddd" border="0" cellpadding="5" cellspacing="1" width="100%">
				  <tbody><tr>
					<td bgcolor="#ffffff" width="15%">提现金额:</td>
					<td align="left" bgcolor="#ffffff"><input name="amount" class="inputBg" size="30" type="text">
					</td>
				  </tr>
				  <tr>
					<td bgcolor="#ffffff">会员备注:</td>
					<td align="left" bgcolor="#ffffff"><textarea name="user_note" cols="55" rows="6" style="border:1px solid #ccc;"></textarea></td>
				  </tr>
				  <tr>
					<td colspan="2" align="center" bgcolor="#ffffff">
					<input name="surplus_type" value="1" type="hidden">
					  <input name="act" value="act_account" type="hidden">
					  <input name="submit" class="bnt_blue_1" value="提交申请" type="submit">
					  <input name="reset" class="bnt_blue_1" value="重置表单" type="reset">
					</td>
				  </tr>
				</tbody></table>
				</form>

			  </div>
			 </div>
			</div>
		  </div>
		  
		</div>

	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->

</body>
</html>
