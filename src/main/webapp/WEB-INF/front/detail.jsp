<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<link rel="shortcut icon" href="http://xingyun.oss-cn-hangzhou.aliyuncs.com/b/crv/images/favicon.ico">
	<title>中桥能源欢迎您</title>
	<link rel="stylesheet" href="static/public/css/base_1.css">
	<link rel="stylesheet" href="static/public/css/images-css.css">
	<script src="static/public/js/jquery-1.8.0.min.js"></script>
</head>
<%@ taglib prefix="date" uri="/tag/datetag.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script>
    $(function() {
        doZoom(14);
    })
</script>
<script type="text/javascript">
    function doZoom(size) {
        //document.getElementById("content-fontsize").style.fontSize=size+"px !important";
        //document.getElementById("content-fontsize").style.setProperty('font-size', size+"px", 'important');
        var contentFontsize = document.getElementById("content-fontsize");
        if(contentFontsize) {
            //contentFontsize.style.setProperty('font-size', size+"px", 'important');
            contentFontsize.style.fontSize = size + "px"; //('font-size', size+"px", 'important');
            contentFontsize.style.lineHeight = "200%";
            var divs = contentFontsize.getElementsByTagName("DIV");
            for(var i = 0; i < divs.length; i++) {
                //divs[i].style.setProperty('font-size', size+"px", 'important');
                divs[i].style.fontSize = size + "px"; //setProperty('font-size', size+"px", 'important');
                divs[i].style.lineHeight = "150%";
            }
            var ps = contentFontsize.getElementsByTagName("P");
            for(var i = 0; i < ps.length; i++) {
                //ps[i].style.setProperty('font-size', size+"px", 'important');
                ps[i].style.fontSize = size + "px"; //setProperty('font-size', size+"px", 'important');
                ps[i].style.lineHeight = "150%";
            }
            var spans = contentFontsize.getElementsByTagName("SPAN");
            for(var i = 0; i < spans.length; i++) {
                //spans[i].style.setProperty('font-size', size+"px", 'important');
                spans[i].style.fontSize = size + "px"; //setProperty('font-size', size+"px", 'important');
                spans[i].style.lineHeight = "200%";
            }

            var fonts = contentFontsize.getElementsByTagName("FONT");
            for(var i = 0; i < fonts.length; i++) {
                //fonts[i].style.setProperty('font-size', size+"px", 'important');
                fonts[i].style.fontSize = size + "px"; //setProperty('font-size', size+"px", 'important');
                fonts[i].style.lineHeight = "150%";
            }
        }
    }
</script>
<body
<body class="web-background" id="discover">
<div class="jiathis_style" style="position: absolute; z-index: 1000000000; display: none; top: 50%; left: 50%; overflow: auto;"></div>
<div class="jiathis_style" style="position: absolute; z-index: 1000000000; display: none; overflow: auto;"></div>
<div class="witer-backgroud">
	<div class="header-news">
		<a href="/"><img src="static/img/P020160406609603319079.png"></a>
	</div>
	<!--end header-->

<div class="newsmain">

	<div class="newsContent">
		<h1>${zqdata.title}</h1>
		<div class="info"> <span>发稿时间:<date:date value="${zqdata.createTime}" pattern="yyyy-MM-dd"/>
</span><span>来源：中桥能源</span> <span>【 字体：<a href="javascript:doZoom(16);">大</a> <a href="javascript:doZoom(14);">中</a> <a href="javascript:doZoom(12);">小</a> 】</span> </div>
		<div class="text" id="content-fontsize" style="font-size: 14px; line-height: 200%;">
			<div class="Custom_UnionStyle" style="text-align: center; font-size: 14px; line-height: 150%;"><span style="font-size: 14px; line-height: 200%;"><p style="font-size: 14px; line-height: 150%;"><span style="font-size: 14px; line-height: 200%;"></span></p>
								<div class="" style="font-size: 14px; line-height: 150%;">
${zqdata.content}
								</div>
								</span>
				<p style="font-size: 14px; line-height: 150%;"></p>
			</div>

			<%--<div class="re_news">
				<h3>相关新闻：</h3>
				<ul>

					<li>
						<a href="./t20180103_447190.htm">集团荣获国家网络与信息安全信息通报机制先进单位</a>
					</li>

					<li>
						<a href="../../media/201712/t20171222_445250.htm">华润产业创新集群落地羊城 华润产业广州技术交易会举办</a>
					</li>

					<li>
						<a href="../201712/t20171220_445055.htm">华润集团与宜宾市政府签署战略合作协议</a>
					</li>

					<li>
						<a href="../201712/t20171202_444182.htm">华润集团荣获2017年“香港绿色企业大奖”最高级别奖项</a>
					</li>

					<li>
						<a href="../../media/201711/t20171120_443432.htm">华润·深圳南山半马善款助力希望小镇村民</a>
					</li>

				</ul>
			</div>--%>
			<div class="newsContentFooter marginbottom" style="font-size: 14px; line-height: 150%;">
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
