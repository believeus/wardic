<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!DOCTYPE html>
<head>
<meta name="baidu-site-verification" content="lkkTUJ7jTU" />
 <link rel="shortcut icon" href="/favicon.ico">
 <base href="<%=basePath%>">
 
 <title>编程大典</title>
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
	 <shiro:hasPermission name="user:save"> 
	 //使用ctrl+s保存文章
	 $(document).keydown(function(e){
		   if( e.ctrlKey  == true && e.keyCode == 83 ){
			   var item={};
			    item.itemId=$("div[click=on]").attr("id");
			    item.content=editor.txt.html();
	 			$.post("<%=basePath%>saveData.jhtml",item);
		      return false; // 截取返回false就不会保存网页了
		   }
		});
	 </shiro:hasPermission>
	//隐藏浏览器滚动条
	 document.body.parentNode.style.overflowY = "hidden";
	//创建网页编辑器
	 var E = window.wangEditor;
	 var editor = new E("#menu","#editor");
	 editor.customConfig.menus = ['head', 'bold', 'fontSize','fontName', 'underline','foreColor', 'link', 'list', 'justify', 'quote', 'table', 'video', 'code','image'];
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
	
     <shiro:hasPermission name="user:editMenu"> 
     /*Begin:双击进入编辑模式*/
     $("body").on("dblclick","div[name=subChild]",function(){
         if($(this).attr("contenteditable")=="false"){
        	$(this).attr("contenteditable", true);
         	$(this).css("border","1px solid grey");
         	$(this).css("background-color", "white");
          	$(this).css("color", "#1b3749");
         }
         //关闭编辑器编辑模式
         editor.$textElem.attr('contenteditable', false);
     });
     /*end:双击进入编辑模式*/
     /*begin:敲enter键,将修改的代码保存到服务器中*/
      $("body").on("keydown","div[name=subChild]",function(event){
    	  //非编辑状态enter键无效
    	  if($(this).attr("contenteditable")=="false"){return;}
    	  if(event.which == "13"){ //enter键的键值为13
    		$(this).attr("contenteditable", false),
           	$(this).css("background-color", "#1b3749"),
           	$(this).css("color", "white"),
           	$(this).css("border","none");
            var item={};
            item.title=$(this).text().trim();
            item.pid=$(this).attr("pid");//父id
            item.oid=$(this).attr("oid");//排序id
            if($(this).attr("id")!=undefined){//新添加的菜单是没有id属性的,js的if语句可以判断undefind
               item.id=$(this).attr("id");
            }
            var oThis=$(this);
            /*Begin:将修改的目录保存到数据库*/
            $.post("<%=basePath%>save.jhtml",item,function(message){
                var msg=message.split(":");
                var rdate=msg[0];
                var id=msg[1];
                if(rdate=="success"){
                   oThis.attr("id",id).attr("contenteditable", false);
                   oThis.css("background-color", "#1b3749");
                   oThis.css("color", "white");
                   oThis.css("border","none");
                   oThis.blur();
                 }else{
                     oThis.text("保存失败……");
                 }
              }); 
            /*End:将修改的目录保存到数据库*/
          }
      });
     /*Begin:给subChild添加菜单*/
      $("div[name=menubox]").on("contextmenu","div[name=subChild]",function(e){
    	  if($(this).css("color")!="rgb(255, 255, 255)"){return;};//如果没有被选中,则禁用右键菜单
    	  $("div[name=menu]").remove();//把原来的右键菜单删除
    	  div="<div name='menu' style='display:none;box-sizing: border-box;position: absolute;width: 80px;border-radius: 5px;background-color: white;font-weight: bold;border:1px solid #1b3749;font-size:12px;line-height:25px;color:#1b3749;'>"+
     	 		"<div style='text-align:center;cursor:pointer;'><span name='itemMovUp'>向上移动</span></div>"+
          		"<div style='text-align:center;cursor:pointer;'><span name='itemdel'>删除该项</span></div>"+
          	  "</div>";
          	   $(div).appendTo('body');
               var x=e.pageX;
               var y=e.pageY;
               $("div[name=menu]").css("left",x).css("top",y).show();

               //菜单监听
               var oThis=$(this);
               $("div[name=menu] span").on("click mouseover mouseout", function(e) {
                   switch(e.type){
                       case "mouseover":
                           $(this).css("background-color","#ccc");
                           break;
                       case "mouseout":
                           $(this).css("background-color","white");
                           break;
                       case "click":
                           var divname=$(e.target).attr("name");
                           switch(divname){
                               case "itemdel":
                                   //删除子项
                                   var data={};
                                   data.id=oThis.attr("id");
                                   //其项以下的兄弟节点oid全部-1
                                   $.post("<%=basePath%>del.jhtml",data,function(message){
                                       oThis.nextAll().each(function(){
                                    	   console.info($(this));
                                           var i=parseInt($(this).attr("oid"))-1;
                                           $(this).attr("oid",i);
                                           var item={};
                                           item.data=$(this).attr("id")+":"+$(this).attr("oid");
                                           $.post("<%=basePath%>updateOrder.jhtml",item);
                                       });
                                       oThis.remove();
                                   });
                                  
                                  break;
                               case "itemMovUp":
                              	 var item={};
                              	 var thisId=oThis.attr("id");
                              	 var thisOid=oThis.attr("oid");
                              	 var prevId=oThis.prev().attr("id");
                              	 var prevOid=oThis.prev().attr("oid");
                              	 oThis.attr("oid",prevOid);
                              	 oThis.prev().attr("oid",thisOid);
                              	 item.data=thisId+":"+prevId;
                              	 $.post("<%=basePath%>moveup.jhtml",item,function(msg){
                              		var thisDiv=oThis.clone();
                              		oThis.prev().before(thisDiv);
                              		oThis.remove();
                                 });
                                 break;
                           };
               }
      	});
      });
     /*End:给subChild添加菜单*/
	  </shiro:hasPermission>
       $("body").on("click","input[name=showindex]",function(){
    	 if($(this).attr("menu")=="all"){
    		 $("div[click=on]").parents("div[name=divItem]").siblings().slideDown().find("div[name=item]").slideUp();
    		 $(this).val("显示[当前]目录");
    		 $(this).attr("menu","part");
    	 }else if($(this).attr("menu")=="part"){
    		 $(this).val("显示[所有]目录");
    		 $(this).attr("menu","all");
    		 $("div[click=on]").parents("div[name=divItem]").siblings().slideUp();
    	 };
     });
     <shiro:hasPermission name="user:editMenu"> 
     $("div[id=mainItem]").dblclick(function(){
    	 //获取最后一个兄弟节点
    	 var oid=$(this).parent().children("div:last-child").find("div[name=indexItem]").attr("oid");
    	 oid==undefined?(oid=0):(oid=parseInt(oid)+1);
         var div="<div name='divItem' style='height: auto;margin-top:5px;'>"+
             "<div style='height: 35px;'>"+
             "<div style='height: 22px;width: 2px;background-color: #563d7c;float: left;position: relative;left: 20px;'></div>"+
             "<div  name='indexItem' oid="+oid+" style='width:80%;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;height: 22px;color: #563d7c;float: left;font-weight: bold;line-height: 22px;position: relative;left: 30px;background-color:white;font-size: 15px;cursor: pointer;' contenteditable='true'  >请输入……</div>"+
             "</div>"+
             	"<div name='item' style='height: auto;color: #999;font-weight: bold;clear: both;position: relative;left: 18%;width:100%;'></div>"+
             "</div>";
         $(this).parent().append(div);
     });
     </shiro:hasPermission>
     
     /*Begin:点击第一父节点会展开或收缩*/
     $("body").on("click","div[name=indexItem]",function(e){
    	var oThis=$(this);
    	 var obj=$(this).parent().next();
    	if(oThis.attr("hasChild")=="true"){
    		 if(obj.css("display")=="none"){
    			 obj.slideDown(500);
       		 }else{
       			obj.slideUp(500);
       		 }
    	}else{
        	var data={};
        	data.id=$(this).attr("id");
        	$.post("findItem.jhtml",data,function(data){
        		 var data = $.parseJSON(data);
        		 if(data.length>0){
        			 oThis.attr("hasChild","true");
        			 for(var i=0;i<data.length;i++){
     			        var div="<div  id="+data[i].id+" pid="+oThis.attr('id')+"  hasChild='false'  oid="+data[i].oid+" name='subItem'  style='height: 22px;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap; background-color: #1b3749; margin-top: 5px; cursor: pointer; color: white;;font-size: 15px;width: 90%;' contenteditable='false' >"+ data[i].title+"</div><div id='subChild'></div>";
     			        obj.append(div);
       			 	} ;
        		}else{
        			oThis.attr("hasChild","false");
        		};
      			 
        	});
    	}
    	
     });
	 
     /*End:点击第一父节点会展开或收缩*/
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
      		 console.info(oThis);
      		
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
     	<shiro:authenticated> 
			editor.$textElem.attr('contenteditable', true);
		</shiro:authenticated> 
     	 $("div[name=subChild]").css("color","#ccc").removeAttr("click");
     	 $(this).css("background-color","#1b3749").attr("click","on");
     	 $(this).css("color","white");
     	 var id=$(this).attr("id");
     	 var data={};
     	 data.id=id;
     	 var oThis=$(this);
     	 $.post("<%=basePath%>findData.jhtml",data,function(msg){
     		$("div[id=databox]").css('background-image', '');
     		editor.txt.html(msg);
     		oThis.parents("div[name=divItem]").siblings().slideUp();
				$("input[name=showindex]").val("显示[所有]目录").attr("menu","all");
     			//第一次点击目录,回收目录页
     		/* if(isMove==true){
     			$("#menubox").animate({width:300},1000);
 				$("#message").animate({width:$(document).width()-300-$("#vhandle").width()},1000);
 				 window.setTimeout(function(){
   					$("div[id=databox]").css('background-image', '');
   		     		 	editor.txt.html(msg);
   				 },1500);
 				isMove=false;
 				oThis.parents("div[name=divItem]").siblings().slideUp();
 				$("input[name=showindex]").val("显示[所有]目录").attr("menu","all");
     		}else{
     			editor.txt.html(msg);
     		} */
     	 });
     });
     /*end:点击菜单获取数据*/
      <shiro:hasPermission name="user:editMenu">
     /*Begin:按enter键保存数据*/
     $("body").on("keydown","div[name=indexItem]",function(event){
    	//非编辑状态enter键无效
   	  	if($(this).attr("contenteditable")=="false"){return;}
    	if(event.which == "13"){
    		$(this).attr("contenteditable", false);
    		if($(this).text().trim()==""){
                $(this).text("请输入……");
            }
            //begin:将数据发送到服务端
            var data={};
            data.title=$(this).text().trim();
            data.pid=0;
            data.oid=$(this).attr("oid");
            if($(this).attr("id")!=undefined){
                data.id=$(this).attr("id");
            }
            var oThis=$(this);
            $.post("<%=basePath%>save.jhtml",data,function(message){
                var msg=message.split(":");
                var rdate=msg[0];
                var id=msg[1];
                if(rdate=="success"){
                    oThis.css("border","none");
                    oThis.css("background-color", "#1b3749");
                    oThis.css("color","white");
                    oThis.attr("id",id);
                    oThis.blur();
                }else{
                    oThis.text("保存失败……");
                }

            });
        //end:将数据发送到服务端
    	}
     });
     /*End:按enter键保存数据*/
      </shiro:hasPermission>
      <shiro:hasPermission name="user:editMenu">
     /*Begin:给div[name=subItem]添加keydown事件*/
     $("body").on("keydown","div[name=subItem]",function(event){
    	//非编辑状态enter键无效
    	if($(this).attr("contenteditable")=="false"){return;}
     	if(event.which == "13"){
     		$(this).attr("contenteditable", false);
     		if($(this).text().trim()==""){
                 $(this).text("请输入……");
             }
             //begin:将数据发送到服务端
             var data={};
             data.title=$(this).text().trim();
             data.pid=$(this).attr("pid");
             data.oid=$(this).attr("oid");
             if($(this).attr("id")!=undefined){
                 data.id=$(this).attr("id");
             }
             var oThis=$(this);
             $.post("<%=basePath%>save.jhtml",data,function(message){
                 var msg=message.split(":");
                 var rdate=msg[0];
                 var id=msg[1];
                 if(rdate=="success"){
                     oThis.css("border","none");
                     oThis.css("background-color", "#1b3749");
                     oThis.css("color","white");
                     oThis.attr("id",id);
                     oThis.parent().attr("box-id",id);
                     oThis.blur();
                 }else{
                     oThis.text("保存失败……");
                 }

             });
         //end:将数据发送到服务端
     	}
     });
     /*End:给div[name=subItem]添加keydown事件*/
      </shiro:hasPermission>
      
      <shiro:hasPermission name="user:editMenu">
     /*Begin:双击进入编辑模式*/
      $("body").on("dblclick","div[name=indexItem],div[name=subItem]",function(e){
    	  var isEdit=$(this).attr("contenteditable");
          if(isEdit=="false"){
        	  $(this).attr("contenteditable", true);
              $(this).css("border","1px solid grey");
              $(this).css("color","#1b3749");
              $(this).css("background-color", "white");
          }
      });
      /*End:双击进入编辑模式*/
       </shiro:hasPermission>
       <shiro:hasPermission name="user:editMenu">
      /*Begin:给subItem添加右键菜单*/
      $("div[name=menubox]").on("contextmenu","div[name=subItem]",function(e){
    	  $("div[name=menu]").remove();//把原来的右键菜单删除
    	  div="<div name='menu' style='display:none;box-sizing: border-box;position: absolute;width: 80px;border-radius: 5px;background-color: white;font-weight: bold;border:1px solid #1b3749;font-size:12px;line-height:25px;color:#1b3749;'>"+
          		"<div style='text-align:center;cursor:pointer;'><span name='itemAddChild'>添加子项</span></div>"+
          		"<div style='text-align:center;cursor:pointer;'><span name='itemMovUp'>向上移动</span></div>"+
          		"<div style='text-align:center;cursor:pointer;'><span name='itemdel'>删除该项</span></div>"+
          	  "</div>";
          	$(div).appendTo('body');
          	//获取鼠标x、y点的位置显示菜单
            var x=e.pageX;
            var y=e.pageY;
            $("div[name=menu]").css("left",x).css("top",y).show();
            //菜单监听
            var oThis=$(this);
            $("div[name=menu] span").on("click mouseover mouseout", function(e) {
            	switch(e.type){
                case "mouseover":
                    $(this).parent().css("background-color","#ccc");
                    break;
                case "mouseout":
                    $(this).parent().css("background-color","white");
                    break;
               
                case "click":
                	 var divname=$(e.target).attr("name");
                	 switch(divname){
                	  case "itemdownAdd":
                     	var pid=oThis.attr("pid");
                     	var oid=parseInt(oThis.attr("oid"))+1;
                     	var div="<div id='itembox' oid="+oid+">"+
     			        			"<div  pid="+pid+" haschild='true' oid="+oid+" name='subItem' style='height: 22px;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap;  margin-top: 5px;background-color: white; cursor: text; color: #1b3749;font-size: 15px;width:75%;cursor: pointer;' contenteditable='true'>请输入……</div>"+
     			        			"<div id='box' style='width:100%;'></div>"+
     			    			 "</div>";
                     	oThis.parent().after(div);
                     	break;
                	 	case "itemAddChild":
                	 		var divOid=oThis.next().children("div:last-child").attr("oid");
                	 		if(divOid!=undefined){
                	 			divOid++;
                	 		}else {divOid=0;}
                	 		var div="<div name='subChild'  oid="+divOid+" pid="+oThis.attr("id")+" style='text-overflow:ellipsis;overflow:hidden;white-space:nowrap;background-color: #1b3749;margin-top:5px;margin-left:20px;font-size:15px;color: #ccc;width:60%;cursor:pointer;background-color:white;color:#1b3749;' contenteditable='true'>请输入……</div>";
                	 		oThis.next().append(div);
                	 	break;
                	 	case "itemMovUp":
                	 		var thisDiv=oThis;
                	 		var otherDiv=oThis.prev().prev();
                	 		 var item={};
                             item.data=thisDiv.attr("id")+":"+otherDiv.attr("id");
                             $.post("<%=basePath%>moveup.jhtml",item,function(msg){
                           	var thisOid=thisDiv.attr("oid");
                           	  	var otherOid=otherDiv.attr("oid");
                           	  	otherDiv.attr("oid",thisOid);
                           	  	thisDiv.attr("oid",otherOid);
                           	  	console.info(thisDiv);
                           	  	console.info(thisDiv.next());
                         	   var div=thisDiv.clone();
                           	   var subChildDiv=thisDiv.next().clone();
                           	 	thisDiv.next().remove();
                           	 	thisDiv.remove();
                           	  otherDiv.before(div);
                           	  otherDiv.before(subChildDiv);
                           	 
                             }); 
                	 		break;
                	 	case "itemdel":
                	 		//删除子项
                            var data={};
                            data.id=oThis.attr("id");
                            //其项以下的兄弟节点oid全部-1
                            $.post("<%=basePath%>del.jhtml",data,function(message){
                            	oThis.parents().children("div[name=subItem]").each(function(){
                                    var i=parseInt($(this).attr("oid"))-1;
                                    $(this).attr("oid",i);
                                    var item={};
                                    item.data=$(this).attr("id")+":"+$(this).attr("oid");
                                    $.post("<%=basePath%>updateOrder.jhtml",item);
                                });
                                oThis.next().remove();
                                oThis.remove();
                                
                            });
                	 		break;
                	 }
                	break;
            }
          });
    	  
      });
      /*End:给subItem添加右键菜单*/
      </shiro:hasPermission>
      <shiro:hasPermission name="user:editMenu">
      /*Begin:给indexItem添加右键菜单*/
      $("div[name=menubox]").on("contextmenu","div[name=indexItem]",function(e){
    	  if($(this).attr("contenteditable")=="true"){return;}
          $("div[name=menu]").remove();
          var div="<div name='menu' style='box-sizing: border-box;position: absolute;width: 80px;border-radius: 5px;background-color: white;height:80px;font-weight: bold;border:1px solid #1b3749;font-size:14px;line-height:25px;color:#1b3749;'>"+
              		"<div style='text-align:center;cursor: pointer;'><span name='itemAddChild'>添加子项</span></div>"+
              		"<div style='text-align:center;cursor: pointer;'><span name='itemMovUp'>向上移动</span></div>"+
              		"<div style='text-align:center;cursor: pointer;'><span name='itemdel'>删除该项</span></div>"+
              	  "</div>";
          $(div).appendTo('body');
          var x=e.pageX;
          var y=e.pageY;
          $("div[name=menu]").css("left",x).css("top",y).show();
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
                  if($(this).attr("name")=="itemAddChild"){
                      var divOid=0;
                      var lastDiv=oThis.parent().next().children("div:last-child").prev();
                      if(lastDiv.length!=0){
                    	  divOid=parseInt(lastDiv.attr("oid"))+1;
                      }
                      var div="<div  pid='"+oThis.attr("id")+"' haschild='false'  oid='"+divOid+"' name='subItem'  style='height: 22px;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap; background-color: #1b3749; margin-top: 5px; cursor: pointer; color: white;;font-size: 15px;width: 90%;' contenteditable='false'>请输入……</div><div id='subChild'></div>";
                      oThis.parent().next().append(div);

                  }else if($(this).attr("name")=="itemdel"){
                 	 var id=oThis.attr("id");
                 	 var item={};
                 	 item.id=id;
                 	 $.post("<%=basePath%>del.jhtml",item,function(msg){
                 		 oThis.parent().parent().remove();
                 	 });
                  //上下移动
                  }else if($(this).attr("name")=="itemMovUp"){
                	  var thisDiv=oThis.parents("div[name=divItem]");
                	  var thisItem=$(thisDiv).find("div[name=indexItem]");
                	  var otherDiv=oThis.parents("div[name=divItem]").prev();
                	  var otherItem=$(otherDiv).find("div[name=indexItem]");
                	  
                	  var thisId=$(thisItem).attr("id");
                	  var otherId=$(otherItem).attr("id");
                	  console.info(thisId);
                	  console.info(otherId);
                 	  //将数据传送到服务端
                      var item={};
                      item.data=thisId+":"+otherId;
                      $.post("<%=basePath%>moveup.jhtml",item,function(msg){
                    	  var thisOid=thisItem.attr("oid");
                    	  var otherOid=otherItem.attr("oid");
                    	  thisItem.attr("oid",otherOid);
                    	  otherItem.attr("oid",thisOid);
                    	  var div=thisDiv.clone();
                    	  otherDiv.before(div);
                    	  thisDiv.remove();
                      }); 
                  } 
                  break;
          	};
          });
          /*End:给indexItem添加右键菜单*/
    	  
      });
      </shiro:hasPermission>
    });
 </script>
 <!-- 设置导航的高度 -->
 <script>
 	$(function(){
 		 //当浏览器大小被拉伸时,重新执行vresize方法
	 		$("#vhandle,#message").css("height",$(document).height());
	 		$("#category").css("height",($(document).height()-35-100-20));
	 		//窗口最大/小化之后,该方法会调用
 		 $(window).resize(function(e){
			$("#vhandle,#message").css("height",$(document).height());
	 		$("#category").css("height",($(document).height()-35-100-20));
 		});
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
 	});
