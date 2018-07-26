
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<head>
 <link rel="shortcut icon" href="/favicon.ico">
 <base href="<%=basePath%>">
 
 <title>编程攻略</title>
 <script src="static/js/jquery-3.3.1.min.js"></script>
  <script src="static/editor/wangEditor.js"></script>
 <script>
 
 $(function() {

	//隐藏浏览器滚动条
	 document.body.parentNode.style.overflowY = "hidden";
	//创建网页编辑器
	 var E = window.wangEditor;
	 var editor = new E("#menu","#editor");
	 editor.customConfig.menus = ['head', 'bold', 'fontSize','fontName', 'underline','foreColor', 'link', 'list', 'justify', 'quote', 'table', 'video', 'code'];
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
    								var div="<div name='subChild' id='"+jsonData[i].id+"' oid='"+jsonData[i].oid+"' pid='"+oThis.attr('id')+"' style='text-overflow:ellipsis;overflow:hidden;white-space:nowrap;background-color:#f1f1f1;margin-top:5px;margin-left:20px;font-size:15px;color: rgb(153, 153, 153)' contenteditable='false'>"+jsonData[i].title+"</div>";
                    				oThis.after(div);
                    			 }
                    			 oThis.attr("hasChild","true");
                    		 });
                		 }
                		//end:如果没有子项目，发送ajax请求，如果有子项，可折叠
                		
                	 }
                	 
                	 $("#content").animate({scrollTop:0},300);
                	 editor.$textElem.attr('contenteditable', true);
                	 $(this).parents("div[name=category]").find("div[name=item]>div").css("background-color","").css("color","rgb(153, 153, 153)").removeAttr("click");
                	 $(this).css("background-color","#2d3e50").attr("click","on");
                	 $(this).css("color","white");
                	 var id=$(this).attr("id");
                	 var data={};
                	 data.id=id;
                	 $.post("<%=basePath%>findData.jhtml",data,function(msg){
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
 		$("#container").css("height",$(document).height());
 		var height=($(document).height())-150-35;
 		$("#category").css("height",height);
 	});
</script>
 
 <style>
  * {
   padding: 0px;
   margin: 0px;

  }

 </style>

</head>

<body>

<div id="container" style="width: 100%;">
 <div style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width: 100%;height: 150px;background-color: #2d3e50;font-weight: bold;font-size: 88px;text-align: center;color: white;line-height: 150px;">编程攻略大典</div>
 <div style="width: 100%;height: auto;">
	<div style="width: 18%;float: left;">
		<!-- begin:menu -->
	  	<div style="width: 100%;background-color: #f1f1f1;overflow-x:hidden;height: 0px;" id="category" name="category">
		    <div id="mainItem" style="height: 20px;font-weight: bold;" onmouseover="this.style.cursor='pointer'">目录</div>
		    <c:forEach items="${itembox}" var="item">
		     <div name="divItem" style="height: auto;margin-top:5px;">
		      <div style="height: 25px;">
		       <div style="height: 18px;width: 2px;background-color: #563d7c;float: left;position: relative;left: 20px;"></div>
		       <div name="indexItem" style="width:70%;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;height: 22px;color: #563d7c;float: left;font-weight: bold;line-height: 30px;position: relative;left: 30px;background-color:#f1f1f1;font-size: 15px;" id="${item.id}" oid="${item.oid }" contenteditable="false">${item.title}</div>
		      </div>
		      <div name="item" style="height: auto;color: #999;font-weight: bold;clear: both;position: relative;left: 18%;">
		       <c:forEach var="child" items="${item.child}">
		       		
			        <div id="${child.id}" pid="${item.id }"  hasChild='false'  oid="${child.oid}" name="subItem" style="height: 22px;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap; background-color: #f1f1f1; margin-top: 5px; cursor: text; color: rgb(153, 153, 153);font-size: 15px;" contenteditable="false" >
				       <c:if test="${fn:length(child.child)!=0}">
				    	 <div id="ex" style="border:1px solid grey;font-size: 12px;float: left;height: 10px;position: relative;top: 5px;line-height: 8px;width: 9px;">+</div>
				    	</c:if>	${child.title}
			        </div>
		       </c:forEach>	
			       
		      </div>
		     </div>
		    </c:forEach>
	 	</div>
	 	<!-- end:menu -->
	 	<!-- begin:save -->
	 	<div>
	 		<input  type="button" style="width: 100%;height: 35px;background-color: #2d3e50;color: white;font-weight: bold;float: left;" value="向程序员疯子们致敬"/>
	 		
	 	</div>
	 	<!-- end:save -->
	</div>
 
 	<div id="content" style="float: left;height: 600px;width: 82%;overflow-x:hidden;">
    	<div id="menu" style="width: 100%;border:1px solid grey;" ></div>
	    <div id="editor" style="width: 100%;height: 800px;"></div>
 	</div>
 </div>
  <div style="position:absolute; right:15px; bottom:0px; width:100px; height:120px;">
 	<div><img src="static/images/erweima.jpg" width="100px;"></div>
 	<div style="font-weight: bold;font-size: 12px;text-align: center;color: #2d3e50">IT咨询加此微信</div>
 </div> 
</div>

</body>

</html>
