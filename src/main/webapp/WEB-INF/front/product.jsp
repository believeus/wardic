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
<link href="static/public/css/frontCss/style.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="static/public/js/frontJs/common.js"></script>
<script type="text/javascript" src="static/public/js/frontJs/action.js"></script>
<script type="text/javascript"
	src="static/public/js/frontJs/mzp-packed-me.js"></script>
<script type="text/javascript">
	function $id(element) {
		return document.getElementById(element);
	}
	//切屏--是按钮，_v是内容平台，_h是内容库
	function reg(str) {
		var bt = $id(str + "_b").getElementsByTagName("h2");
		for ( var i = 0; i < bt.length; i++) {
			bt[i].subj = str;
			bt[i].pai = i;
			bt[i].style.cursor = "pointer";
			bt[i].onclick = function() {
				$id(this.subj + "_v").innerHTML = $id(this.subj + "_h")
						.getElementsByTagName("blockquote")[this.pai].innerHTML;
				for ( var j = 0; j < $id(this.subj + "_b")
						.getElementsByTagName("h2").length; j++) {
					var _bt = $id(this.subj + "_b").getElementsByTagName("h2")[j];
					var ison = j == this.pai;
					_bt.className = (ison ? "" : "h2bg");
				}
			}
		}
		$id(str + "_h").className = "none";
		$id(str + "_v").innerHTML = $id(str + "_h").getElementsByTagName(
				"blockquote")[0].innerHTML;
	}
</script>
</head>

<body>

	<!-- 页面头部引用  begin -->
	<jsp:include page="header.jsp" />
	<!-- 页面头部引用 end -->

	<div class="block clearfix">

		<div class="AreaL">





			<div id="category_tree">
				<div class="tits">相关课程分类</div>
				<dl class="clearfix" style="border:none; height:auto">
					<div class="box1 cate" id="cate">
						<h1 onclick="tab(0)" style="border-top:none">

							<span class="f_l"><img src="picture/btn_unfold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>
							<a href="category-1-b0.html" class="  f_l">手机App开发教程</a>

						</h1>
						<ul>
							<a class="over_2" href="category-2-b0.html">wp视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-3-b0.html">phonegap视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-4-b0.html">Android视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-5-b0.html">ios视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-47-b0.html">游戏开发</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


						<h1 onclick="tab(1)">

							<span class="f_l"><img src="picture/btn_unfold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>
							<a href="category-6-b0.html" class="  f_l">网站开发视频教程</a>

						</h1>
						<ul>
							<a class="over_2" href="category-7-b0.html">node.js教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-8-b0.html">php免费视频教程下载</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-9-b0.html">java视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-11-b0.html">.net视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-41-b0.html">html5视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-42-b0.html">css3视频教程</a>
