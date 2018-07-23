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
        <button class="layui-btn" onclick="x_admin_show('添加任务','admin/task/addview.jhtml',350,500)"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
      </xblock>
      <div style="border: 1px grey; width: 200px;height: 200px;"></div>
      <div class="page">
        <div>
          <a class="prev" href="">&lt;&lt;</a>
          <a class="num" href="">1</a>
          <span class="current">2</span>
          <a class="num" href="">3</a>
          <a class="num" href="">4</a>
          <a class="num" href="">5</a>
          <a class="num" href="">489</a>
          <a class="next" href="">&gt;&gt;</a>
        </div>
      </div>

    </div>
    <script>
      
     

      /*用户-删除*/
      function del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $.post("admin/task/del.jhtml?taskId="+id,function(){
            	  $(obj).parents("tr").remove();
                  layer.msg('已删除!',{icon:1,time:1000});
              });
             
          });
      }
      
     var icandoIt=function(taskId,aidUserId){
    	 layer.confirm('确认要接单吗？',function(index){
    		 var url="admin/task/iCanDoIt.jhtml?taskId="+taskId+"&aidUserId="+aidUserId;
             //发异步删除数据
             $.post(url,function(data){
            	 layer.alert("接单成功", {icon: 6},function () {
            		 window.location.reload();
                 });
             });
            
         });
     };

    </script>
  </body>

</html>