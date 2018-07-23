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

<title>用户中心_我的评论</title>

<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="static/public/css/frontCss/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="static/public/js/frontJs/hm.js"></script>
<script type="text/javascript" src="static/public/js/frontJs/transport.js"></script>
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
	<a href="http://www.itying.com/user.php?act=affiliate"><img src="static/public/images/frontImages/u10.gif"> 我的推荐</a>
	<a href="http://www.itying.com/user.php?act=comment_list" class="curs"><img src="static/public/images/frontImages/u11.gif"> 我的评论</a>
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
			 
					  
			 
					  
			 
						<h5><span>我的评论</span></h5>
			  <div class="blank"></div>
						<div class="f_l">
			  <b>商品评论: </b><font class="f4">HTML5+css3实例讲解</font>&nbsp;&nbsp;(2015-10-19 17:37:36)
			  </div>
			  <div class="f_r">
			  <a href="http://www.itying.com/user.php?act=del_cmt&amp;id=17" title="删除" onclick="if (!confirm('你确实要彻底删除这条留言吗？')) return false;" class="f6">删除</a>
			  </div>
			  <div class="msgBottomBorder">
			  今天天气很好<br>
						</div>
						<div class="f_l">
			  <b>商品评论: </b><font class="f4">兄弟连cocos2d-x3.0免费教程下载</font>&nbsp;&nbsp;(2015-10-19 17:38:18)
			  </div>
			  <div class="f_r">
			  <a href="http://www.itying.com/user.php?act=del_cmt&amp;id=18" title="删除" onclick="if (!confirm('你确实要彻底删除这条留言吗？')) return false;" class="f6">删除</a>
			  </div>
			  <div class="msgBottomBorder">
			  你说什么，我听不见。。<br>
						</div>
								  
	<form name="selectPageForm" action="/user.php" method="get">


	 <div id="pager" class="pagebar">
	  <span class="f_l " style="margin-right:10px;">总计 <b>2</b>  个记录</span>
		  
		  </div>


	</form>
	<script type="Text/Javascript" language="JavaScript">
	<!--

	function selectPage(sel)
	{
	  sel.form.submit();
	}

	//-->
	</script>
							
		
			
		
			
		
			<div class="blank5"></div>
	   
		  
			 
		
	  
		  </div>
		 </div>
		</div>
	  </div>
	  
	</div>
	<div class="blank"></div>

	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->

</body>
</html>
