<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<script type="text/javascript">
 	function getSecondMenu(menuCode,threeResident_div,menuName,e,objectName){
    	if(objectName !=""){
    		pageJump(objectName,threeResident_div,menuName);
		}else{
			$("#fMenu ul li").removeClass("current");
			RenameAttr($("#fMenu ul li a"),"onclicks","onclick");
			$(e).parent().addClass("current");
			RenameAttr($(e),"onclick","onclicks");
			var resultMenu ='<%=session.getAttribute("resultMenu")%>';
			$("#sMenu").find("div[class='top nav_bg  clrfix']").remove();
			$("#sMenu").append("<div class='top nav_bg  clrfix' id='secondMenu' parentCode='"+menuName+"'><ul class='nav'></ul></div>");
			$.each($.parseJSON(resultMenu),function(key,value){
				if(key.indexOf(menuCode)>0){
					$.each(value,function(secondKey,secondValue){
						var secondMenu = secondKey.split(";");
						var secondMenuName ="";
						var secondMenuCode ="";
						var secondObject = "";
						var secondResident_div = "";
						if(secondMenu[0].indexOf("menuCode")>-1){
							secondMenuCode = secondMenu[0].split("=")[1];
						}
						if(secondMenu[1].indexOf("menuName")>-1){
							secondMenuName = secondMenu[1].split("=")[1];
						}
						if(secondMenu[2].indexOf("objectName")>-1){
							secondObject = secondMenu[2].split("=")[1];
						}
						if(secondMenu[3].indexOf("resident_div")>-1){
							secondResident_div = secondMenu[3].split("=")[1];
						}
						if(secondObject!=null && secondObject.trim() !="null"&&secondObject.trim() !=""){
                            var reg = new RegExp("_","g");
						 $("#sMenu div[class='top nav_bg  clrfix']:first").find(" ul").append("<li  class='"+ getLengthClass(secondMenuName)+"' ><a href=\"javascript:pageJump('"+secondObject+"','"+secondResident_div+"','"+secondMenuName+"');\" data-type='"+secondResident_div+"'>"+secondMenuName.replace(reg," ")+"</a></li>"); //onclick='setCache(this)'
						}else{
						    if(JSON.stringify(secondValue)=='{}'){
						        $("#secondMenu ul").append("<li class='"+ getLengthClass(secondMenuName)+"' ><a onclick='javascript:void(0)' style='cursor:default;'>"+secondMenuName+"</a></li>");
						    }else{
						        $("#secondMenu ul").append("<li class='"+ getLengthClass(secondMenuName)+"' ><a onclick=getThreeMenu('"+JSON.stringify(secondValue)+"',this)>"+secondMenuName+"</a></li>");
						  	}
						}
					});
				}
			});
		}
    }

	function stopPropagation(event){
		var e=event || window.event;
		if (e && e.stopPropagation){
			e.stopPropagation();
		}
		else{
			try{
				e.cancelBubble=true;
			}catch(e){}
		}
	}

	function getLengthClass(ShowText){
		ShowText = (ShowText+"").trim();
		if(ShowText.length<5){
		    return "f4";
		}else if(ShowText.length<7){
		    return "f6";
		} else{
		    return "f8";
		}
	}

	function getThreeMenu(menuMap,e){
 	    RenameAttr($(e).parent().parent().find("li a"),"onclicks","onclick");
		$(e).parent().parent().find("li").removeClass("current_bg");
		$(e).parent().addClass("current_bg");
		var div = $(e).parent().parent().parent();
		var divLength = $("#sMenu div[class='top nav_bg  clrfix']").length;
		var currentDIV = $(e).parents("div").eq(0).html().indexOf("首頁");
		if(currentDIV>0){
		    $("#sMenu div[class='top nav_bg  clrfix']").remove();
		}else{
		    if(div.length>0){
			  div.nextAll().remove();
		    }
		}
		$("#sMenu").append("<div class='top nav_bg  clrfix'><ul class='nav'></ul></div>");
		var JSONObject=$.parseJSON(menuMap);
		$.each(JSONObject,function(key,value){
			var threeMenu = key.split(";");
			var threeMenuName ="";
			var threeMenuCode ="";
			var threeObject = "";
			var threeResident_div = "";
			if(threeMenu[0].indexOf("menuCode")>-1){
			    var s = threeMenu[0].split("=");
			    threeMenuCode = s[1];
			}
			if(threeMenu[1].indexOf("menuName")>-1){
			    var s = threeMenu[1].split("=");
			    threeMenuName = s[1];
			}
			if(threeMenu[2].indexOf("objectName")>-1){
			    var s = threeMenu[2].split("=");
			    threeObject = s[1];
			}
			if(threeMenu[3].indexOf("resident_div")>-1){
			    var s = threeMenu[3].split("=");
			    threeResident_div = s[1];
			}

			if((key+"").indexOf("objectName=null")<0 ||(key+"").indexOf("objectName\u003dnull")<0 ){
                var reg = new RegExp("_","g");
			    $("#sMenu div[class='top nav_bg  clrfix']:last ul").append("<li class='"+ getLengthClass(threeMenuName)+"' ><a href=\"javascript:pageJump('"+threeObject+"','"+threeResident_div+"','"+threeMenuName+"');\" data-type='"+threeResident_div+"'>"+threeMenuName.replace(reg," ")+"</a></li>");//onclick='setCache(this)'
			}else{
			    $("#sMenu div[class='top nav_bg  clrfix']:last ul").append("<li class='"+ getLengthClass(threeMenuName)+"' ><a onclick=getFourMenu('"+JSON.stringify(value)+"',this)>"+threeMenuName+"</a></li>");// onclick='setCache(this)'
		  	}
		});
	}

	function getFourMenu(menuMap,e){
		RenameAttr($(e).parent().parent().find("li a"),"onclicks","onclick");
		$(e).parent().parent().find("li").removeClass("current_bg");
		$(e).parent().addClass("current_bg");
		var div = $(e).parent().parent().parent();
		$("#sMenu").append("<div class='top nav_bg  clrfix'><ul class='nav'></ul></div>");

		$("#secondMenu ul").append("<li class='f4 '><a href=\"javascript:pageJump('getMenu.do','N','首頁');\" data-type='N'>首頁</a></li>");
		var JSONObject=$.parseJSON(menuMap);
		$.each(JSONObject,function(key,value){
			var fourMenuName =value.menuName;
			var fourMenuCode =value.menuCode;
			var fourObject = value.objectName;
			var fourResident_div = value.resident_div;
			$("#sMenu div[class='top nav_bg  clrfix']:last ul").append("<li class='"+getLengthClass(fourMenuName)+" '><a href=\"javascript:pageJump('"+fourObject+"','"+fourResident_div+"','"+fourMenuName+"');\" data-type='"+fourResident_div+"'>"+fourMenuName+"</a></li>");
		});
		var testDivUlLength = $("#testDiv ul").length;
		if(testDivUlLength == 0){
			$("#fMenu").css("display","none");
			var sMenu = $("#sMenu div[class='top nav_bg  clrfix']:first ul").clone();
			$("#sMenu div[class='top nav_bg  clrfix']:first").remove();
			$("#oneMenu div[class='operate fr']").before("<div id='testDiv'></div>");
			$("#testDiv").append(sMenu);
		}
	}

	//點擊菜單跳轉的方法
	function pageJump(URL,threeResident_div,MenuName){
 	    //javascript:pageJump('newPAF.do','null','新增PAF事項')
		var residentNo = $("#residnt_no_commons_hf_hidden").val();
		RenameAttr($("#fMenu ul li a"),"onclicks","onclick");
		//判断点击的MenuName是否时一级菜单
		var isTopMenu=$("a[title='"+MenuName+"']");
		if(isTopMenu.length>0){//一级菜单
			var topE=isTopMenu;
			//获取所有的兄弟节点
			topE.parent().siblings().each(function(){
				if($(this).attr("class").trim().indexOf("current")>-1){
					$(this).removeClass("current");
				}
			});
			topE.parent().addClass("current");
			RenameAttr(topE,"onclick","onclicks");

			$("#sMenu ul").empty();
		}else{
			var e=$("a[href=\"javascript:pageJump('"+URL+"','"+threeResident_div+"','"+MenuName+"');\"]");
			//获取所有的兄弟节点
			e.parent().siblings().each(function(){
				if($(this).attr("class").trim().indexOf("current_bg")>-1){
					$(this).removeClass("current_bg");
					$(this).children().removeClass("current");
				}
			});
			 //改变菜单样式current
			 e.parent().addClass("current_bg");
			 e.addClass("current");
		}
		if(threeResident_div=="Y" &&  ( residentNo ==null || residentNo =="")){
			$("#resident1").val(";");
			searchResidentByConditions1(URL);
			$("#firstDiv").nextAll().each(function(){
				var v_id=$(this).attr("id");
                if(v_id!="selectResidentDiv"&&v_id!="residnt_no_commons_hf_hidden"){
                    $(this).remove();
                }
			});
			$("#selectResidentDiv").show();
		}else{
			window.location = URL+parameterPassing();
		}
	}

    function parameterPassing(){
        return getResidentNoCommons();
    }
    function getResidentNoCommons(){
        var value = $("#residnt_no_commons_hf_hidden").val();
        if(value!==undefined)
            return value;
        else
            return "";
    }

	function getOldMenu(){
		getMenu();
		//当鼠标点击一个div以外的地方时让此div隐藏
		$(document).bind("click",function(e){
		var target = $(e.target);
		if(target.closest("#searchTab").length === 0){
			$("#searchTab").hide();
			$("#resident").val("");
			}
		});
	}
	function getMenu(){
		if(window.location.href.indexOf("getMenu.do")>-1) return ;//如果是空白界面不往下操作
		var href  = window.location.href.indexOf("?")>-1 ?  window.location.href.split("?")[0].split("/"): window.location.href.split("/");
		href  = href[href.length-1].split("?")[0];
		var oldName = "href",NewName = "hrefs";
		//var size = $("#sMenu div[class='top nav_bg  clrfix']:last").find("a["+ oldName +"*=\"('"+ href +"');\"],a["+ NewName +"*=\"('"+ href +"');\"]").length;
		var size = ($("#sMenu div[class='top nav_bg  clrfix']:last").html()+"").indexOf(href);
		var size2 = $("#fMenu").html()+"";
		RenameAttr($("#fMenu ul li a"),"onclicks","onclick");
		if(size2.indexOf(href)>-1){
			$("#fMenu ul li").each(function(){
				if($(this).html().indexOf(href)>-1){
					$(this).siblings().each(function(){
						$(this).removeClass("current");
					});
					$(this).addClass("current");
					RenameAttr($(this),"onclick","onclicks");
				}
				$("#sMenu").find("div[class='top nav_bg  clrfix']").remove();
			});
			return;
		}
		if(size>0){		   return ;		}
		var ahref = "";
		var testDivUlLength = $("#testDiv ul").length;
		//获取第一层的数据
		if(testDivUlLength==0){
		   ahref = $("#fMenu").find("a");
		}else{
		   ahref = $("#testDiv").find("a");
		}
		$("#sMenu div[class='top nav_bg  clrfix']").remove();
		for(var index=0 ; index < ahref.length ; index++){
			(ahref[index]).click();
			var html = $("#sMenu div[class='top nav_bg  clrfix']:last").html()+"";
			if(html.indexOf(href)>-1){
				showMenu(href,oldName,NewName);
				break ;
			}else{
			    $("#sMenu div[class='top nav_bg  clrfix']:last").remove();
			    $(ahref[index]).parent().removeClass("current");
			}
		}
	}
	function showMenu(href,oldName,NewName){
		var alist = $("#sMenu div[class='top nav_bg  clrfix']:last").find("a");
		for(var index=0;index<alist.length;index++){
			var a = alist.eq(index),
			ahref = a.attr("href")+"";
			clickVal = a.attr("onclick")+"";
			if(ahref.indexOf(href)>-1){
				a.parent().addClass("current_bg");
				RenameAttr(a,oldName,NewName);
				RenameAttr($("#sMenu li[class*='current_bg'] a"),"onclick","onclicks");
			}else if(clickVal.indexOf(href)>-1){
				a.click();
				showMenu(href,oldName,NewName);
			}
		}
	}

	$(function(){
		getMenu();
		$("#fMenu").find("li").each(function(){
			$(this).addClass(getLengthClass($(this).text()));
		});
		$("#indate_menu,#indate1_menu").on("click",function(){
			 WdatePicker({lang:"${language eq 'EN' ? 'en' : 'zh-tw' }",el:$dp.$($(this).prop("id")),dateFmt:'yyyy/MM/dd',isShowClear:true});
		});
	});

	//使选中的行变颜色
	function addStyle(el){
		$(el).css("background-color","#c8c8c8");
	}
	function deleteStyle(el){
		$(el).css("background-color","#fff");
	}
	//页面跳转
	function turnSuccJsp(el){
		var resident=$(el).attr("data-value");
		window.location.href="searchResidents.do?action=searcherResidentByNo&resident="+resident;
	}

	//关闭div
	function closeDiv(){
		$("#infoTab").hide();
	}
