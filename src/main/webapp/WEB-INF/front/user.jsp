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

<title>个人信息</title>

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
					<a href="http://www.itying.com/user.php?act=profile" class="curs"><img src="static/public/images/frontImages/u2.gif"> 用户信息</a>
					<a href="http://www.itying.com/user.php?act=order_list"><img src="static/public/images/frontImages/u3.gif"> 我的订单</a>
					<a href="http://www.itying.com/user.php?act=address_list"><img src="static/public/images/frontImages/u4.gif"> 收货地址</a>
					<a href="http://www.itying.com/user.php?act=collection_list"><img src="static/public/images/frontImages/u5.gif"> 我的收藏</a>
					
					<a href="http://www.itying.com/user.php?act=affiliate"><img src="static/public/images/frontImages/u10.gif"> 我的推荐</a>
					<a href="http://www.itying.com/user.php?act=comment_list"><img src="static/public/images/frontImages/u11.gif"> 我的评论</a>

					<a href="http://www.itying.com/user.php?act=account_log"><img src="static/public/images/frontImages/u13.gif"> 资金管理</a>
					<a href="http://www.itying.com/user.php?act=logout" style="background:none; text-align:right; margin-right:10px;"><img src="static/public/images/frontImages/bnt_sign.gif"></a>
					</div>     
				</div>
			 </div>
			</div>
		  </div>
		  
		  
		  <div class="AreaR">
			<div class="box">
			 <div class="box_1">
			  <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
				 
			  <script type="text/javascript">
				  var bonus_sn_empty = "请输入您要添加的红包号码！";
				  var bonus_sn_error = "您输入的红包号码格式不正确！";
				  var email_empty = "请输入您的电子邮件地址！";
				  var email_error = "您输入的电子邮件地址格式不正确！";
				  var old_password_empty = "请输入您的原密码！";
				  var new_password_empty = "请输入您的新密码！";
				  var confirm_password_empty = "请输入您的确认密码！";
				  var both_password_error = "您现两次输入的密码不一致！";
				  var msg_blank = "不能为空";
				  var no_select_question = "- 您没有完成密码提示问题的操作";
			  </script>
			  <h5><span>个人资料</span></h5>
			  <div class="blank"></div>
			 <form name="formEdit" action="user.php" method="post" onsubmit="return userEdit()">
			  <table bgcolor="#dddddd" border="0" cellpadding="5" cellspacing="1" width="100%">
						<tbody><tr>
						  <td align="right" bgcolor="#FFFFFF" width="28%">出生日期： </td>
						  <td align="left" bgcolor="#FFFFFF" width="72%"> <select name="birthdayYear"><option selected="selected" value="1955">1955</option><option value="1956">1956</option><option value="1957">1957</option><option value="1958">1958</option><option value="1959">1959</option><option value="1960">1960</option><option value="1961">1961</option><option value="1962">1962</option><option value="1963">1963</option><option value="1964">1964</option><option value="1965">1965</option><option value="1966">1966</option><option value="1967">1967</option><option value="1968">1968</option><option value="1969">1969</option><option value="1970">1970</option><option value="1971">1971</option><option value="1972">1972</option><option value="1973">1973</option><option value="1974">1974</option><option value="1975">1975</option><option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option><option value="1979">1979</option><option value="1980">1980</option><option value="1981">1981</option><option value="1982">1982</option><option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option><option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option><option value="1989">1989</option><option value="1990">1990</option><option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option><option value="1998">1998</option><option value="1999">1999</option><option value="2000">2000</option><option value="2001">2001</option><option value="2002">2002</option><option value="2003">2003</option><option value="2004">2004</option><option value="2005">2005</option><option value="2006">2006</option><option value="2007">2007</option><option value="2008">2008</option><option value="2009">2009</option><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option></select>&nbsp;<select name="birthdayMonth"><option selected="selected" value="1">01</option><option value="2">02</option><option value="3">03</option><option value="4">04</option><option value="5">05</option><option value="6">06</option><option value="7">07</option><option value="8">08</option><option value="9">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>&nbsp;<select name="birthdayDay"><option selected="selected" value="1">01</option><option value="2">02</option><option value="3">03</option><option value="4">04</option><option value="5">05</option><option value="6">06</option><option value="7">07</option><option value="8">08</option><option value="9">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select> </td>
						</tr>
						<tr>
						  <td align="right" bgcolor="#FFFFFF" width="28%">性　别： </td>
						  <td align="left" bgcolor="#FFFFFF" width="72%"><input name="sex" value="0" checked="checked" type="radio">
							保密&nbsp;&nbsp;
							<input name="sex" value="1" type="radio">
							男&nbsp;&nbsp;
							<input name="sex" value="2" type="radio">
						  女&nbsp;&nbsp; </td>
						</tr>
						<tr>
						  <td align="right" bgcolor="#FFFFFF" width="28%">电子邮件地址： </td>
						  <td align="left" bgcolor="#FFFFFF" width="72%"><input name="email" value="1213569843@qq.com" size="25" class="inputBg" type="text"><span style="color:#FF0000"> *</span></td>
						</tr>
								<tr>
						  <td colspan="2" align="center" bgcolor="#FFFFFF"><input name="act" value="act_edit_profile" type="hidden">
							<input name="submit" value="确认修改" class="bnt_blue_1" style="border:none;" type="submit">
						  </td>
						</tr>
			   </tbody></table>
			</form>
			 <form name="formPassword" action="user.php" method="post" onsubmit="return editPassword()">
			 <table bgcolor="#dddddd" border="0" cellpadding="5" cellspacing="1" width="100%">
				<tbody><tr>
				  <td align="right" bgcolor="#FFFFFF" width="28%">原密码：</td>
				  <td align="left" bgcolor="#FFFFFF" width="76%"><input name="old_password" size="25" class="inputBg" type="password"></td>
				</tr>
				<tr>
				  <td align="right" bgcolor="#FFFFFF" width="28%">新密码：</td>
				  <td align="left" bgcolor="#FFFFFF"><input name="new_password" size="25" class="inputBg" type="password"></td>
				</tr>
				<tr>
				  <td align="right" bgcolor="#FFFFFF" width="28%">确认密码：</td>
				  <td align="left" bgcolor="#FFFFFF"><input name="comfirm_password" size="25" class="inputBg" type="password"></td>
				</tr>
				<tr>
				  <td colspan="2" align="center" bgcolor="#FFFFFF"><input name="act" value="act_edit_password" type="hidden">
					<input name="submit" class="bnt_blue_1" style="border:none;" value="确认修改" type="submit">
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
