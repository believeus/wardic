<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="date" uri="/tag/datetag.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<meta content="" name="description">
	<meta content="" name="keywords">
	<link rel="shortcut icon"
		  href="http://xingyun.oss-cn-hangzhou.aliyuncs.com/b/crv/images/favicon.ico">
	<title>中桥能源欢迎您</title>
	<link rel="stylesheet" href="static/public/css/2013_base.css">
	<link rel="stylesheet" href="static/public/css/2013_mainbusiness.css">
	<script src="static/public/js/jquery-1.8.0.min.js"></script>
	<style>
		body{background:none; background-color:transparent;}
		.pages .box {
			margin: 0 2px;
			width:100%;
		}
		.pages .box span{

			float: left;

		}

		.title {
			color: #7B7A7A;
			text-decoration: none;
			height: 33px;
			line-height: 33px;
		}
		.title_text {
			color: #F26522;
			text-decoration: none;
			height: 33px;
			line-height: 33px;
		}

		.pages .box a {
			background-color: #EAE6E2;
			border: 1px solid #FFFFFF;
			color: #7B7A7A;
			height: 33px;
			line-height: 33px;
			width: 83px;
		}
		.othersmain{width:740px;}

	</style>

</head>

<body>

<div class="othersmain newsmain">

	<div class="newslist">
		<ul>

			<c:forEach items="${zqdatas.content}" var="data">

			<li>
				<div class="time"><span class="day"><date:date value="${data.createTime}" pattern="dd"/></span><span class="date"><date:date value="${data.createTime}" pattern="yyyy-MM"/></span></div>
				<div class="conts">
					<h3><a href="detail/${data.id}.jhtml" target="_blank">${data.title}</a></h3>
					<p>${fn:substring(data.description,0,60)}
						<a class="more" href="detail/${data.id}.jhtml" target="_blank"><img src="static/img/2013_i08.gif" alt="更多"></a></p>
				</div>
			</li>

			</c:forEach>

		</ul>
	</div><!--end newslist-->
	<div class="pages">
                	              <span class="box btnpre">

                	              	<span class="title">总共</span><span class="title_text">${zqdatas.totalPages}</span><span class="title">页&nbsp;</span>
									  <span class="title">当前第</span><span class="title_text">${zqdatas.pageNumber}</span><span class="title">/</span>
									  <span class="title_text">${zqdatas.totalPages}</span><span class="title">页&nbsp;&nbsp;</span>
									  <table border="0" cellspacing="0" cellpadding="0">
										  <tbody><tr><td><table width="55" border="0" cellpadding="0" cellspacing="0"><tbody>
										  <tr> <td width="24"><a href="article_list/${type}.jhtml?pageNumber=1" class="page">首页</a></td></tr></tbody>
										  </table></td><td><table width="67" border="0" cellpadding="0" cellspacing="0"><tbody>
										  <tr> <td width="36"><a href="article_list/${type}.jhtml?pageNumber=${zqdatas.pageNumber-1}" class="page">上一页</a></td>
										  </tr></tbody></table>
									  </td><td><table width="67" border="0" cellpadding="0" cellspacing="0"><tbody>
										  <tr> <td width="36"><a href="article_list/${type}.jhtml?pageNumber=${zqdatas.pageNumber+1}" class="page" target="_self">下一页</a></td></tr></tbody></table></td><td>
										  <table width="55" border="0" cellpadding="0" cellspacing="0"><tbody><tr>  <td width="24"><a href="article_list/${type}.jhtml?pageNumber=${zqdatas.totalPages}" class="page" target="_self">尾页</a></td></tr></tbody></table></td><td style="padding-left:40px;">
									  <select name="select" style="margin-bottom:-3px;" onchange="location.replace(this.value)"><option selected="">跳至</option>
										  <c:forEach begin="1" end="${zqdatas.totalPages}" var="v">
										  <option value="article_list/${type}.jhtml?pageNumber=${v}">${v}</option>
										  </c:forEach>
									  </select></td></tr></tbody></table> </span>
	</div>

</div><!--end overlay-->