</script>
 
 <style>
  * {
   padding: 0px;
   margin: 0px;

  }

 </style>

</head>

<body  style="padding: 0; margin: 0;">

<div id="container" style="width: 100%;height: auto;">
 <div style="width: 100%;height: auto;">
	<div name="menubox" id="menubox" style="width: 40%;float: left;">
		<div style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width: 100%;height: 100px;background-color: #1b3749;font-weight: bold;font-size: 45px;text-align: center;color: white;line-height: 100px;cursor: pointer;" onclick="location.href='/';">编程大典</div>
		<!-- begin:menu -->
		<input  type="button" name="showindex" style="height: 20px;font-weight: bold;color:white;cursor: pointer;width:100%;border:1px solid grey;text-align: center;background-color: #1b3749;line-height: 20px;"  onmouseover="this.style.cursor='pointer'"></input>
	  	<div  id="category" name="category" style="width: 100%;background-color: #1b3749;overflow-x:hidden;overflow-y:auto; height: 0px;border-left: 1px solid grey;border-bottom: 1px solid grey; ">
		    <div id="mainItem" style="height: 20px;font-weight: bold;color:white;cursor: pointer;"  onmouseover="this.style.cursor='pointer'">目录索引结构树</div>
		    <c:forEach items="${itembox}" var="item">
		     <div box-id="${item.id }"  name="divItem" style="height: auto;margin-top:5px;float:left;width:275px;">
		      <div style="height: 25px;">
		       <div style="height: 18px;width: 2px;background-color: white;float: left;position: relative;left: 20px;"></div>
		       <div name="indexItem" style="width:70%;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;height: 25px;color:white;float: left;font-weight: bold;line-height: 30px;position: relative;left: 30px;background-color:#1b3749;font-size: 15px;cursor: pointer;" id="${item.id}" oid="${item.oid }" contenteditable="false">${item.title}</div>
		      </div>
		      <div name="item" style="height: auto;color: #999;font-weight: bold;clear: both;position: relative;left: 18%;width: 95%;">
		      </div>
		     </div>
		    </c:forEach>
	 	</div>
	 	<!-- end:menu -->
	 	<!-- begin:save -->
	 		<div  style="width: 100%;height: 35px;background-color: #1b3749;color: white;font-weight: bold;float: left;line-height: 35px;text-align: center;border-left: 1px solid grey;" >
	 			<form action="/login.jhtml"  method="post">
	 				<input type="hidden" name="username" value="#">
	 				<input type="hidden" name="password" value="#">
	 				<input id="time" style="color:white;font-weight: lighter; border: none;background-color: #1b3749" type="submit"  value="@作者微信:15295432682"></form> 
	 		</div>
	 	<!-- end:save -->
	</div>
 	<div  id="vhandle" style="float: left;width: 0.5%;background-color: #ccc;height: 10px;cursor: e-resize;"></div>
 	<div id="message" style="float: left;width: 59.5%;height: auto;">
		<div id="downbox"  style="width: 100%;overflow-x:hidden;height: 0px;overflow-x:hidden;">
			<div id="downMenu" style="width: 100%;height: 30px;"></div>
			<div id="downEd" style="width: 100%;height: 300px;"></div>
		</div>
		<div id="hhandle" style="width:100%;height: 0.5%;background-color: #ccc;cursor: n-resize;"></div>
			<shiro:authenticated>  <div id="menu" style="width: 100%;border:1px solid grey;height: 4%; "></div></shiro:authenticated>
		 	<div id="databox" style="overflow-x:hidden;width: 100%; background-image: url('static/images/start.jpg');height:95.5%;">
					<div id="editor" style="width: 100%;height: 100%;"></div>
			</div>
 	</div>
 </div>
</div>

</body>
<script>
<shiro:authenticated> 
	window.setInterval(function(){
		  $.post("<%=basePath%>gettime.jhtml",function(msg){
        	 $("#time").val(msg);
          }); 
	},1000);
</shiro:authenticated>
</script>
</html>