1
							<div class="clearfix"></div>
							<a class="over_2" href="category-43-b0.html">javascript视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-45-b0.html">html+css</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


						<h1 onclick="tab(2)">

							<span class="f_l"><img src="picture/btn_unfold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>
							<a href="category-12-b0.html" class="  f_l">平面设计视频教程</a>

						</h1>
						<ul>
							<a class="over_2" href="category-13-b0.html">fireworks视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-14-b0.html">illustrator视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-15-b0.html">CorelDraw视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-16-b0.html">InDesign视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-17-b0.html">photoshop视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-18-b0.html">ui系列视频教程</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>



						<h1 onclick="tab(3)">

							<span class="f_l"> <img src="picture/btn_fold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>

							<a href="category-24-b0.html" class="  f_l">IT新技术</a>

						</h1>


						<ul style="display:none">


							<a class="over_2" href="category-25-b0.html">大数据教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-26-b0.html">云计算</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-27-b0.html">物联网</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


						<h1 onclick="tab(4)">

							<span class="f_l"> <img src="picture/btn_fold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>

							<a href="category-28-b0.html" class="  f_l">网络营销视频教程</a>

						</h1>


						<ul style="display:none">


							<a class="over_2" href="category-29-b0.html">SEO视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-35-b0.html">微信营销视频教程</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


						<h1 onclick="tab(5)">

							<span class="f_l"> <img src="picture/btn_fold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>

							<a href="category-36-b0.html" class="  f_l">操作系统教程</a>

						</h1>


						<ul style="display:none">


							<a class="over_2" href="category-37-b0.html">windows视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-38-b0.html">linux视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-39-b0.html">虚拟机视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-40-b0.html">unix视频教程</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


					</div>
				</dl>
			</div>
			<div class="blank"></div>

			<script type="text/javascript">
				function tab(id) {
					obj_h4 = document.getElementById("cate")
							.getElementsByTagName("h4");
					obj_ul = document.getElementById("cate")
							.getElementsByTagName("ul");
					obj_img = document.getElementById("cate")
							.getElementsByTagName("img");
					if (obj_ul[id].style.display == "none") {
						obj_ul[id].style.display = "block"
						obj_img[id].src = "picture/btn_unfold.gif"
						return false;
					} else
						(obj_ul[id].style.display == "block")
					{
						obj_ul[id].style.display = "none"
						obj_img[id].src = "picture/btn_fold.gif"
					}
				}
			</script>

			<div class="box" id='history_div'>
				<div class="box_1">
					<h3>
						<span>浏览历史</span>
					</h3>

					<div class="boxCenterList clearfix" id='history_list'></div>
				</div>
			</div>
			<div class="blank5"></div>
			<script type="text/javascript">
				if (document.getElementById('history_list').innerHTML.replace(
						/\s/g, '').length < 1) {
					document.getElementById('history_div').style.display = 'none';
				} else {
					document.getElementById('history_div').style.display = 'block';
				}
				function clear_history() {
					Ajax.call('user.php', 'act=clear_history',
							clear_history_Response, 'GET', 'TEXT', 1, 1);
				}
				function clear_history_Response(res) {
					document.getElementById('history_list').innerHTML = '您已清空最近浏览过的商品';
				}
			</script>
		</div>


		<div class="AreaR">
			<div class="box">
				<div id="ur_here">
					当前位置: <a href=".">首页</a>
					<code>&gt;</code>
					<a href="category-6-b0.html">网站开发视频教程</a>
					<code>&gt;</code>
					<a href="category-43-b0.html">javascript视频教程</a>
					<code>&gt;</code>
					Angularjs视频教程_Angularjs中文视频教程(40讲)
				</div>
			</div>
			<div class="blank"></div>
			<div id="goodsInfo" class="clearfix">


				<div class="imgInfo">
					<a href="images/201501/goods_img/197_P_1421592115254.png"
						id="zoom1" class="MagicZoom MagicThumb"
						title="Angularjs视频教程_Angularjs中文视频教程(40讲)"> <img
						src="picture/197_g_1421592115171.jpg"
						alt="Angularjs视频教程_Angularjs中文视频教程(40讲)" width="360px;"
						height="360px" />
					</a>
					<div class="blank5"></div>
					<div style="text-align:center; position:relative; width:100%;">
						<a href="javascript:;"
							onclick="window.open('gallery.php?id=197'); return false;"><img
							alt="zoom" src="picture/zoom.gif" /></a> <a href="goods-178.html"><img
							style="position: absolute;right:0;" alt="next"
							src="picture/down.gif" /></a>
					</div>


					<div class="blank"></div>


					<script type="text/javascript">
						mypicBg();
					</script>

				</div>

				<div class="textInfo">
					<form action="javascript:addToCart(197)" method="post"
						name="ECS_FORMBUY" id="ECS_FORMBUY">
						<h1 class="clearfix">Angularjs视频教程_Angularjs中文视频教程(40讲)</h1>




						<ul class="ul2 clearfix">

							<li class="clearfix" style="width:100%">
								<dd>

									<strong>赞助费：</strong><font class="shop" id="ECS_SHOPPRICE">￥10元</font>

									&nbsp;&nbsp;&nbsp;联系我：<a target="_blank"
										href="http://www.taobao.com/webww/ww.php?ver=3&amp;touid=htzhanglong&amp;siteid=cntaobao&amp;status=1&amp;charset=utf-8"><img
										border="0"
										src="http://amos.alicdn.com/realonline.aw?v=2&amp;uid=htzhanglong&amp;site=cntaobao&amp;s=1&amp;charset=utf-8"
										alt="点击这里联系我" /></a> &nbsp;&nbsp;&nbsp;交流群：<a target="_blank"
										href="http://shang.qq.com/wpa/qunwpa?idkey=91b63a99add58dcbe057a7e7bffbd393f102d76b74bf3bc817d09440041864cd"><img
										border="0" src="picture/group.png" alt="IT营" title="IT营"></a>

								</dd>
							</li>

							<li class="clearfix" style="width:80%">
								<div class="user_rank clearfix">
									<ul class="clearfix">
										<li>一级VIP：<font class="f1" id="ECS_RANKPRICE_2">￥9元</font>
										</li>
										<li>二级VIP：<font class="f1" id="ECS_RANKPRICE_6">￥8元</font>
										</li>
										<li>三级VIP：<font class="f1" id="ECS_RANKPRICE_4">￥7元</font>
										</li>
										<li>四级VIP：<font class="f1" id="ECS_RANKPRICE_5">￥7元</font>
										</li>
										<li>五级VIP：<font class="f1" id="ECS_RANKPRICE_7">￥6元</font>
										</li>
									</ul>
								</div>

							</li>



							<li class="clearfix">
								<dd>
									<strong>适合人群： </strong>初级
								</dd>
							</li>


							<li class="clearfix">
								<dd>
									<strong>课时数量： </strong>40
								</dd>
							</li>


							<li class="clearfix">
								<dd>
									<strong>更新程度： </strong>完成
								</dd>
							</li>


							<li class="clearfix">
								<dd>
									<strong>主要技术： </strong>angularjs
								</dd>
							</li>


							<li class="clearfix">
								<dd>
									<strong>赞助类型： </strong>免费
								</dd>
							</li>


							<li class="clearfix">
								<dd>
									<strong>用到技术： </strong>angularjs js
								</dd>
							</li>


						</ul>


						<ul>








							<li class="clearfix">
								<dd>
									<strong>购买此商品可使用：</strong><font class="f4">0 积分</font>
								</dd>
							</li>
						</ul>




						<ul class="bnt_ul">




							<li class="clearfix">
								<dd>
									<strong>购买数量：</strong> <input name="number" type="text"
										id="number" value="1" size="4" onblur="changePrice()"
										style="border:1px solid #ccc; " /> <strong>商品总价：</strong><font
										id="ECS_GOODS_AMOUNT" class="f1"></font>
								</dd>
							</li>

							<li class="padd"><a href="javascript:addToCart(197)"><img
									src="picture/goumai2.gif" /></a></li>

						</ul>

					</form>
				</div>
			</div>
			<div class="blank"></div>


			<div class="box">

				<div style="padding:0 0px;">
					<div id="com_b" class="history clearfix">
						<h2>课程描述</h2>
						<h2 class="h2bg">相关课程</h2>
					</div>
				</div>
				<div class="box_1">
					<div id="com_v" class="  " style="padding:18px;"></div>
					<div id="com_h">
						<blockquote>
							<p>
								&nbsp;<span
									style="font-size: 24px; color: rgb(76, 17, 48); font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px;">Angularjs中文视频教程全网首发最详细由浅入深学习</span>
							</p>
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p>
								<span style="color: rgb(255, 0, 0);"><span
									style="font-size: x-large;">&nbsp;点击这里联系我</span></span>
							</p>
							<p>
								<a target="_blank"
									href="http://www.taobao.com/webww/ww.php?ver=3&amp;touid=htzhanglong&amp;siteid=cntaobao&amp;status=1&amp;charset=utf-8"><img
									border="0"
									src="http://amos.alicdn.com/realonline.aw?v=2&amp;uid=htzhanglong&amp;site=cntaobao&amp;s=1&amp;charset=utf-8"
									alt="点击这里联系我" /></a>
							</p>
							<p
								style="margin: 1.12em 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px;">
								<span
									style="font-family: Arial, Verdana, sans-serif; font-size: 12px;">&nbsp;</span>&nbsp;
							</p>
							<p
								style="margin: 0px 0px 1.5em; padding: 0px; font-size: 14px; list-style: none; color: rgb(51, 51, 51); font-family: 'helvetica tahoma arial sans-serif'; line-height: 24px;">
								<span style="font-size: 18px;"><b><a target="_blank"
										style="color: rgb(0, 102, 204); outline: 0px; margin: 0px; padding: 0px; cursor: pointer;">AngularJS</a>是Google开源的一款JavaScript
										MVC框架，弥补了HTML在构建应用方面的不足，</b>其通过使用指令（directives）结构来扩展HTML词汇，使开发者可以使用HTML来声明动态内容，从而使得Web开发和测试工作变得更加容易。<b>AngularJS诞生以来，吸引了大量的目光，也迅速成为了Web开发领域的新宠。</b></span>
							</p>
							<p
								style="margin: 0px 0px 1.5em; padding: 0px; font-size: 14px; list-style: none; color: rgb(51, 51, 51); font-family: 'helvetica tahoma arial sans-serif'; line-height: 24px;">
								<strong><span style="font-size: large;">快人一步
										掌握最新技术，让您再添加竞争优势，先看看下面的目录和招聘信息</span></strong>
							</p>
							<p
								style="margin: 0px 0px 1.5em; padding: 0px; font-size: 14px; list-style: none; color: rgb(51, 51, 51); font-family: 'helvetica tahoma arial sans-serif'; line-height: 24px;">
								<font color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">001- 简介.mp4</span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">002 -
										数据绑定.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">003 -
										控制器.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">004 -
										ng-bind.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">005 -
										多个控制器.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">006 -
										$scope里的$apply、$digest方法.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">007 -
										$scope里的$watch方法.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">008 - 练习
										购物车(1).mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">009 - 练习
										购物车(2).mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">010 - 练习
										购物车(3).mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">011 - 练习
										购物车(4).mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">012 -
										模块和控制器.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">013 -
										$provide里provider方法.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">014 -
										$provider里的factory、service方法.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">015 -
										多个控制器内数据共享.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">016 - 过滤器
										number、currency、date.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">017 - 过滤器
										limitTo、lowercase、uppercase 、filter 、orderBy、json.mov</span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">018 - 练习 过滤器
										产品列表(1).mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">019 - 练习 过滤器
										产品列表(2).mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">020 -
										自定义过滤器、$controllerProvider使用.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">021 -
										控制器的合理使用、显示和隐示的依赖注入.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">022 -
										内置渲染指令.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">023 -
										内置事件指令.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">024 -
										内置节点指令.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">025 - 自定义指令
										restrict、template、replace属性.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">026 - 自定义指令
										templateUrl属性.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">027 - 自定义指令
										transclude、priority、terminal属性.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">028 - 自定义指令
										compile &amp;&amp; link属性.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">029 - 自定义指令
										controller &amp;&amp; controllAs属性.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">030 - 自定义指令
										require 属性.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">031 - 自定义指令
										scope 属性.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">032 - 练习
										自定义accordion指令.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">033 -
										模块里的constant、value、run方法.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">034 - 表单
										Form、Text.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">035 - 表单
										Password、Url、Email.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">036 - 表单
										Radio、Checkbox、Number.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">037 - 表单
										Select 城市3级关联.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">038 - 表单
										Submit、Reset、修复前面字段的某些问题.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">039 -
										自定义表单验证.mov</span></font><font color="#333333"
									face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;"><br /> </span></font><font
									color="#333333" face="helvetica tahoma arial sans-serif"><span
									style="font-size: 14px; line-height: 24px;">040 -
										自定义表单，ngModel属性.mov</span></font>
							</p>
							<div>&nbsp;</div>
							<p
								style="margin: 0px 0px 1.5em; padding: 0px; font-size: 14px; list-style: none; color: rgb(51, 51, 51); font-family: 'helvetica tahoma arial sans-serif'; line-height: 24px;">
								&nbsp;<img src="picture/1(3).jpg" width="747" height="1650"
									alt="" />
							</p>
							<p
								style="margin: 0px 0px 1.5em; padding: 0px; font-size: 14px; list-style: none; color: rgb(51, 51, 51); font-family: 'helvetica tahoma arial sans-serif'; line-height: 24px;">&nbsp;</p>
							<p
								style="margin: 0px 0px 1.5em; padding: 0px; font-size: 14px; list-style: none; color: rgb(51, 51, 51); font-family: 'helvetica tahoma arial sans-serif'; line-height: 24px;">&nbsp;</p>
						</blockquote>







						<blockquote></blockquote>

					</div>
				</div>
			</div>
			<script type="text/javascript">
			<!--
				reg("com");
			//-->
			</script>
			<div class="blank"></div>


			<div id="ECS_COMMENT">
				<div class="box">

					<div class="box_1">

						<h3>
							<span class="text">用户评论</span>(共<font class="f1">2</font>条评论)
						</h3>

						<div class="boxCenterList clearfix" style="height:1%;">

							<ul class="comments">

								<li class="word"><font class="f2">admins</font> <font
									class="f3">( 2015-10-16 18:01:22 )</font><br /> <img
									src="picture/stars5.gif" alt="" />

									<p>下载不了</p></li>

								<li class="word"><font class="f2">1057607246</font> <font
									class="f3">( 2015-09-22 12:53:57 )</font><br /> <img
									src="picture/stars5.gif" alt="" />

									<p>老板，下载链接失效了</p></li>

							</ul>



							<div id="pagebar" class="f_r">

								<form name="selectPageForm" action="/goods.php" method="get">

									<div id="pager">

										总计 2 个记录，共 1 页。 <span> <a
											href="javascript:gotoPage(1,197,0)">第一页</a> <a
											href="javascript:;">上一页</a> <a href="javascript:;">下一页</a> <a
											href="javascript:;">最末页</a>
										</span>

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

							</div>



							<div class="blank5"></div>



							<div class="commentsList">

								<form action="javascript:;" onsubmit="submitComment(this)"
									method="post" name="commentForm" id="commentForm">

									<table width="710" border="0" cellspacing="5" cellpadding="0">

										<tr>

											<td width="64" align="right">用户名：</td>

											<td width="631">匿名用户</td>

										</tr>

										<tr>

											<td align="right">E-mail：</td>

											<td><input type="text" name="email" id="email"
												maxlength="100" value="" class="inputBorder" /></td>

										</tr>

										<tr>

											<td align="right">评价等级：</td>

											<td><input name="comment_rank" type="radio" value="1"
												id="comment_rank1" /> <img src="picture/stars1.gif" /> <input
												name="comment_rank" type="radio" value="2"
												id="comment_rank2" /> <img src="picture/stars2.gif" /> <input
												name="comment_rank" type="radio" value="3"
												id="comment_rank3" /> <img src="picture/stars3.gif" /> <input
												name="comment_rank" type="radio" value="4"
												id="comment_rank4" /> <img src="picture/stars4.gif" /> <input
												name="comment_rank" type="radio" value="5" checked="checked"
												id="comment_rank5" /> <img src="picture/stars5.gif" /></td>

										</tr>

										<tr>

											<td align="right" valign="top">评论内容：</td>

											<td><textarea name="content" class="inputBorder"
													style="height:50px; width:620px;"></textarea> <input
												type="hidden" name="cmt_type" value="0" /> <input
												type="hidden" name="id" value="197" /></td>

										</tr>

										<tr>

											<td colspan="2">

												<div style="padding-left:15px; text-align:left; float:left;">

													验证码：<input type="text" name="captcha" class="inputBorder"
														style="width:50px; margin-left:5px;" /> <img
														src="picture/captcha.php" alt="captcha"
														onClick="this.src='captcha.php?'+Math.random()"
														class="captcha">
												</div> <input name="" type="submit" value="提交评论"
												class="f_r bnt_blue_1" style=" margin-right:8px;">
											</td>

										</tr>

									</table>

								</form>

							</div>



						</div>

					</div>

				</div>

				<div class="blank5"></div>



				<script type="text/javascript">
					//<![CDATA[

					var cmt_empty_username = "请输入您的用户名称";

					var cmt_empty_email = "请输入您的电子邮件地址";

					var cmt_error_email = "电子邮件地址格式不正确";

					var cmt_empty_content = "您没有输入评论的内容";

					var captcha_not_null = "验证码不能为空!";

					var cmt_invalid_comments = "无效的评论内容!";

					/**

					 * 提交评论信息

					 */

					function submitComment(frm)

					{

						var cmt = new Object;

						//cmt.username        = frm.elements['username'].value;

						cmt.email = frm.elements['email'].value;

						cmt.content = frm.elements['content'].value;

						cmt.type = frm.elements['cmt_type'].value;

						cmt.id = frm.elements['id'].value;

						cmt.enabled_captcha = frm.elements['enabled_captcha'] ? frm.elements['enabled_captcha'].value
								: '0';

						cmt.captcha = frm.elements['captcha'] ? frm.elements['captcha'].value
								: '';

						cmt.rank = 0;

						for (i = 0; i < frm.elements['comment_rank'].length; i++)

						{

							if (frm.elements['comment_rank'][i].checked)

							{

								cmt.rank = frm.elements['comment_rank'][i].value;

							}

						}

						//  if (cmt.username.length == 0)

						//  {

						//     alert(cmt_empty_username);

						//     return false;

						//  }

						if (cmt.email.length > 0)

						{

							if (!(Utils.isEmail(cmt.email)))

							{

								alert(cmt_error_email);

								return false;

							}

						}

						else

						{

							alert(cmt_empty_email);

							return false;

						}

						if (cmt.content.length == 0)

						{

							alert(cmt_empty_content);

							return false;

						}

						if (cmt.enabled_captcha > 0 && cmt.captcha.length == 0)

						{

							alert(captcha_not_null);

							return false;

						}

						Ajax.call('comment.php', 'cmt=' + cmt.toJSONString(),
								commentResponse, 'POST', 'JSON');

						return false;

					}

					/**

					 * 处理提交评论的反馈信息

					 */

					function commentResponse(result)

					{

						if (result.message)

						{

							alert(result.message);

						}

						if (result.error == 0)

						{

							var layer = document.getElementById('ECS_COMMENT');

							if (layer)

							{

								layer.innerHTML = result.content;

							}

						}

					}

					//]]>
				</script>
			</div>
		</div>

	</div>

	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->

</body>
</html>
