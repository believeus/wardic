<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<meta content="" name="description">
	<meta content="" name="keywords">
	<link rel="shortcut icon"
		  href="http://xingyun.oss-cn-hangzhou.aliyuncs.com/b/crv/images/favicon.ico">
	<title>中桥能源欢迎您</title>
	<link href="static/public/css/base_201503.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="static/public/css/index_3.css">
	<script src="static/public/js/jquery-1.8.0.min.js"></script>
	<script src="static/public/js/jquery_scroll.js" type="text/javascript"></script>
	<script src="static/public/js/main.js"></script>
	<script src="static/public/js/jquery.SuperSlide.js"></script>
	<link href="static/public/css/hrsn_com_style.css" rel="stylesheet">
	<link href="static/public/css/hrsn_style.css" rel="stylesheet">
</head>
<body>

<!-- 页面头部引用  begin -->
<jsp:include page="header.jsp" />
<!-- 页面头部引用 end -->

<style type="text/css">
	.focus_banner li {
		display: none;
	}
</style>
<script>
    $$(function() {

        var speed = 2500;
        var liWidth = 131;
        var move = 131;
        var obj = $$("#js_scrollBox ul");
        var allLi = obj.html();
        var liLen = $$("#js_scrollBox ul li").length;
        var yd = liWidth * liLen;
        obj.width(liWidth * liLen * 3 + "px");
        obj.append(allLi);
        obj.prepend(allLi);
        obj.css({
            "margin-left" : -yd + "px"
        });
        function oneMove(style) {
            if (style == "left") {
                var moveWidth = move;
            } else {
                var moveWidth = -move;
            }
            var leftPos = obj.css("margin-left").replace('px', '');
            leftPos = parseInt(leftPos);
            obj.stop(true, false).animate(
                {
                    marginLeft : leftPos + moveWidth
                },
                500,
                function() {
                    var now = parseInt(obj.css("margin-left").replace(
                        'px', ''));
                    if (now >= 0) {
                        obj.css("marginLeft", -yd + "px");
                    }
                    if (now <= -2 * yd) {
                        obj.css("marginLeft", -yd + "px");
                    }
                })

        }
        $$("#js_nextImg").click(function() {
            if (!obj.is(":animated")) {
                oneMove();
            }

        });
        $$("#js_prevImg").click(function() {
            if (!obj.is(":animated")) {
                oneMove("left");
            }
        });

        var liTimer = setInterval(oneMove, speed);
        $$("#js_allBtm").mouseenter(function() {
            clearInterval(liTimer);
        });
        $$("#js_allBtm").mouseleave(function() {
            liTimer = setInterval(oneMove, speed);
        });
    });
</script>
<div class="head" style="height:534px;">
	<div class="focus_banner" style="text-align: center;">
		<div
				style="width: 1000px;text-align: center;position:absolute;left:50%;margin-left:-500px;">
			<div class="focus_left" style="left:0;margin-left:0;">
				<img src="static/img/hrsn_bannerleft1.png">
			</div>
			<div class="focus_right"
				 style="margin-left:968px;left:0;margin-right: 0;">
				<img src="static/img/hrsn_bannerright1.png">
			</div>
		</div>
		<ul>

			<li style="display: block;"><a href="http://www.crv.com.cn/#"><img
					src="static/img/W020170604659150153343.jpg" alt="华润万家" title="华润万家"></a></li>

			<li style="display: none;"><a href="http://www.crv.com.cn/#"><img
					src="static/img/W020170604659351649144.jpg" alt="华润万家" title="华润万家"></a></li>

			<li style="display: none;"><a href="http://www.crv.com.cn/#"><img
					src="static/img/W020171129608148704434.jpg" alt="华润万家" title="华润万家"></a></li>

		</ul>

		<div class="focus_tab"
			 style="width:100%;margin-left:0;left:0;background:#ed1b2f repeat;">
			<div class="w980 clearfix">
				<div class="focus_btn f_l">
					<a class="active">1</a><a class="">2</a><a class="">3</a>
				</div>

				<div class="focus_txt f_r">

					<p style="display: block;">
						<em>中桥能源</em>
					</p>

					<p style="display: none;">
						<em>中桥能源</em>
					</p>

					<p style="display: none;">
						<em>中桥能源</em>
					</p>

				</div>
			</div>
		</div>

	</div>

