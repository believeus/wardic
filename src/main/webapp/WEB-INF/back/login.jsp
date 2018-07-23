<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!doctype html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>广州中桥能源后台管理系统</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="static/public/css/font.css">
	<link rel="stylesheet" href="static/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="static/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="static/public/js/xadmin.js"></script>
	
</head>
<body class="login-bg">
     <!-- Begin Name:wuqiwei 此处必须加：不加验证之后就不能表单提交了,所以如果已经验证直接跳转到/admin/login.jhtml页面 -->
     <shiro:authenticated>
      <script type="text/javascript">
        window.location.href ="admin/login.jhtml";
      </script>
	</shiro:authenticated>
	<!-- End Name:wuqiwei 此处必须加：不加验证之后就不能表单提交了,所以如果已经验证直接跳转到/admin/login.jhtml页面 -->
    <div class="login">
        <div class="message" style="font-size: 22px;padding: 18px 10px 19px 18px;">
        	广州中桥能源后台管理系统
        </div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form"  action="admin/loginView.jhtml">
            <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
       /*  $(function  () {
            layui.use('form', function(){
              var form = layui.form;
              // layer.msg('玩命卖萌中', function(){
              //   //关闭后的操作
              //   });
              //监听提交
              form.on('submit(login)', function(data){
                // alert(888)
                layer.msg(JSON.stringify(data.field),function(){
                    location.href='admin/login.jhtml'
                });
                return false;
              });
            });
        })
 */
        
    </script>

</body>
</html>