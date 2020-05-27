<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
/*禁止缓存*/
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0);
%>
  	<!-- css -->
  	<link href="<%=basePath %>css/common.css"  rel="stylesheet" media="all" />
  	<link href="<%=basePath %>css/public.css"  rel="stylesheet" media="all" />
 	<!-- js -->
 	<script type="text/javascript" src="<%=basePath %>jedate/jedate.js"></script>
 	<script type="text/javascript" src="<%=basePath %>js/jquery-1.11.1.js"></script>
 	<!---->
 	
<!--  	<script type="text/javascript" src="<%=basePath %>js/checkValidation.js"></script> -->
<!--  	<script type="text/javascript" src="<%=basePath %>js/common.js"></script> -->
  	<script type="text/javascript" src="<%=basePath %>js/oDialog.js"></script>
 	<script type="text/javascript" src="<%=basePath %>js/checkValidation.js"></script>
   	<script type="text/javascript" src="<%=basePath %>js/common.js"></script> 
 	<script type="text/javascript" src="<%=basePath %>js/oDialog.js"></script> 
 	<script type="text/javascript" src="<%=basePath %>js/custom.common.Jqplugins.js"></script> 
 	<script type="text/javascript" src="<%=basePath %>js/googleMap.js"></script>
 	<script type="text/javascript" src="<%=basePath %>js/highcharts.js"></script>
 	<script type="text/javascript" src="<%=basePath %>js/DIYInputSelect.js"></script>

	<script type="text/javascript" src="<%=basePath %>js/showBo.js"></script>
 	<%--<script type="text/javascript" src="<%=basePath %>js/LodopFuncs.js"></script>
 	--%><%--<script type="text/javascript" src="<%=basePath %>js/ysl.js"></script>
	--%><script type="text/javascript"  src="<%=basePath %>js_plugins/My97DatePicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="<%=basePath %>js_plugins/draggabilly.pkgd.js"></script>
 	<!-- message -->
	<link rel="stylesheet" href="<%=basePath %>css/showBo.css">
 	<link id="exception" data-title="<%=request.getAttribute("exception")%>"/>
 	<link id="message" data-title="<%=request.getAttribute("message") %>"/>
 	
 	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/tree.css">
	
 	<script type="text/javascript">
 		function globalInit(){
 		;
 			if($("#exception").attr("data-title")!=""&&$("#exception").attr("data-title")!="null"){
 				alert($("#exception").attr("data-title"));
 			}else if($("#message").attr("data-title")!="" && $("#message").attr("data-title")!="null"){
 				alert($("#message").attr("data-title"));
 			}
 		}
 		function replaceToText(select,text){
 			$(select).after(text).remove();
 		}
 		$(function(){
 		   globalInit();
 		   replaceToText("[data-text='col']","<spring:message code='label.common.col' />");
 		   replaceToText("[data-text='asterisk']","<spring:message code='label.common.asterisk' />");
 		   //获取menu
 		  // if(sessionStorage.getItem("menuDiv") !=null && sessionStorage.getItem("menuDiv") !=""){
			//  $(".wrap").remove();
           //   $("#firstDiv").append(sessionStorage.getItem("menuDiv"));
              //sessionStorage.removeItem("menuDiv");
 		  // }
 		   window.setTimeout(OnScroll, 100);
 		   window.setTimeout(multipleSelectOn, 100);
 		   //OnScroll();
 		});
 		/* $(document).ready(function(){
 			globalInit();
 		}); */
		function validataNewPwd(value, title) {
			var c = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,}$/;
			if(value.match(c))
				return "";
			return title;
		}
 		function validate(id,title,Must,maxLength,call){
 			var value = $("#"+id).val()+"",
 				message = "";
 			title=title.replace("<spring:message code='label.common.asterisk' />","").trim();

 			if($("#"+id)[0] !=undefined && $("#"+id)[0].tagName=="SELECT"&&value=="0"){
 				value="";
 			}
 			if(!isEmpty(value)){
 				if(value.length>maxLength&&maxLength>0){
 					message="<spring:message code='message.common.06'/>\r\n".replace("{1}", title).replace("{1}", maxLength);
 				}else if(isEmpty(message) && jQuery.isFunction(call)){
	 				var message1 = (call(value,title)+"").trim();
	 				if(message1!="" && message1.length>1)
 					  message=message1+"\r\n";
	 			}
 			}else{
 				if(Must){
 					message="<spring:message code='message.common.02'/>\r\n".replace("{0}", title);
 				}
 			}
 			return message;
 		}
 		
 		function isEnglish(englishValue,englistName){
			var reg = /^[a-zA-Z]$/;
		    if(!reg.test(englishValue)){
		    	return message="<spring:message code='message.common.05'/>\r\n".replace("{0}", englistName);
		    }
		}
		function validaDepartment(value,title){
			return value!=""?"":"不能为空";
		}
 		function validataEmail(value,title){
			return isValidEmail(value) ? "" : " <spring:message code='message.common.08'/>\r\n".replace("{0}", title);
		}
		function isChinese(value,title) {
			return !checkChinese(value) ? "" : " <spring:message code='message.common.isChinese'/>\r\n".replace("{0}", title);

		}

		function validataChinese(value,title){
			return checkChinese(value) ? "" : " <spring:message code='message.common.62'/>\r\n".replace("{0}", title);
		}

		function validateNumEnglish(value,title) {
			return checkNumEnglish(value) ? "" : " <spring:message code='message.common.63'/>\r\n".replace("{0}", title);
		}
 		function validtaPhone(value,title){
 			try{
 				if(IsInt(value))
 				 if((value+"").length==8 || (value+"").length==11||(value+"").length==0 )
		 			return "";
 				return "<spring:message code='message.common.41'/>\r\n".replace("{0}", title);
 			}catch(e){
 				return "<spring:message code='message.common.41'/>\r\n".replace("{0}", title);
 			}
		}

		/*function validateEngAndNum(value,title) {
			if(!checkItemEng(value)){
				return  "<%--<spring:message code="paf.newPAF.pafEngName"/><spring:message code='message.common.38' />--%>"+ "\r\n";
			}
		}*/
		function validateNoChinese (value,title) {
			try{
				if(/[\u4E00-\u9FA5]/g.test(value))
				return "<spring:message code='message.common.08'/>".replace("{0}", title);
			}catch(e){
				return "<spring:message code='message.common.08'/>".replace("{0}", title);
			}
		}


		var map={};
 		function OnScroll(){
 			var tables = $("table");
 			for(var i=0;i<tables.length;i++){
 				if("scroll"==tables.eq(i).parent().css("overflow-y") && tables.eq(i).parent().attr("nothead")==undefined){
 					Scroll(tables.eq(i));
 				}
 			}
 		}
 		function Scroll($table){
				var tableClone = $table.clone();
				tableClone.find("tbody").remove();
				tableClone.removeAttr("id");
				 map[$table.attr("id")+""] = tableClone;
				 map[$table.attr("id")+"_div"] = $("<div style='width:100%;'></div>").insertBefore($table).append(map[$table.attr("id")+""])
				 map[$table.attr("id")+""].css({"position": "absolute","float": "right"});
				 map[$table.attr("id")+"_div"].hide();
				 map[$table.attr("id")+"_div"].css("position","relative");
				 $table.parent().on("scroll",function(){
					var div = $(this);
					var table = div.children("table");
					var intTop = div.offset().top - table.offset().top;
					if(intTop>0){
						map[table.attr("id")+""].css({"margin-top":intTop+"px"}); 
						map[table.attr("id")+"_div"].show();
					}else{
						map[table.attr("id")+"_div"].hide();
					}
				});
 		}
 		
 		function getDateFormat(Format,date){
 			date = date==undefined?new Date():date;
 			return Format.toLowerCase().replace("yyyy",date.getFullYear())
		 			.replace("mm",(((date.getMonth()+1)<9) ? ("0"+(date.getMonth()+1)) : (date.getMonth()+1)))
		 			.replace("dd", (date.getDate()<10 ? ("0"+date.getDate()) :date.getDate()))
		 			.replace("hh", (date.getHours()<10 ? ("0"+date.getHours()):date.getHours()))
		 			.replace("mm", (date.getMinutes()<10 ? ("0"+date.getMinutes()):date.getMinutes()))
		 			.replace("ss", (date.getSeconds()<10 ? ("0"+date.getSeconds()):date.getSeconds()));
 		}
 		
 		function RenameAttr($tags,oldName,newName){
 			for(var i=0;i<$tags.length;i++){
 				var attrVal = $tags.eq(i).attr(oldName);
 				if(attrVal!=undefined){
	 				$tags.eq(i).removeAttr(oldName);
 					$tags.eq(i).attr(newName,attrVal);
 				}
 			}
 		}
		// 返回
		function doBack(){
			javascript:history.go(-1);
		}

 		function doBack(doBackFilter){
 			var isBack = true;
 			if($.isFunction(doBackFilter) && !doBackFilter())
 				isBack = window.confirm("<spring:message code='message.common.21'/>");
			if(isBack) 
				javascript:history.go(-1);
 		    return false;
 		}
		function BottonIFWhether(is,$Buttons){
			var button = $Buttons;
				for(var k=0;k<button.length;k++){
					if(is){
							button.eq(k).addClass("after");
							var click = button.eq(k).attr("onclick");
							button.eq(k).removeAttr("onclick");
							if(click!=undefined && click.length>1)
								button.eq(k).attr("button-",click);
					}else{
							button.eq(k).removeClass("after");
							var click = button.eq(k).attr("button-");
							if(click!=undefined && click.length>1)
								button.eq(k).attr("onclick",click);
					}
				}
		}
		/**
		 * 排序
		 */
		function TableSort(column){
			//$("th[column]").on("click",function(){
				//var column = $(this).attr("column");
				if(column == undefined) return ;
				var localHref = (window.location.href.split("?")[1]+"").split("&");
				var param = [];
			    for(var k =0;k<localHref.length;k++){
					if(localHref[k].indexOf("order") == -1 && localHref[k].indexOf("orderBy") == -1 && localHref[k].indexOf("undefined") == -1 )
						param.push(localHref[k]);
				} 
				var href  = param.length > 0;
				localHref = window.location.href.split("?")[0] + (href ? ("?"+(param.join("&"))) : "");
				var order = "order=" + column;
				if("${order}"==column){
					window.location = localHref + ( href ? "&" : "?" ) + order + "&orderBy=" + (("${orderBy}" == "DESC") ? "ASC" : "DESC") ;
				}else{
					window.location = localHref + ( href ? "&" : "?" ) + order + "&orderBy=DESC";
				}
			//});
		}
		function multipleSelected(e,value){
			if(value!=""){
				e.val(value);
			}
			e.blur();
			/*value = value+"";
			if(value.indexOf(",") != -1){
				var values = value.split(",");
				var texts  = [];
				for(var k = 0; k < values.length; k++){
					texts.push($(e).find("option[value='"+ values[k] +"']").text());
				}
				$(e).find("option[selected]").removeAttr("selected");
				var multiple = $(e).find("option[multiple]");
				if(multiple.length > 0){
					multiple.attr("value",value);
					multiple.text(texts.join(","));
				}else{
					$(e).append("<option multiple='"+ $(e).attr("multiplename") +"' value='"+ value +"'>"+texts.join(",")+"</option>");
				}
			}else{
				$(e).find("option[multiple]").remove();
			}
			$(e).find("option[value='"+ value +"']").attr("selected","selected");
			$(e).val(value);
			$("input[multiples='"+ $(e).attr("multipleName")+"'][para='"+ $(e).attr("para") +"']").val($(e).find("option[value='"+ value +"']").text());
			*/
		}
		var hile = " display:none; position:fixed;  left:0px;  top:0px;  width:100%;  height:100%;  z-index:1000;  background-color:rgba(119,136,153, 0); filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3f000000',endColorstr='#3f000000');";
		var show = " display:inline; position:fixed;  left:0px;  top:0px;  width:100%;  height:100%;  z-index:1000;  background-color:rgba(119,136,153, 0); filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3f000000',endColorstr='#3f000000');";
		var obje = undefined;
		function multipleSelectOn(){
			/*$("select[multiplename]").hide();
			var selectMultiples = $("select[multiplename]");
			for(var k = 0; k<selectMultiples.length;k++){
				var HTML = "<input class='icon8"+ selectMultiples.eq(k).attr("class") +
								   "'  type='text' multiples='"+selectMultiples.eq(k).attr("multiplename")+
								   "' para='"+selectMultiples.eq(k).attr("para")+
								   "' value='"+ selectMultiples.eq(k).find("option[value='"+ selectMultiples.eq(k).val() +"']").text()+"' />"+
						   "<span class='icon8' multiples='"+
						   			selectMultiples.eq(k).attr("multiplename")+
						   			"' para='"+selectMultiples.eq(k).attr("para")+
						   			"' value='"+ selectMultiples.eq(k).find("option[value='"+ selectMultiples.eq(k).val() +"']").text()+"' ></span>";
				selectMultiples.eq(k).after(HTML);
			}
			$("span[multiples]").on("click",function(){
				var multiple = $(this).attr("multiples");
				obje = $("select[multipleName='"+ multiple +"'][para='"+$(this).attr("para")+"']");
				var url = "multipleSelected.do?multiple="+multiple+"&values="+obje.val()+"&para="+$(this).attr("para");
				oDialog.show(url,628,420,false,multipleSelectoDialogCallBack);
				$("body").append($("<div id='commons_multipleselect' style=\""+show+"\"></div>"));
			});*/
			/**
			 *   查找所有包含multiplename属性的 input标签，每个的标签的末尾再加一个span
			 */
			var inputMultipleNameList =  $("input[multiplename]");
			for(var ind=0;ind<inputMultipleNameList.length;ind++){
			    //console.info(inputMultipleNameList.eq(ind));
				var inputMultiPleOne = inputMultipleNameList.eq(ind);
				//inputMultiPleOne.addClass("icon8");
				var HTML = "<span class='icon8'"+
							"multiplename='"+ inputMultiPleOne.attr("multiplename") +"' "+
							"where='"+ inputMultiPleOne.attr("where") +"' "+
							"value='"+ inputMultiPleOne.val() +"' >";
				inputMultiPleOne.after(HTML);
				//鼠标离开时的事件，或者按了tab
				inputMultiPleOne.on("blur",function(){
					InputMultiPleOneBlur($(this));
				});
			}
			$("span[multiplename]").on("click",function(){
				var multiple = $(this).attr("multiplename");
				//获取同级元素
				obje  = $(this).siblings("input[multiplename='"+multiple+"']");
				var url = "multipleSelected.do?multiple="+multiple+"&values="+obje.val()+"&para="+$(this).attr("where");
				oDialog.show(url,628,420,false,multipleSelectoDialogCallBack);
				//$("body").append($("<div id='commons_multipleselect' style=\""+show+"\"></div>"));
			});
		}
		//设置输入框的值
		function InputMultiPleOneBlur(e){
			var values = (e.val()+"").split(",");
			
			var map = {};
			for(var i in values){
				map[values[i]+""] = values[i];
			}
			var value="";
			for(var k in map){
				value+=map[k]+",";
			}
			e.val(value.substring(0,value.length-1));
		}
		function multipleSelectoDialogCallBack(value){
			//$("#commons_Interlayer").css("display","none");
			multipleSelected(obje,value);
			obje.change();
			obje = undefined;
			//$("#commons_multipleselect").remove();
			//removeElement("commons_multipleselect");
		}

		/**
		 *检查表单是否为空
		 */
		function formIsNull(formId){
			var isNull="true";
			$("#"+formId).find("table").find("input[type!=hidden],select").each(function(){
				var val = $(this).val()+"",
					tag = $(this)[0].tagName;
				if(tag=="SELECT" && val+""!="0"){
					isNull = "false";
				}else if(val.length>0&&tag!="SELECT"){
					isNull = "false";
				};
			});
			return isNull;
		}
		/**
		 *	更改菜單名稱
		 */
		function changeMenuName(name){
			$(".current_bg:last a").text(name);
		}

		/*上下选中的全局变量*/
		var previousTd = null;//上一个选中的td
		var defaultIndex = 0; //上下默认选中的行，eq(0)：从0开始计算
		var valueInput = null;//文本框的值
		var firstTd = null;//第一个选中的td
		var maxIndex = null;//匹配成功tr的行数
		var hideValue = null;//隐藏值
		var couldSelected = false;//是否可以进行上下选中操作
		var tableId = null;//显示table的id
		var willBeSearchedDomId = null;//具体需要实现搜索效果的dom节点
		var divId = null;//返回table放置的位置id
		/*
		* url：请求路径（如："maintainWaitingPerson.do?action=searchByEnglishFullName"）
		* divId：返回table放置的位置id（如："#showSearchByInputValue"）
		* tableId： 拼接table的id（如："englishFullNameTable"）
		* specialColumnArray：给特别的列添加特定的样式（如：[[6,'searchTableByInputValue'], [7, 'searchTableByInputValueAndNumber']]），默认添加：searchTableByInputValue 这个样式类
		* @author: junheng li
		*/
		function searchByInputReturnTable(url, divId, tableId, specialColumnArray){
			$.ajax({
		        type: "post",
		        url: url,
		        async: true,//是否异步
		        dataType: "json",
		        success: function(result) {
		            $( divId ).html(""); //清空showSearchByInputValue里面的所有内容
		            var divHtml = "<div id='divTest' style='width: 826px; height: 76px; -ms-overflow-y: auto;'><table id='" + tableId + "' class='searchTableByInputValue'>"; //html:table

		            var length = result.length; //返回数据list的长度
		            var resultEveryTcLength = 0; //每条list中的column数量
		            var array = new Array();//定义一个数组存数据

		            //两个循环拼接html：1.拼接tr行；2.拼接td
		            for (var i = 0; i < length; i++) {
		                array = result[i].split(","); //行中column的数量
		               	resultEveryTcLength = array.length;
		                divHtml += "<tr style='display:none'>"; //拼接行开头

		                //拼接td
		                for (var j = 0; j < resultEveryTcLength; j++) {
		                    divHtml = divHtml + "<td>" + array[j] + "</td>";
		                }

		                divHtml += "</tr>"; //行结尾
		            }
		            divHtml += "</table></div>"; //table结尾

		            $( divId ).html(divHtml);

		            //将specialColumnArray数组中每个元素进行添加对应的class
		            specialColumnArray.map(function(x){
		            	$( divId + " tr").each(function(){
		            		$(this).children("td :nth-child("+ x[0] +")").addClass( x[1] );
		            	});
		            });

		        },
		        error: function() {
		            console.info("页面初始化Input搜索框查询出错：searchByInputReturnTable");
		        }
		    });
		}

		/*
		* domId：输入框的id
		* divId：返回table放置的位置id（如："#showSearchByInputValue"）
		* tableId： 拼接table的id（如："#englishFullNameTable"）
		* @author: junheng li
		*/
		function keyUpForSearch(domId, divId, tableId){
			valueInput = $( domId ).val().toUpperCase();//将文本值变为大写
			if(valueInput == hideValue){
		    	return false;
		    }
		    hideValue = valueInput;
		    $( divId ).hide();

		    $( tableId + " tr").each(function(){
		    	//将每个td的颜色都恢复为绿色
            	$(this).children(":first").removeClass("bggray");

            	//匹配每行第一个td的内容
            	if(-1!=$(this).children(":first").text().toUpperCase().indexOf(valueInput)){
            		//内容匹配成功，则显示，反之，则隐藏
	            	$(this).show();
            	}else{
	            	$(this).hide();
            	}
            });

            maxIndex = $( tableId + " tr[style!='display: none;']").length;//给定显示tr的长度
            previousTd = $( tableId + " tr[style!='display: none;']").eq(0).children(":first");
            previousTd.addClass("bggray");//给第一行显示tr的第一个td设置灰色
            defaultIndex = 0;//重置初始值为0

           //当tr显示的行不等于0时，才显示table
		    if(maxIndex!=0){
	            $( divId ).show();
	            couldSelected = true;
            }
		}
		var ttt = 10;
		$(document).keyup(function(event) {
		    if (couldSelected) {
			    switch (event.keyCode) {
			        case 38:
			            if (0 == defaultIndex) {
			                return false;
			            } else {
			            	$("#divTest").scrollTop(-15);
			                previousTd.removeClass("bggray");
			                defaultIndex = defaultIndex - 1;
			                previousTd = $( tableId + " tr[style!='display: none;']").eq(defaultIndex).children("td:nth-child(1)");
			                previousTd.addClass("bggray");
			                return false;
			            }
			        case 40:
			            if (maxIndex - 1 == (defaultIndex)) {
			                return false;
			            } else {
			            	$("#divTest").scrollTop(ttt);
			            	ttt+=5;
			                previousTd.removeClass("bggray");
			                defaultIndex = defaultIndex + 1;
			                previousTd = $( tableId + " tr[style!='display: none;']").eq(defaultIndex).children("td:nth-child(1)");
			                previousTd.addClass("bggray");
			                return false;
			            }
			        case 13:
			            var inputValue = $( tableId + " tr[style!='display: none;']").eq(defaultIndex).children("td:nth-child(1)").text();
			            $( willBeSearchedDomId ).val(inputValue);
			            $( divId ).hide();
			            hideValue = null;
						couldSelected = false;
			            return false;
			        case 27:
			            $( divId ).hide();
						couldSelected = false;
						$( willBeSearchedDomId ).val("");
						return false;
			    }
		    }
		});

		//隐藏div
		function hideDiv(divId, domId){
			//$(divId).hide();

			//如果文本框节点id不为空，则将hideValue置空
			if(domId){
				hideValue = null;
			}
		}

 	</script>