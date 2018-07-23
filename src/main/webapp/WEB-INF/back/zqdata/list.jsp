<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="date" uri="/tag/datetag.tld"%>  
<!DOCTYPE html>
<html>
  
  <head>
   <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>广州中桥能源后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="static/public/css/font.css">
    <link rel="stylesheet" href="static/public/css/xadmin.css">
    <link rel="stylesheet" href="static/public/lib/layui/css/layui.css">
    <link rel="stylesheet" href="static/public/lib/layui/css/modules/layer/default/layer.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="static/public/lib/layui/layui.all.js" charset="utf-8"></script>
    <script type="text/javascript" src="static/public/js/xadmin.js"></script>
	 <script>
	 $(function(){
		 layui.use(['form','element'],
				    function() {
				       layer = layui.layer;
				       element = layui.element;
				    });
	 });
    </script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <xblock>
      	  <c:if test="${sessionScope.sessionUser.username eq 'admin'}">
        	<button class="layui-btn" onclick="x_admin_show('添加信息','admin/data/addView.jhtml',800,550)"><i class="layui-icon"></i>添加</button>
         </c:if>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
          	<th>ID</th>
            <th>标题</th>
            <th>摘要</th>
            <th>创建时间:</th>
            <th>操作</th>
           </tr>
        </thead>
        <tbody>
        <c:forEach var="data" items="${list.content}">
        		<tr>
        			<td><span>${data.id}</span></td>
	        		<td><span>${data.title}</span></td>
	        		<td><span>${data.description}</span></td>
	        		<td><date:date value="${data.createTime}" pattern="yyyy-MM-dd"/></td>
                    <td><a href="javascript:void(0)" onclick="x_admin_show('修改信息','admin/data/editView.jhtml?id=${data.id}',800,550)">编辑</a>|<a href="javascript:void(0)" onclick="del(this,'${data.id}')">删除</a></td>
        		</tr>
        	
        </c:forEach>
          
         
        </tbody>
      </table>
      <div class="page">
        <div>
        </div>
      </div>
        <script type="text/javascript">
            var url = 'admin/data/list.jhtml?pageNumber=';
            var totalPage = "${list.totalPages}";
            var pageNumber = "${list.pageNumber}";
            initPage(url,totalPage,pageNumber);
        </script>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

      
      /*用户-删除*/
      function del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              var url="admin/data/del.jhtml?id="+id;
              $.post(url,function(){
            	  $(obj).parents("tr").remove();
                  layer.msg('已删除!',{icon:1,time:1000});
                  window.location.reload();
              });
              
          });
      }


      function delAll(argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
  </body>

</html>