</div>
<script>
    $$(function() {
        //banner轮播
        $$("div.focus_banner").picScroll({
            len : 3
        });
        //小图轮播
        var index = 0, time = null;
        var focus_pic = $$("div.focus_pic")
        focus_pic.find("li").eq(0).show();
        var len = focus_pic.find("li").length;
        //左边点击
        focus_pic.find("div.btn_left").click(
            function() {

                window.clearInterval(time);
                if (index > 0) {
                    index--;
                    focus_pic.find("li").eq(index).show()
                        .siblings("li").hide();
                } else {
                    index = len - 1;
                    focus_pic.find("li").eq(index).show()
                        .siblings("li").hide();
                }
                autoScroll();
            });
        //右边点击
        focus_pic.find("div.btn_right").click(
            function() {
                window.clearInterval(time);
                //alert(10)
                if (index < len - 1) {
                    index++;
                    focus_pic.find("li").eq(index).show()
                        .siblings("li").hide();
                } else {
                    index = 0;
                    focus_pic.find("li").eq(index).show()
                        .siblings("li").hide();
                }
                autoScroll();
            })
        //定时滚动
        autoScroll();
        function autoScroll() {
            time = window.setInterval(function() {
                if (index < len - 1) {
                    index++;
                    focus_pic.find("li").eq(index).show().siblings("li")
                        .hide();
                } else {
                    index = 0;
                    focus_pic.find("li").eq(index).show().siblings("li")
                        .hide();
                }

            }, 2000)

        }
        //big banne图

    })
</script>
<div class="homemain">
	<div class="layout">
		<div class="homenews fl">
			<div class="titels">
				<h2 class="fl">
					<a href="article/7.jhtml" target="_self"
					   style="color:#ed1b2f;">公司新闻</a>
				</h2>
				<div class="fr more"></div>
			</div>
			<div class="homemain-conts homenews-conts" style="border:none;">



				<dl>
					<dt
							style="float: left;width: 160px;height: 103px;overflow: hidden;background: url(&#39;static/img/W020171211548398753991.jpg&#39;) no-repeat;">
					</dt>
					<dd class="cont">
						<h3>
							<c:forEach items="${companyNew.content}" var="c" begin="0" end="0">
							<a
									href="detail/${c.id}.jhtml"
									target="_blank">${c.title}</a>
						</h3>
						<p>
							${c.description}...<a class="more"
											  href="detail/${c.id}.jhtml"
											  target="_blank"><img alt="更多" src="static/img/i082014.gif"></a>
						</p>
						</c:forEach>
					</dd>
				</dl>


				<div class="homenews-list">
					<ul class="two_col_list">




<c:forEach items="${companyNew.content}" var="c" begin="1" end="6">

						<li><a
								href="/detail/${c.id}.jhtml"
								target="_blank">${c.description}...</a></li>
