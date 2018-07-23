<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="static/public/css/font.css">
<link rel="stylesheet" href="static/public/css/xadmin.css">
<link rel="stylesheet" href="static/public/lib/layui/css/layui.css">
<link rel="stylesheet"
	href="static/public/lib/layui/css/modules/layer/default/layer.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="static/public/lib/layui/layui.all.js" charset="utf-8"></script>
<script type="text/javascript" src="static/public/js/xadmin.js"></script>
<link rel="stylesheet" href="static/public/lib/zTree/css/bootstrapStyle.css" type="text/css">
<script type="text/javascript" src="static/public/lib/zTree/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="static/public/lib/zTree/js/jquery.ztree.exedit.min.js"></script>
<script>
	$(function() {
		layui.use([ 'form', 'element' ], function() {
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
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">演示</a>
			<a> <cite>导航元素</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height:1.6em;margin-top:3px;float:right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height:30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	 <SCRIPT type="text/javascript">
        var setting = {
            view: {
                addHoverDom: addHoverDom,//当鼠标移动到节点上时，显示用户自定义控件  
                removeHoverDom: removeHoverDom, //离开节点时的操作  
                selectedMulti: false
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                enable: false,
                editNameSelectAll: false
            },
            callback: {  
                onRemove: onRemove, //移除事件  
                onRename: onRename //修改事件  
            }  
        };

        $(document).ready(function(){
        	$.ajax({
                url: 'admin/meta/loadTree.jhtml',
                type: 'get',
                dataType: 'json',
                success: function (data) {
                    $.fn.zTree.init($("#treeDemo"), setting, data);
                }
            });
        });

        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='添加分类' onfocus='this.blur();'></span>";
            var editStr = "<span class='button edit' id='editBtn_" + treeNode.tId
                + "' title='修改分类' onfocus='this.blur();'></span>";
            var delStr = "<span class='button remove' id='delBtn_" + treeNode.tId
                + "' title='删除分类' onfocus='this.blur();'></span>";
            sObj.after(delStr);
            sObj.after(editStr);
            sObj.after(addStr);


            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                x_admin_show('添加分类','admin/meta/add_category.jhtml?parent='+treeNode.id,850,500);
                /*var name='请修改节点名称';
            	$.post("admin/meta/add_category.jhtml",
            		    {
            		      parent:treeNode.id,
            		      name:name
            		    },
            		    function(data,status){
            		    	if(status=="success"){
            		    		 var newID = data; //获取新添加的节点Id
            		             zTree.addNodes(treeNode, {id:newID, pId:treeNode.id, name:name}); //页面上添加节点
            		             var node = zTree.getNodeByParam("id", newID, null); //根据新的id找到新添加的节点
            		             zTree.selectNode(node); //让新添加的节点处于选中状态
            		             layer.msg("添加成功！");
            		    	}
            		    });*/
                return false;
            });

            var edit = $("#editBtn_"+treeNode.tId);
            if (edit) edit.bind("click", function(){
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                x_admin_show('修改分类','admin/meta/edit_category.jhtml?id='+treeNode.id,850,500);
                return false;
            });

            var del = $("#delBtn_"+treeNode.tId);
            if (del) del.bind("click", function(){
                $.post("admin/meta/del_category.jhtml",{id:treeNode.id, },
                    function(data,status){
                        if(data=="ok"){
                            layer.msg("删除成功！");
                            location.reload();
                        }else{
                            layer.msg("删除失败，请重新刷新页面！");
                        }
                    });
                return false;
            });
        };
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
            $("#editBtn_"+treeNode.tId).unbind().remove();
            $("#delBtn_"+treeNode.tId).unbind().remove();
        };
        function onRename(e, treeId, treeNode, isCancel) {
            x_admin_show('修改分类','admin/meta/edit_category.jhtml?id='+treeNode.id,850,500);
        	/*$.post("admin/meta/up_category.jhtml",
        		    {
        		      id:treeNode.id,
        		      name:treeNode.name
        		    },
        		    function(data,status){
        		    	if(status=="success"){
        		    		layer.msg("更新成功！");
        		    	}else{
        		    		layer.msg("更新失败，请重新刷新页面！");
        		    	}
        		    });*/
        }
        function onRemove(e, treeId, treeNode) {
        	$.post("admin/meta/del_category.jhtml",{id:treeNode.id, },
        		    function(data,status){
        		if(data=="ok"){
		    		layer.msg("删除成功！");
		    	}else{
		    		layer.msg("删除失败，请重新刷新页面！");
		    	}
           });
        }  
    </SCRIPT>
</body>

</html>