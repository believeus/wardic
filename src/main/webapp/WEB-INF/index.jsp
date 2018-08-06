
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
 <script src="static/js/jquery-3.3.1.min.js"></script>
  <script src="static/editor/wangEditor.js"></script>
 <script>
 //使用ctrl+r运行代码
 $(document).keydown(function(e){
	   if( e.ctrlKey  == true && e.keyCode == 82 ){
		   var isfocus=$("div[name=java-code]").attr("focus");
		   if(isfocus==="true"){
				var data={};
			    data.msg=$("div[name=java-code]").text();
	 			$.post("<%=basePath%>compiler.jhtml",data);
		   }
		   
	      return false; // 截取返回false就不会保存网页了
	   }
	}); 
 $(function() {

	//隐藏浏览器滚动条
	 document.body.parentNode.style.overflowY = "hidden";
	//创建网页编辑器
	 var E = window.wangEditor;
	 var editor = new E("#menu","#editor");
	 editor.customConfig.menus = [];
	 editor.create();
	 editor.$textElem.attr('contenteditable', false);//默认关闭编辑器
	
     $('body').on("contextmenu", function() {
         return false;
     }).click(function() {
         $("div[name=menu]").hide();
     });
     $("div[name=category]").on("click mouseover", "div[name=item]>div",function(event) {
             switch (event.type) {
             	case "mouseover":
	                 if($(this).attr("contenteditable")=="true"){
	                	 $(this).css("cursor","text");
	                  }
	                 else{$(this).css("cursor","pointer");}
                 break;
                 case "click":
                	 //begin:如果没有子项目，发送ajax请求，如果有子项，可折叠
                	 if($(this).attr("name")=="subItem"){
                		
                		 if($(this).attr("hasChild")=="true"){
                			 $("div[pid="+$(this).attr("id")+"]").each(function(){
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
                    			 var jsonData = $.parseJSON(data);
                    			 //因为是根据oid从小到大的顺序发送到ajax的
                    			 //而oThis.after是每次都在oThis之后插入的
                    			 //所以要逆过来编译sonData.length-1 到0
                    			 //才能保证oid的正确顺序
                    			 for(var i=jsonData.length-1;i>=0;i--){
    								var div="<div name='subChild' id='"+jsonData[i].id+"' oid='"+jsonData[i].oid+"' pid='"+oThis.attr('id')+"' style='text-overflow:ellipsis;overflow:hidden;white-space:nowrap;background-color: #1b3749;margin-top:5px;margin-left:20px;font-size:15px;color: #f1f1f1;width: 75%;' contenteditable='false'>"+jsonData[i].title+"</div>";
                    				oThis.after(div);
                    			 }
                    			 oThis.attr("hasChild","true");
                    		 });
                		 }
                		//end:如果没有子项目，发送ajax请求，如果有子项，可折叠
                		
                	 }
                	 
                	 $("#content").animate({scrollTop:0},300);
                	 editor.$textElem.attr('contenteditable', true);
                	 $("div[name=item]>div").css("color","").removeAttr("click");
                	 $(this).attr("click","on");
                	 $(this).css("color","white");
                	 var id=$(this).attr("id");
                	 var data={};
                	 data.id=id;
                	 $.post("<%=basePath%>findData.jhtml",data,function(msg){
                		 editor.$textElem.attr('contenteditable', false);//默认关闭编辑器
                		 editor.txt.html(msg);
                	 });
                	 break;

             }

         }

     ).css("cursor","pointer");

     $("div[name=category]").on("click","div[name=indexItem]",function(e){
         switch (e.type) {
            //折叠
             case "click":
            	var obj=$(this).parent().next();
                if(obj.css("display")=="none"){obj.slideDown();}
                else{obj.slideUp();}
            	
            	 
             break;
         };
     });
   
 });

 
 </script>
 <!-- 设置导航的高度 -->
 <script>
 	$(function(){
 		var height=$(document).height();
 		$("#container").css("height",height);
 		$("#vhandle").css("height",height);
 		$("#category").css("height",(height-35-100));
 		$("#data-content").css("height",height);
 	});
 	
</script>

</head>

<body style="padding: 0; margin: 0;">

<div id="container" style="width: 100%;height: 100%;">
 <div style="width: 100%;height: auto;">
	<div id="menubox" style="width: 45%;float: left;">
		<div style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width: 100%;height: 100px;background-color: #1b3749;font-weight: bold;font-size: 45px;text-align: center;color: white;line-height: 100px;border-bottom: 1px solid grey;">编程大典</div>
		<!-- begin:menu -->
	  	<div style="width: 100%;background-color: #1b3749;overflow-x:hidden;overflow-y:auto; height: 0px;border-left: 1px solid grey;border-bottom:1px solid grey;border-top: 1px solid grey; " id="category" name="category">
		    <div id="mainItem" style="height: 20px;font-weight: bold;color:white;"  onmouseover="this.style.cursor='pointer'">目录索引结构树</div>
		    <c:forEach items="${itembox}" var="item">
		     <div name="divItem" style="height: auto;margin-top:5px;">
		      <div style="height: 25px;">
		       <div style="height: 18px;width: 2px;background-color: white;float: left;position: relative;left: 20px;"></div>
		       <div name="indexItem" style="width:70%;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;height: 22px;color:white;float: left;font-weight: bold;line-height: 30px;position: relative;left: 30px;background-color:#1b3749;font-size: 15px;" id="${item.id}" oid="${item.oid }" contenteditable="false">${item.title}</div>
		      </div>
		      <div name="item" style="height: auto;color: #999;font-weight: bold;clear: both;position: relative;left: 18%;width: 95%;">
		       <c:forEach var="child" items="${item.child}">
		       		
			        <div id="${child.id}" pid="${item.id }"  hasChild='false'  oid="${child.oid}" name="subItem" style="height: 22px;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap; background-color: #1b3749; margin-top: 5px; cursor: text; color: white;;font-size: 15px;width: 75%;" contenteditable="false" >
				       <c:if test="${fn:length(child.child)!=0}">
				    	 <div id="ex" style="border:1px solid grey;font-size: 12px;float: left;height: 10px;position: relative;top: 5px;line-height: 8px;width: 9px;">+</div>
				    	</c:if>	
				    	${child.title}
			        </div>
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
 	<div  id="vhandle" style="float: left;width: 0.5%;background-color: #1b3749;height: 10px;cursor: e-resize;"></div>
 	<div id="data-content" style="float: left;height: 0px;width: 100%;overflow-x:hidden;width: 54.5%;">
	    <div id="menu" style="width: 100%;border:1px solid grey;"></div>
		<div id="editor" style="width: 100%;height: 380px;">
			<div style="font-size: 20px;font-weight: bold;color: #1b3749;">Hello……</div>
		</div>
	</div>
 	
 </div>
</div>
<script>
var vhandle=document.getElementById("vhandle");
vhandle.onmousedown=function (e) {
    var box=document.getElementById("menubox");
    document.onmousemove=function (e) {
        box.style.cursor="n-resize";
            box.style.width=e.clientX+"px";
            var w=$("html").width()-$("#menubox").width()-$("#vhandle").width();
            console.info($("#menubox").width());
            $("#data-content").css("width",w);
    };
    document.onmouseup=function (e) {
        document.onmousemove=null;
    };
};

</script>
</body>

</html>
