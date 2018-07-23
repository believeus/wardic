<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<jsp:include page="meta.jsp" />
	<script src="static/public/js/scroll_1.js"></script>

	<script src="static/public/js/gototop_1.js"></script>
	<script src="static/public/js/main_1.js"></script>

</head>
<body>

	<!-- 页面头部引用  begin -->
	<jsp:include page="header.jsp" />
	<!-- 页面头部引用 end -->

	<div id="overlay">
		<div class="otherswrap" id="discover">
			<div class="layout">
				<div class="othersmenu fl">
					<div class="other-titles">
						<h2>${parent.name}</h2>
					</div>
					<div class="menu">
						<ul>
							<c:forEach items="${zqmetas}" var="meta">

							<li id="OWNER_8385" class="<c:if test="${zqmeta.id == meta.id}">on</c:if>">
								<a href="javascript:void(0)" class="tit" onclick="openUrl(this,'${meta.id}')">${meta.name}</a>

								<ul class="submenu" id="bro_8385">

								</ul>
							</li>
							</c:forEach>

						</ul>
					</div><!--end menu-->
				</div>

				<div class="othersmain newsmain fr">
					<div class="other-titles">
						<h2 style="color:#ed1b2f;">${zqmeta.name}</h2>
						<div class="fr location"><a href="/index.jhtml" target="_blank" class="CurrChnlCls">首页</a>-<a href="article/${parent.id}.jhtml" target="_blank" class="CurrChnlCls">${parent.name}</a>-<a href="article/{zqmeta.id}.jhtml" target="_blank" class="CurrChnlCls">${zqmeta.name}</a></div>
					</div>

					<iframe width="756" height="1350" scrolling="no" frameborder="0" name="aa" id="aa" src="article_list/${zqmeta.id}.jhtml"></iframe>

				</div>
				<!--end othersmain-->
			</div>
		</div>
		<!--end otherswrap-->

	</div><!--end overview-->

	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->
<script type="text/javascript">
	function openUrl(element,id){
	    $(element).parent().addClass("on").siblings().removeClass("on");
	    document.aa.document.location="article_list/"+id+".jhtml";
	}
</script>
</body>
</html>
