
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
	 //使用ctrl+s保存文章
	 $(document).keydown(function(e){
		   if( e.ctrlKey  == true && e.keyCode == 83 ){
			   var item={};
			    item.msg=$("div[click=on]").attr("id")+"@"+editor.txt.html();
	 			$.post("<%=basePath%>saveData.jhtml",item,function(msg){
	 				 editor.$textElem.attr('contenteditable', false);
	 			});
		      return false; // 截取返回false就不会保存网页了
		   }
		});
	//隐藏浏览器滚动条
	 document.body.parentNode.style.overflowY = "hidden";
	//创建网页编辑器
	 var E = window.wangEditor;
	 var editor = new E("#menu","#editor");
	 editor.customConfig.menus = ['head', 'bold', 'fontSize','fontName', 'underline','foreColor', 'link', 'list', 'justify', 'quote', 'table', 'video', 'code'];
	 editor.customConfig.uploadImgServer = '<%=basePath%>upload.jhtml'; //上传URL
	 editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
	 editor.customConfig.uploadImgMaxLength = 5;    
	 editor.customConfig.uploadFileName = 'myFileName';
	 editor.customConfig.uploadImgHooks = {
	 customInsert: function (insertImg, result, editor) {
	      // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
	      // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
	      // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
	      var url =result.data;
	      insertImg(url);
	      // result 必须是一个 JSON 格式字符串！！！否则报错
	             }
	         };
	 editor.create();
	 editor.$textElem.attr('contenteditable', false);//默认关闭编辑器
	 
     //禁用鼠标右键
     $('body').on("contextmenu", function() {
         return false;
     }).click(function() {
         $("div[name=menu]").hide();
     });
     $("div[name=category]").on("keydown mouseover dblclick contextmenu click", "div[name=item]>div",function(event) {

             switch (event.type) {
                 case "mouseover":
                     if($(this).attr("contenteditable")=="true"){
                    	 $(this).css("cursor","text");
                      }
                     else{$(this).css("cursor","pointer");}
                     break;
                 case "dblclick":
                	 if($(this).css("background-color")!="rgb(45, 62, 80)"){return;}
                     var isEdit=$(this).attr("contenteditable");
                     if(isEdit=="true"){
                         if($(this).text().trim()==""){
                        	 $(this).text("请输入……");
                          }
                     }else{
                         $(this).attr("contenteditable", true);
                         $(this).css("border","1px solid grey");
                         $(this).css("background-color", "white");
                         $(this).css("color", "rgb(153, 153, 153)");
                     }
                     //关闭编辑器编辑模式
                     editor.$textElem.attr('contenteditable', false);
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
                    			 for(var i=0;i<jsonData.length;i++){
    								var div="<div name='subChild' id='"+jsonData[i].id+"' oid='"+jsonData[i].oid+"' pid='"+oThis.attr('id')+"' style='text-overflow:ellipsis;overflow:hidden;white-space:nowrap;background-color:#f1f1f1;margin-top:5px;margin-left:20px;font-size:15px;color: rgb(153, 153, 153)' contenteditable='false'>"+jsonData[i].title+"</div>";
                    				oThis.after(div);
                    			 }
                    			 oThis.attr("hasChild","true");
                    		 });
                		 }
                		//end:如果没有子项目，发送ajax请求，如果有子项，可折叠
                		
                	 }
                	 //begin:若有一个索引处于编辑状态，其他索引不得点击
                	 var isEdit=$(this).attr("contenteditable");
                	 if(isEdit=="true"){return;}
                	 $(this).siblings().each(function(){
                		 var _isEdit=$(this).attr("contenteditable");
                		 if(_isEdit=="true"){
                			 isEdit=_isEdit;
                		 }
                	 });
                	 if(isEdit=="true"){
                		 return;
                	 }
                	//end:若有一个索引处于编辑状态，其他索引不得点击
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
                 case "keydown":
                     //监听enter键
                     if(event.which == "13"){
                         $(this).attr("contenteditable","false");
                         $(this).css("background-color","#f1f1f1");
                         $(this).css("border","none");
                         $("div[id=ex]").remove();
                         //为什么此处要遍历所有子项?
                         //因为添加一项的时候，会通通改变所有oid的值
                         //当按下enter键的时候，会将所有oid改变的值存入数据库
                         var divPid="div[pid="+$(this).attr("pid")+"]";
                         $(divPid).each(function(){
                       	  	//Begin:将子项数据保存到服务端
                            var item={};
                            item.title=$(this).html().trim();
                            item.pid=$(this).attr("pid");
                            item.oid=$(this).attr("oid");
                            if($(this).attr("id")!=undefined){
                                item.id=$(this).attr("id");
                            }
                            var oThis=$(this);
                          	$.post("<%=basePath%>save.jhtml",item,function(message){
                               var msg=message.split(":");
                               var rdate=msg[0];
                               var id=msg[1];
                               if(rdate=="success"){
                                   oThis.attr("id",id).attr("contenteditable", false);
                                   oThis.css("background-color", "#f1f1f1");
                                   oThis.css("color", "rgb(153, 153, 153)");
                                   oThis.css("border","none");
                                   oThis.blur();
                               }else{
                                   oThis.text("保存失败……");
                               }
                            }); 
                            //End:将子项数据保存到服务端
                         }); 
                     }

                     break;

             }

         }

     ).css("cursor","pointer");

     $("div[id=mainItem]").dblclick(function(){
    	 	//获取最后一个兄弟节点
    	 var oid=$(this).parent().children("div:last-child").find("div[name='indexItem']").attr("oid");
    	 oid=(oid==undefined?0:parseInt(oid)+1);
         var div="<div name='divItem' style='height: auto;margin-top:5px;'>"+
             "<div style='height: 35px;'>"+
             "<div style='height: 22px;width: 2px;background-color: #563d7c;float: left;position: relative;left: 20px;'></div>"+
             "<div  name='indexItem' oid="+oid+" style='width:70%;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;height: 22px;color: #563d7c;float: left;font-weight: bold;line-height: 30px;position: relative;left: 30px;background-color:white;font-size: 15px;' contenteditable='true'  >请输入……</div>"+
             "</div>"+
             	"<div name='item' style='height: auto;color: #999;font-weight: bold;clear: both;position: relative;left: 18%;'></div>"+
             "</div>";
          
         $(this).parent().append(div);
      
     });
     $("div[name=category]").on("dblclick contextmenu click","div[name=indexItem]",function(e){
         switch (e.type) {
            //折叠
             case "click":
            	var obj=$(this).parent().next();
                if(obj.css("display")=="none"){obj.slideDown();}
                else{obj.slideUp();}
            	
            	 
             break;
             case "dblclick":
                 var isEdit=$(this).attr("contenteditable");
                 if(isEdit=="true"){
	                 if($(this).text().trim()==""){
	                     $(this).text("请输入……");
	                 }
	                 //begin:将数据发送到服务端
	                 var data={};
	                 data.title=$(this).text().trim();
	                 data.pid=0;
	                 data.oid=$(this).attr("oid");
	                 if(!$(this).attr("id")==""){
	                     data.id=$(this).attr("id");
	                 }
	                 var oThis=$(this);
	                 $.post("<%=basePath%>save.jhtml",data,function(message){
	                     var msg=message.split(":");
	                     var rdate=msg[0];
	                     var id=msg[1];
	                     if(rdate=="success"){
	                         oThis.attr("contenteditable", false);
	                         oThis.css("border","none");
	                         oThis.css("background-color", "#f1f1f1");
	                         oThis.css("color","#563d7c");
	                         oThis.attr("id",id);
	                         oThis.blur();
	                     }else{
	                         oThis.text("保存失败……");
	                     }
	
	                 });
                 //end:将数据发送到服务端
                 }else{
                	$(this).attr("contenteditable", true);
                    $(this).css("border","1px solid grey");
                    $(this).css("background-color", "white");
                  }
                 break;
             case "contextmenu":
                 if($(this).attr("contenteditable")=="true"){return;}
                 $("div[name=menu]").remove();
                 var div="<div name='menu' style='box-sizing: border-box;position: absolute;width: 130px;border-radius: 5px;background-color: white;height:55px;font-weight: bold;border:1px solid #2d3e50;font-size:14px;line-height:25px;color:#2d3e50;'>"+
                     "<div style='text-align:center'><span name='itemMovUp'>向上移动</span>|<span name='itemMovDown'>向下移动</span></div>"+
                     "<div style='text-align:center'><span name='itemadd'>添加子项</span>|<span name='itemdel'>删除该项</span></div>"+
                     "</div>";
                 $(div).appendTo('body');
                 var oThis=$(this);
                 $("div[name=menu] span").on("click mouseover mouseout", function(e) {
                     switch(e.type){
                         case "mouseover":
                             $(this).css("cursor","pointer").css("background-color","#f1f1f1");
                             break;
                         case "mouseout":
                             $(this).css("background-color","white");
                             break;
                         case "click":
                             //添加子项
                             if($(this).attr("name")=="itemadd"){
                                 $('div[name=menu]').remove();
                                 var pid=oThis.parent().children("div[name=indexItem]").attr("id");
                                 var oid=0;
                                 var lastDiv=oThis.parent().next().children("div:last-child");
                                 if(lastDiv.length!=0){
                                     oid=parseInt(lastDiv.attr("oid"))+1;
                                 }
                                 var div="<div oid="+oid+" pid="+pid+" hasChild='false' name='subItem' contenteditable='true' style='height:22px;border:1px solid grey;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;background-color:white;margin-top:5px;font-size: 15px;'>请输入……</div>";
                                 oThis.parent().next().append(div);

                             }else if($(this).attr("name")=="itemdel"){
                            	 var id=oThis.attr("id");
                            	 var item={};
                            	 item.id=id;
                            	 $.post("<%=basePath%>del.jhtml",item,function(msg){
                            		 oThis.parent().parent().remove();
                            	 });
                             //上下移动
                             }else{
                            	 var otherDiv="";
                            	 var otherDivChild="";
                            	 switch($(this).attr("name")){
                         	 		case "itemMovUp":
                         	 		 	otherDiv=oThis.parents("div[name=divItem]").prev();
                         	 		break;
                         	 		case "itemMovDown":
                         	 			otherDiv=oThis.parents("div[name=divItem]").next();
                         	 		break;
                         	 	 }
                                 otherDivChild=otherDiv.find("div[name=indexItem]");
                            	 //获取各自的oid
                            	 var otherOid=otherDivChild.attr("oid");
                            	 var thisOid=oThis.attr("oid");
                            	 var thisId=oThis.attr("id");
                            	 var otherId=otherDivChild.attr("id");
                            	 oThis.attr("oid",otherOid);
                            	 var div=oThis.parents("div[name=divItem]").remove().clone();
                            	 switch($(this).attr("name")){
                            	 	case "itemMovUp":
                            	 		otherDiv.before(div);
                            	 	break;
                            	 	case "itemMovDown":
                            	 		otherDiv.after(div);
                            	 	break;
                            	 }
                            	 otherDivChild.attr("oid",thisOid);
                            	 //将数据传送到服务端
                                 var item={};
                                 item.data=thisId+":"+otherId+":"+thisOid+":"+otherOid;
                                 $.post("<%=basePath%>alterOrder.jhtml",item); 
                            	 
                             } 
                             break;
                     };

                 });
                 var x=e.pageX;
                 var y=e.pageY;
                 $("div[name=menu]").css("left",x).css("top",y).show();
                 break;

         };
     });
     //给每一个子项目添加右键菜单
     $("div[name=category]").on("contextmenu","div[name=item]>div",function(e){
    	 if($(this).css("background-color")!="rgb(45, 62, 80)"){return;}
         $("div[name=menu]").remove();
         var div="";
         if($(this).attr("name")=="subChild"){
        	 div="<div name='menu' style='display:none;box-sizing: border-box;position: absolute;width: 80px;border-radius: 5px;background-color: white;font-weight: bold;border:1px solid #2d3e50;font-size:12px;line-height:25px;color:#2d3e50;'>"+
        	 "<div style='text-align:center'><span name='itemMovUp'>向上移动</span></div>"+
        	 "<div style='text-align:center'><span name='itemMovDown'>向下移动</span></div>"+
             "<div style='text-align:center'><span name='itemdel'>删除该项</span></div>"+
             "</div>";
         }else if($(this).attr("name")=="subItem"){
	         div="<div name='menu' style='display:none;box-sizing: border-box;position: absolute;width: 120px;border-radius: 5px;background-color: white;font-weight: bold;border:1px solid #2d3e50;font-size:12px;line-height:25px;color:#2d3e50;'>"+
	             "<div style='text-align:center'><span name='itemUpAdd'>向上插入</span>｜<span name='itemdownAdd'>向下插入</span></div>"+
	             "<div style='text-align:center'><span name='itemMovUp'>向上移动</span>｜<span name='itemMovDown'>向下移动</span></div>"+
	             "<div style='text-align:center'><span name='itemdel'>删除该项</span>｜<span name='itemAdd'>添加子项</span></div>"+
	             "</div>";
         }
         	
         $(div).appendTo('body');
         //菜单监听
         var oThis=$(this);
         $("div[name=menu] span").on("click mouseover mouseout", function(e) {
             switch(e.type){
                 case "mouseover":
                     $(this).css("cursor","pointer").css("background-color","#f1f1f1");
                     break;
                 case "mouseout":
                     $(this).css("background-color","white");
                     break;
                 case "click":
                     var divname=$(e.target).attr("name");
                     var div=oThis.clone().text("请输入……").attr("contenteditable",true).css("background-color","white").css("border","1px solid grey").css("color","#2d3e50").removeAttr("id");
                     switch(divname){
                         //向下添加一项
                         case "itemdownAdd":
                        	 oThis.siblings().css("background-color","#f1f1f1");
                        	 oThis.parent().find("div[pid="+oThis.attr('id')+"]").last().after(div).css("color","#2d3e50");
                             oThis.nextAll().each(function(){
                            	 if($(this).attr("name")!="subChild"){
                                 	var i=parseInt($(this).prev().attr("oid"))+1;
                                 	$(this).attr("oid",i);
                            	 }
                             }); 
                             break;
                         //向上添加一项
                         case "itemUpAdd":
                        	 oThis.siblings().css("background-color","#f1f1f1");
                             oThis.before(div);
                        	 oThis.prev().css("color","#2d3e50");
                             //向上插入一项,以下的项逐步加一
                             oThis.prev().nextAll().each(function(){
                                 var i=parseInt($(this).attr("oid"))+1;
                                 $(this).attr("oid",i);
                             });

                             break;
                         case "itemdel":
                             //删除子项
                             var data={};
                             data.id=oThis.attr("id");
                             //其项以下的兄弟节点oid全部-1
                             $.post("<%=basePath%>del.jhtml",data,function(message){
                                 oThis.nextAll().each(function(){
                                     var i=parseInt($(this).attr("oid"))-1;
                                     $(this).attr("oid",i);
                                     var item={};
                                     item.data=$(this).attr("id")+":"+$(this).attr("oid");
                                     $.post("<%=basePath%>updateOrder.jhtml",item);
                                 });
                                 if(oThis.attr("name")=="subItem"){
                                	$("div[pid="+oThis.attr('id')+"]").remove();
                                 }
                                	 oThis.remove();
                                 
                             });

                             break;
                         case "itemMovDown":
                        	 if(oThis.next().attr("name")=="subItem"&&oThis.attr("name")!="subItem"){return;}
                        	 	 oThis.attr("hasChild","false");
                        	 	 var item={};
                        		 var thisId=oThis.attr("id");
                        		 if(oThis.attr("name")=="subChild"){
                            		 var prevId=oThis.next().attr("id");
                            		 var ctxt= oThis.text().trim();
                            		 var otxt=oThis.next().text().trim();
                            		 item.data=thisId+":"+prevId;
                            		 $.post("<%=basePath%>alterOrder.jhtml",item,function(msg){
                                         //交换文本信息
                                         oThis.text(otxt).next().text(ctxt);
                                     });
                            		 
                            	 }else if(oThis.attr("name")=="subItem"){
                            		var thisOid=oThis.attr("oid");
                         			//删除该子项
                                  	$("div[pid="+thisId+"]").remove();
                                  	var nextOid=(window.parseInt(oThis.attr("oid"))+1);
                                  	var nextDiv=$("div[name=subItem][oid="+nextOid+"]");
                                  	nextDiv.attr("hasChild","false");
                                  	var nextId=nextDiv.attr("id");
                                  	$("div[pid="+nextId+"]").remove();
                                  	//将数据传送到服务端
                                  	var item={};
                                  	item.data=thisId+":"+nextId+":"+thisOid+":"+nextOid;
                                  	$.post("<%=basePath%>alterOrder.jhtml",item,function(msg){
                                      	//交换文本信息
                                      	var div=oThis.clone().attr("oid",nextOid);
                                  		nextDiv.after(div).attr("oid",thisOid);
                                   	 	oThis.remove();
                                  	});
                            	 }
                        		
                             break;
                         case "itemMovUp":
                        	 if(oThis.prev().attr("name")=="subItem"&&oThis.attr("name")!="subItem"){return;}
                        	 oThis.attr("hasChild","false");
                        	 var item={};
                        	 var thisId=oThis.attr("id");
                        	 if(oThis.attr("name")=="subChild"){
                        		 var prevId=oThis.prev().attr("id");
                        		 var ctxt= oThis.text().trim();
                        		 var otxt=oThis.prev().text().trim();
                        		 item.data=thisId+":"+prevId;
                        		 $.post("<%=basePath%>alterOrder.jhtml",item,function(msg){
                        			 oThis.text(otxt).prev().text(ctxt);
                                 });
                        		 
                        	 }else if(oThis.attr("name")=="subItem"){
                        		//删除该子项
                                 var thisOid=oThis.attr("oid");
                                 $("div[pid="+thisId+"]").remove();
                                 var prevOid=(window.parseInt(oThis.attr("oid"))-1);
                                 var prevDiv=$("div[name=subItem][oid="+prevOid+"]");
                                 var prevId=prevDiv.attr("id");
                                 prevDiv.attr("hasChild","false");
                                 $("div[pid="+prevId+"]").remove();
                                 //获取上一个兄弟节点
                                 var prevId=oThis.prev().attr("id");
                                 
                                 item.data=thisId+":"+prevId+":"+thisOid+":"+prevOid;
                                 $.post("<%=basePath%>alterOrder.jhtml",item,function(msg){
                                	 var div=oThis.clone().attr("oid",prevOid);
                                	 prevDiv.before(div).attr("oid",thisOid);
                                	 oThis.remove();
                                 });
                        	 }
                             
                             break;
                         case "itemAdd":
                        	  //添加新的一项,将div的滚动条移动到最尾
                        	  if($("div[pid="+oThis.attr("id")+"]").last().length==0){
                        		  var div="<div name='subChild' oid='0' pid="+oThis.attr("id")+" contenteditable='true' style='background-color:white;border:1px solid grey;margin-top:5px;margin-left:20px;font-size:15px;'>请输入……</div>";
                        		  oThis.after(div);
                        	  }else{
                        		  var oid=(window.parseInt($("div[pid="+oThis.attr("id")+"]").last().attr("oid"))+1);
                            	  var div="<div name='subChild' oid="+oid+" pid="+oThis.attr("id")+" contenteditable='true' style='background-color:white;border:1px solid grey;margin-top:5px;margin-left:20px;font-size:15px;'>请输入……</div>";
                            	  $("div[pid="+oThis.attr("id")+"]").last().after(div);
                        	  }
                        	  //距离顶部的距离
                        	  $("#category").scrollTop($("#category")[0].scrollHeight );
                        	 break;
                     }
                     break;
             };

         });
         //获取鼠标x、y点的位置
         var x=e.pageX;
         var y=e.pageY;
         $("div[name=menu]").css("left",x).css("top",y).show();
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
