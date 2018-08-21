<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<head>
 <meta name="keywords" content="编程攻略 java培训 高等数学 java编程 java教程" />
 <meta name="description" content="编程攻略是集IT技术原创分享和经验分享的一个IT知识综合型网站" />
 <link rel="shortcut icon" href="/favicon.ico">
 <base href="<%=basePath%>">
 <title>编程攻略</title>
 <script>
 var browser =navigator.userAgent;
  //是IE浏览器，就跳转页面
  if(browser.indexOf("compatible")!=-1){
	window.location.href="ieHell.jhtml";
  }
</script>
 <script src="static/js/jquery-3.3.1.min.js"></script>
  <script src="static/editor/wangEditor.js"></script>

 <script>
 $(function() {
	 //当浏览器大小被拉伸时,重新执行vresize方法
	 var vresize=function(){
			var height=$(document).height();
	 		$("#container").css("height",height);
	 		$("#vhandle").css("height",height);
	 		$("#category").css("height",(height-35-100));
	 		$("#message").css("height",height);
	 };
	vresize();
	$(window).resize(vresize);
	 //左右拖拉效果
	 var vhandle=document.getElementById("vhandle");
	 vhandle.onmousedown=function (e) {
	     var box=document.getElementById("menubox");
	     document.onmousemove=function (e) {
	         box.style.width=e.clientX+"px";
	         var w=$("html").width()-$("#menubox").width()-$("#vhandle").width();
	         $("#message").css("width",w);
	     };
	     document.onmouseup=function (e) {
	         document.onmousemove=null;
	     };
	 };
	//上下拖拉效果
	 var hhandle=document.getElementById("hhandle");
	 hhandle.onmousedown=function (e) {
	    var box=document.getElementById("downbox");
	    document.onmousemove=function (e) {
	        box.style.height=e.clientY+"px";
	        var h=$("body").height()-$("#downbox").height()-$("#hhandle").height();
	        $("#databox").css("height",h);
	    };
	    document.onmouseup=function (e) {
	        document.onmousemove=null;
	    };
	 };
	 
	//隐藏浏览器滚动条
	 document.body.parentNode.style.overflowY = "hidden";
	//创建网页编辑器
	 var editor = new window.wangEditor("#menu","#editor");
	 editor.customConfig.menus = [];
	 editor.create();
	 editor.$textElem.attr('contenteditable', false);//默认关闭编辑器
	 
	 var boxEd = new window.wangEditor("#downMenu","#downEd");
	 boxEd.customConfig.menus = [];
	 boxEd.create();
	 boxEd.$textElem.attr('contenteditable', false);//默认关闭编辑器
	
	 //当点击编辑器中的a标签的时候,将上窗口显示出来
	 $("body").on("click","div[id=editor] a",function(){
		 var link=$(this).attr("link");
		 $.post(link,function(msg){
			 $("#downbox").animate({height:300},300);
			 $("#databox").animate({height:$(document).height()-300-$("#hhandle").height()},1000);
			 boxEd.txt.html(msg);
     	 });
	 });
	 //禁用默认的右键菜单,当点击body是自定义菜单消失
     $("body").on("contextmenu", function() {
         return false;
     }).click(function() {
         $("div[name=menu]").hide();
     });
	 //绑定元素执行完毕后自动移除事件，可以方法仅触发一次的事件。
	
	 
	 /*Begin:展开子目录*/
     $("body").on("click","div[name=subItem]",function(){
    	if($(this).attr("hasChild")=="true"){
 			 $($(this).next().children()).each(function(){
     			 if($(this).css("display")=="none"){
     				 $(this).slideDown();
     			 }else{
             		 $(this).slideUp();
             	 }
     		 });
    	}else{
  			 var item={};
      		 item.id=$(this).attr("id");
      		 var oThis=$(this);
      		 $.post("<%=basePath%>findItem.jhtml",item,function(data){
      			 var data = $.parseJSON(data);
      			 for(var i=0;i<data.length;i++){
					var div="<div name='subChild'  id='"+data[i].id+"' oid='"+data[i].oid+"' pid='"+oThis.attr('id')+"' style='text-overflow:ellipsis;overflow:hidden;white-space:nowrap;background-color: #1b3749;margin-top:5px;margin-left:20px;font-size:15px;color: #ccc;width:75%;cursor:pointer' contenteditable='false'>"+data[i].title+"</div>";
      				oThis.next().append(div);
      			 }
      			 oThis.attr("hasChild","true");
      		 });
    	}
     });
     /*End:展开子目录*/
     /*Begin:点击菜单获取数据*/
     var isMove=true;
     $("body").on("click","div[name=subChild]",function(){
    	 /*begin:编辑状态点击无效*/
    	 if($(this).attr("contenteditable")=="true"){return;}
    	 /*end:编辑状态点击无效*/
     	 $("#content").animate({scrollTop:0},300);
     	 editor.$textElem.attr('contenteditable', false);
     	 $(this).parents("div[name=menubox]").find("div[name=subChild]").css("color","").removeAttr("click");
     	 $(this).css("background-color","#1b3749").attr("click","on");
     	 $(this).css("color","white");
     	 var id=$(this).attr("id");
     	 var data={};
     	 data.id=id;
     	 $.post("<%=basePath%>findData.jhtml",data,function(msg){
     		editor.txt.html(msg);
     		//第一次点击目录,回收目录页
     		if(isMove==true){
     			$("#menubox").animate({width:300},1000);
 				$("#message").animate({width:$(document).width()-300-$("#vhandle").width()},1000);
 				isMove=false;
     		}
     	 });
     });
     /*end:点击菜单获取数据*/
   
 });

 
 </script>
 <!-- 设置导航的高度 -->