</c:forEach>






					</ul>
					<ul class="two_col_list">


						<c:forEach items="${companyNew.content}" var="c" begin="6">

							<li><a
									href="detail/${c.id}.jhtml"
									target="_blank">${c.description}...</a></li>
						</c:forEach>



					</ul>
				</div>
				<!--end homenews-list-->
			</div>



		</div>




		<!--<img src width="128" height="96" title onclick="javascript:window.open('','_blank');" />-->




		<!--end homevideo-->
		<div class="homevideo fr">
			<div class="index-ad" style="height:290px">
				<div class="titels">
					<h2 class="fl">
						<a href="javascript:void(0)" target="_self"
						   style="color:#ed1b2f;">视频宣传</a>
					</h2>
					<!--<div class="fr more"><a class="a-more iconbg" href="./gywm/suoye/">更多</a></div>-->

				</div>
				<style>
					.video {
						width: 270px;
						height: 185px;
					}
				</style>

				<div class="homemain-conts">
					<div class="video" id="video">



					</div>

				</div>

			</div>
			<div class="titels"></div>
			<div class="homemain-conts"
				 style="width:280px; height:220px;text-align:center;">

				<div style="margin-bottom:20px">
					<a class="hrxgicons"
					   style="display:inline-block;width:25%; text-align:center;margin-right:20%;"
					   href="javascript:void(0)" target="_blank"> <img
							style="width:100%;margin-bottom:15px;"
							src="static/img/field-of-vision.png">关注与视野
					</a> <a class="hrxgicons"
							style="display:inline-block;width:25%;text-align:center;"
							href="javascript:void(0)" target="_blank"> <img
						style="width:100%;margin-bottom:15px;" src="static/img/magazine.png">
					华润杂志
				</a>
				</div>
				<div>
					<a class="hrxgicons"
					   style="display:inline-block;width:25%; text-align:center;margin-right:20%;"
					   href="javascript:void(0)" target="_blank"> <img
							style="width:100%;margin-bottom:15px;" src="static/img/recruit.png">招贤纳士
					</a> <a class="hrxgicons"
							style="display:inline-block;width:25%;text-align:center;"
							href="javascript:void(0)" target="_blank">
					<img style="width:100%;margin-bottom:15px;" src="static/img/kudos.png">
					奖项荣誉
				</a>
				</div>
			</div>




		</div>





		<!--end homevideo-->

		<div class="homenews fl" style=" margin-top:10px;">
			<div class="titels">
				<h2 class="fl">
					<a href="article/8.jhtml" target="_self"
					   style="color:#ed1b2f;">媒体报道</a>
				</h2>
				<!--<div class="fr more"> <a class="a-more iconbg" href="./xwzx/gsxw/"> 更多</a></div>-->
			</div>
			<div class="homemain-conts homenews-conts" style="border:none;">


				<div class="homenews-list">
					<ul class="two_col_list">

<c:forEach begin="0" end="5" items="${report.content}" var="r" varStatus="status">
						<li><a
								href="detail/${r.id}.jhtml"
								target="_blank">${r.title}</a></li>
</c:forEach>


					</ul>
					<ul class="two_col_list">

						<c:forEach begin="5" end="10" items="${report.content}" var="r" varStatus="status">
							<li><a
									href="detail/${r.id}.jhtml"
									target="_blank">${r.title}</a></li>
						</c:forEach>



					</ul>
				</div>
				<!--end homenews-list-->
			</div>
		</div>


	</div>
	<!--end layout-->




	<div class="homebtm layout" id="js_allBtm">
		<div style="float:left;width:150px;">
			<a href="javascript:void(0)"> <img
					src="static/img/qxpingpai2015.png"></a>
		</div>


		<div style="float:left;width:20px;display:block;">&nbsp;</div>
		<div style="float:left;margin-top:5px;" class="leftBtn"
			 id="js_prevImg">
			<a href="javascript:void(0);"> <!--<img src="./images/let.png" />-->
			</a>
		</div>
		<div style="float:right;margin-top:5px;" class="rightBtn"
			 id="js_nextImg">
			<a href="javascript:void(0);"> <!--<img src="./images/rig.png" />-->
			</a>
		</div>

		<div class="mainCont"
			 style="overflow:hidden;width:780px;position:relative;"
			 id="js_scrollBox">
			<ul style="width: 4323px; margin-left: -1441px;">

				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>




				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>


				<li><span class="pic"><a
						href="javascript:void(0)"
						target="_blank"><img src="static/img/W020171129628048578501.png"></a></span>
				</li>

			</ul>
		</div>
	</div>
	<!--end homebtm-->
</div>
<!--end homemain-->


	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->

</body>
</html>