</script>

	<div id="firstDiv">
		<div class="wrap h95" style="background:#f1f2f4">
			<div class="top green clrfix" id="oneMenu" >
				<div  id="fMenu" onclick="stopPropagation()">
					<ul class="nav">
						<c:forEach var="list" items="${sessionScope.oneList}" >
						   <li><a  data-type="${list.resident_div}" onclick='getSecondMenu("${list.menuCode}","${list.resident_div}","${list.menuName}",this,"${list.objectName}")'>${list.menuName}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="operate fr">
					<span><span style="cursor:pointer" class="user mr30">${sessionScope.currUser.userName}</span><a class="exit" href="login.do?action=logout">&nbsp;&nbsp;</a></span>
				</div>
			</div>
			<div id="sMenu" onclick="stopPropagation()"></div>
			<%--<div id="addPaf"><jsp:include page="registerPAF/newPAF.jsp"></jsp:include></div>--%>
		</div>
	</div>
	<!-- 返回标签 -->
<%--	<div style="position: absolute;bottom: 5px;">--%>
	<div class="sub">
		<sam:Button accessControl="Y" dim="Y" altKey="button.common.back" onclick="doBack()" />
	</div>
	<%-- <input type="hidden" id="session_resident_no" value='<c:out value="${sessionScope.resident_no}"/>'/> --%>
   <input type="hidden" name="resident_no" id="residnt_no_commons_hf_hidden"
		  value='<c:out value="${elderlyHomeResidentVo.resident_no}"/>'/>
   <div id="commons_Interlayer" style=" display:none; position:fixed;  left:0px;  top:0px;  width:100%;  height:100%;  z-index:1000;  background-color:rgba(119,136,153, 0); filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3f000000',endColorstr='#3f000000');">
   </div>
   <script>
        function ContinueNext(el){
        	var residentNo=$(el).attr("data-value");
        	var URL=$(el).attr("data_url");
        	$("#residnt_no_commons_hf_hidden").val(residentNo);
        	window.location = URL+parameterPassing();
        }
   </script>