</head>

<body style="padding: 0; margin: 0;">

<div id="container" style="width: 100%;height: 100%;">
 <div style="width: 100%;height: auto;">
	<div id="menubox" style="width: 90%;float: left;">
		<div style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width: 100%;height: 100px;background-color: #1b3749;font-weight: bold;font-size: 45px;text-align: center;color: white;line-height: 100px;border-bottom: 1px solid grey;">编程大典</div>
		<!-- begin:menu -->
	  	<div style="width: 100%;background-color: #1b3749;overflow-x:hidden;overflow-y:auto; height: 0px;border-left: 1px solid grey;border-bottom:1px solid grey;border-top: 1px solid grey; " id="category" name="category">
		    <div id="mainItem" style="height: 20px;font-weight: bold;color:white;cursor: pointer;"  onmouseover="this.style.cursor='pointer'">目录索引结构树</div>
		    <c:forEach items="${itembox}" var="item">
		     <div name="divItem" style="height: auto;margin-top:5px;float:left;width:275px;">
		      <div style="height: 25px;">
		       <div style="height: 18px;width: 2px;background-color: white;float: left;position: relative;left: 20px;"></div>
		       <div name="indexItem" style="width:70%;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;height: 25px;color:white;float: left;font-weight: bold;line-height: 30px;position: relative;left: 30px;background-color:#1b3749;font-size: 15px;cursor: pointer;" id="${item.id}" oid="${item.oid }" contenteditable="false">${item.title}</div>
		      </div>
		      <div name="item" style="height: auto;color: #999;font-weight: bold;clear: both;position: relative;left: 18%;width: 95%;">
		       <c:forEach var="child" items="${item.child}">
		       		
			        <div id="${child.id}" pid="${item.id }"  hasChild='false'  oid="${child.oid}" name="subItem" style="height: 22px;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap; background-color: #1b3749; margin-top: 5px; cursor: pointer; color: white;;font-size: 15px;width: 90%;" contenteditable="false" >
				       <c:if test="${fn:length(child.child)!=0}">
				    	 <div id="ex" style="border:1px solid grey;font-size: 12px;float: left;height: 10px;position: relative;top: 5px;line-height: 8px;width: 9px;">+</div>
				    	</c:if>	
				    	${child.title}
			        </div>
			        <div id="subChild"></div>
		       </c:forEach>	
			       
		      </div>
		     </div>
		    </c:forEach>
	 	</div>
	 	<!-- end:menu -->
	 	<!-- begin:save -->
	 	<div>
	 		<div  style="width: 100%;height: 35px;background-color: #1b3749;color: white;font-weight: bold;float: left;line-height: 35px;text-align: center;border-left: 1px solid grey;" >不常在线:微信聊15295432682</div>
	 	</div>
	 	<!-- end:save -->
	</div>
 	<div  id="vhandle" style="float: left;width: 0.5%;background-color: #ccc;height: 10px;cursor: e-resize;"></div>
 	<div id="message" style="float: left;width: 9.5%;height: 0px;">
		<div id="downbox"  style="width: 100%;overflow-x:hidden;height: 0px;overflow-x:hidden;">
			<div id="downMenu" style="width: 100%;height: 30px;"></div>
			<div id="downEd" style="width: 100%;height: 300px;"></div>
		</div>
		<div id="hhandle" style="width:100%;height: 0.5%;background-color: #ccc;cursor: n-resize;"></div>
	 	<div id="databox" style="height: 0px;overflow-x:hidden;width: 100%;height: 99.5%;">
		    <div id="menu" style="width: 100%;border:1px solid grey;"></div>
			<div id="editor" style="width: 100%;height: 380px;">
				<div style="font-size: 20px;font-weight: bold;color: #1b3749;"></div>
			</div>
		</div>
		
 	</div>
 </div>
</div>
</body>

</html>
