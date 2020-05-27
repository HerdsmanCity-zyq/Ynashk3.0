<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
    /*禁止缓存*/
    response.setHeader("Pragma","No-cache");
    response.setHeader("Cache-Control","no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
    <title>新增角色</title>
    <style type="text/css">
        .cover1{ background:#e4e2e2; z-index:2990; position:absolute; top:95px; left:0px; width:100%; height:100%; filter:alpha(Opacity=60);-moz-opacity:0.6;opacity: 0.6;}
    </style>
    <jsp:include page="../includestatic.jsp"></jsp:include>
    <script type="text/javascript" src="<%=basePath %>js/easyui/jquery.easyui.min.cron.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function getFunctionName(liList){
            functionName="";
            for(var i=0;i<liList.length;i++){
                var isSelected=liList[i].find("div span[class='tree-checkbox tree-checkbox0']").attr("class");
                if(isSelected!="tree-checkbox tree-checkbox0"){//获取选中按钮名称
                    functionName+="、"+$(this).find("div span[class=tree-title]").text();
                }
                functionName+="、"+liList[i].find("div span[class=tree-title]").text();
            }
            functionName=functionName.substring(1,functionName.length);
            return functionName;
        }
        function isFunction(vLi){
            var result=false;
            var isFunction=vLi.attr("style");
            if(isFunction=="float: left"){//方法层
                result=true;
            }
            return result;
        }
        var map = {};
        function PrevShow(){
            //获取选中的一级菜单
            $("#tt1").find("div[node-id=home]").each(function(){//div
                var isSelected=$(this).find("span[class='tree-checkbox tree-checkbox0']").attr("class");
                if(isSelected!="tree-checkbox tree-checkbox0"){//获取选中的一级菜单的名称
                    var oneMenue=$(this).find("span[class=tree-title]").text();
                    var mapTwo = {};
                    $(this).next().children("li").each(function(){//li 获取选中的二级菜单
                        isSelected=$(this).children("div").find("span[class='tree-checkbox tree-checkbox0']").attr("class");
                        if(isSelected!="tree-checkbox tree-checkbox0"){//获取选中的二级菜单的名称
                            var secondMenueKey=$(this).children("div").find("span[class=tree-title]").text();
                            var mapThree = {};
                            $(this).children("ul").children("li").each(function(){
                                isSelected=$(this).children("div").find("span[class='tree-checkbox tree-checkbox0']").attr("class");
                                if(isSelected!="tree-checkbox tree-checkbox0"){//获取选中的二级菜单的名称
                                    var threeMenueKey=$(this).children("div").find("span[class=tree-title]").text();
                                    var functionName="";
                                    var i=0;
                                    var mapFour = {};
                                    $(this).children("ul").children("li").each(function(){//
                                        //var test=$(this).children("div").find("span[class='tree-title']").text();
                                        isSelected=$(this).children("div").find("span[class='tree-checkbox tree-checkbox0']").attr("class");
                                        if(isSelected!="tree-checkbox tree-checkbox0"){
                                            //判断是否还有下级float: left;
                                            var isMenu4=$(this).attr("style");
                                            if(isMenu4!="float: left;"){
                                                i++;
                                                var fourMenueKey=$(this).children("div").find("span[class=tree-title]").text();
                                                var functionName1="";
                                                $(this).children("ul").children("li").each(function(){//
                                                    isSelected=$(this).children("div").find("span[class='tree-checkbox tree-checkbox0']").attr("class");
                                                    if(isSelected!="tree-checkbox tree-checkbox0"){
                                                        functionName1+="、"+$(this).children("div").find("span[class=tree-title]").text();
                                                    }
                                                });
                                                functionName1=functionName1.substring(1,functionName1.length);
                                                mapFour[fourMenueKey]=functionName1;
                                            }else{
                                                functionName+="、"+$(this).children("div").find("span[class=tree-title]").text();
                                            }
                                        }
                                    });
                                    functionName=functionName.substring(1,functionName.length);
                                    if(i>0){
                                        mapThree[threeMenueKey]=mapFour;
                                    }else{
                                        mapThree[threeMenueKey]=functionName;
                                    }
                                }
                            });
                            mapTwo[secondMenueKey]=mapThree;
                        }
                    });
                    map[oneMenue]=mapTwo;
                }
            });
            createTable(map);
            $("#showRole").fadeIn("slow");//淡入淡出效果 显示div
            $(".cover1").css("display","block");
            $("#BUTTON_SAVE,#BUTTON_PREV,#BUTTON_BACK").hide();
        }
        function Back(){
            $(".cover1").css("display","none");
            $("#BUTTON_SAVE,#BUTTON_PREV,#BUTTON_BACK").show();
            $("#showRole").hide();
        }
        function createTable(map){
            $("#prevTable").empty();
            var a=0;
            var vtr0button="";
            var vTd7="";
            for(var prop in map){ //一级菜单循环
                var vTd1="";
                var vTd4="";
                var vTd5="";
                var vTd6="";
                var vtr1button="";
                if(map.hasOwnProperty(prop)){
                    a++;
                    var twoMap=map[prop];
                    var vMenue2="";
                    var b=0;
                    var vtr2button="";
                    for(var prop1 in twoMap){ //二级菜单循环
                        if(twoMap.hasOwnProperty(prop1)){
                            b++;
                            var threeMap=twoMap[prop1];
                            var vMenue3="";
                            var button="";
                            var vtr3button="";
                            var c=0;
                            //var vTd4="";
                            for(var prop2 in threeMap){//三级菜单和按钮循环
                                if(threeMap.hasOwnProperty(prop2)){ //判断是否有四级菜单
                                    c++;
                                    var d=0;
                                    var vMenue4="";
                                    var button2="";
                                    var vtr4button="";//tr<四级菜单和按钮>
                                    var fourMap=threeMap[prop2]==""?"&nbsp;":threeMap[prop2];
                                    vMenue3="<td style='border-right:1px solid #000;width:192px;'>"+prop2+"</td>";
                                    threeMap[prop2]=threeMap[prop2]==""?"&nbsp;":threeMap[prop2];
                                    button="<td style='width:736px;'>"+threeMap[prop2]+"</td>";//border-right:1px solid #000;
                                    if(threeMap[prop2].constructor == Object){//有四级菜单
                                        for(var prop3 in fourMap){//四级菜单和按钮循环
                                            if(fourMap.hasOwnProperty(prop3)){
                                                d++;
                                                vMenue4="<td style='border-right:1px solid #000;width:192px; '>"+prop3+"</td>";//四级菜单
                                                fourMap[prop3]=fourMap[prop3]==""?"&nbsp;":fourMap[prop3];//按钮
                                                button2="<td style='width:736px;'>"+fourMap[prop3]+"</td>";//按钮
                                                vtr4button+="<tr data-index='5' style='border-bottom:1px solid #000;'>"+vMenue4+button2+"</tr>";
                                            }
                                        }
                                        vtr4button=removeBottomBorder(vtr4button,5);
                                        //三级菜单（有四级菜单）
                                        vtr3button+="<tr data-index='4' style='border-bottom:1px solid #000;'>"+vMenue3+"<td colspan='3' style='width:928px;'><table style='928px;'>"+vtr4button+"</table></td></tr>";
                                    }else{//三级菜单（没有四级菜单）
                                        vtr3button+="<tr data-index='4' style='border-bottom:1px solid #000;'>"+vMenue3+"<td  style='border-right:1px solid #000;width:192px;'>&nbsp;</td>"+button+"</tr>";//
                                    }
                                }
                            }
                            vTd4=vtr3button;
                            vTd4=removeBottomBorder(vTd4,4);
                            if(c==0){//二级菜单（没有三级菜单）
                                vTd5="<td style='width:1120px;'  colspan='3' ><table><tr>"
                                    +"<td style='border-right:1px solid #000;width:192px;'>&nbsp;</td>"
                                    +"<td style='border-right:1px solid #000;width:192px;'>&nbsp;</td>"
                                    +"<td style='width:736px;border-right:0px solid #000;'>&nbsp;</td>"
                                    +"</tr></table></td>";
                            }else{//二级菜单（有三级菜单）
                                vTd5="<td style='width:1120px; '><table style='1120px;'>"+vTd4+"</table></td>";
                            }
                            vMenue2="<td style='border-right:1px solid #000;width:192px;'>"+prop1+"</td>";
                            vtr2button+="<tr data-index='3' style='border-bottom:1px solid #000;'>"+vMenue2+vTd5+"</tr>";
                        }
                    }
                    vtr2button=removeBottomBorder(vtr2button,3);
                    if(b==0){//只有一级菜单
                        vTd6="<td style='border-right:1px solid #000;width:192px;'>&nbsp;</td>"
                            +"<td style='border-right:1px solid #000;width:192px;'>&nbsp;</td>"
                            +"<td style='border-right:1px solid #000;width:192px;'>&nbsp;</td>"
                            +"<td style='width:736px;'>&nbsp;</td>";
                    }else{
                        vTd6="<td style='width:1312px;'><table style='1312px;'>"+vtr2button+"</table></td>";
                    }
                    vTd1="<td style='border-right:1px solid #000;width:192;'>"+prop+"</td>";
                    vtr1button+="<tr data-index='2' style='border-bottom:1px solid #000;'>"+vTd1+vTd6+"</tr>";
                }
                vtr1button=removeBottomBorder(vtr1button,2);
                vTd7="<td style='width:1504px;'><table style='1504px;'>"+vtr1button+"</table></td>";
                vtr0button+="<tr style='border-bottom:1px solid #000;'>"+vTd7+"</tr>";
            }
            $("#prevTable").append(vtr0button);
        }

        function removeBottomBorder(vtrList,num){
            var vtr1=vtrList.substring(0,vtrList.lastIndexOf("<tr data-index='"+num+"'"));
            var vtr2=vtrList.substring(vtrList.lastIndexOf("<tr data-index='"+num+"' style='border-bottom:1px solid #000;'>")+57, vtrList.lastIndexOf("</tr>")+5);
            var result=vtr1+"<tr style='border-bottom:0px solid #000;'>"+vtr2;
            return result;
        }

        function editStatus(){
            $(".operate_btn a:eq(0)").css("display","none");
            $(".cover").css("display","none");
            $("#BUTTON_SAVE").show();
            changeMenuName("更改角色");	//更改菜單名稱
        }

        function delRole(code){
            // if(confirm("是否删除角色"+code+"?")){
            //     window.location.href = "newRole.do?action=del&code="+code;
            // }
        }
    </script>

</head>

<body onclick="getOldMenu();">
<jsp:include page="../menu.jsp" />
<div class="operate_btn">
    <a class="icon22 ml10 mt5" onclick="editStatus()"></a>
    <a class="icon21 pl30 ml10 mt5" onclick="delRole('${roleVo.roleCode }')"></a>
</div>
<div class="cont pr">
    <form id="newRole" >
        <div style="width: 100%">
            <table>
                <tr>
                    <td width="35%" align="left">
                        <!-- llll -->
                        <div class="add_box">
                            <table class="add_tab" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th align="left">
                                        <label>
                                            <spring:message code="newRole.roleCode" />
                                        </label>
                                        <span data-text='col'></span>
                                    </th>
                                    <td>
                                        <input class="yellow cont_num_en" type="text" id="roleCode" name="roleCode"  placeholder="" value="${ roleVo.roleCode}" readonly="readonly"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th align="left">
                                        <label>
                                            <spring:message code="newRole.roleName" />
                                            <spring:message code="label.common.asterisk" />
                                        </label>
                                        <span data-text='col'></span>
                                    </th>
                                    <td>
                                        <input  type="text" id="roleName" name="roleName"  placeholder="" value="${ roleVo.roleName}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th align="left">
                                        <label>
                                            <!-- <spring:message code="newRole.roleName" /> -->角色名稱
                                            <spring:message code="label.common.asterisk" />
                                        </label>
                                        <span data-text='col'></span>
                                    </th>
                                    <td>
                                        <input  type="text" id="roleChiName" name="roleChiName" value="${roleVo.roleChiName }"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th align="left">
                                        <label>
                                            <spring:message code="newRole.effectDate" />
                                            <spring:message code="label.common.asterisk" />
                                        </label>
                                        <span data-text='col'></span>
                                    </th>
                                    <td>
                                        <input class="calendar_bg cont_num_en" type="text" id="effectDate" name="effectDate" value="${roleVo.effectDate }"  placeholder="" />
                                    </td>
                                </tr>
                                <tr>
                                    <th align="left">
                                        <label>
                                            <spring:message code="newRole.stopDate" />
                                            <spring:message code="label.common.asterisk" />
                                        </label>
                                        <span data-text='col'></span>
                                    </th>
                                    <td>
                                        <input class="calendar_bg cont_num_en" type="text" id="stopDate" name="stopDate" value="${roleVo.stopDate }"  placeholder="" />
                                    </td>
                                </tr>
                                <tr>
                                    <th align="left">
                                        <label>
                                            <spring:message code="newRole.menuPrivilege" />
                                        </label>
                                        <span data-text='col'></span>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <!-- oooo -->
                    <td width="15%" align="center" valign="top" style="font-weight:bold">
                        <%--<label style="width: 96px;"><spring:message code="newRole.flow"/></label>--%>
                        <%--<span data-text='col'></span>--%>
                    </td>
                    <td width="50%" align="center" valign="top"></td>
                </tr>
            </table>
        </div>
        <!-- 菜单权限 class="easyui-tree" data-options="method:'get',animate:true,checkbox:true"-->
        <div style="width:1000px ;height: 410px; overflow:auto">
            <ul id="tt1"></ul>
        </div>
    </form>

    <div class="cover"></div>
</div>
<!-- 預覽權限 -->
<div id="showRole" style="border:1px solid blue; width:1552px; height:650px; display:none; position:absolute; top:100px; right:15px; background-color: white;z-index: 9999"><!-- position: relative; -->
    <p>&nbsp;</p>
    <label>&nbsp;&nbsp;<spring:message code="newRole.allocated_authority" />:</label>
    <p>&nbsp;</p>
    <div style="width: 1504px;height: 32px;position: relative;left: 10px;">
        <table style="border:1px solid #000;width: 1504px;height: 32px;">
            <thead>
            <tr style="border-bottom:0px solid #000; ">
                <th style="border-right:1px solid #000;width:192px;"><spring:message code="newRole.oneMenu" /></th>
                <th style="border-right:1px solid #000;width:192px;"><spring:message code="newRole.twoMenu" /></th>
                <th style="border-right:1px solid #000;width:192px;"><spring:message code="newRole.treeMenu" /></th>
                <th style="border-right:1px solid #000;width:192px;"><spring:message code="newRole.fourMenu" /></th>
                <th style="width:736px;"><spring:message code="newRole.permissionButtons_labels" /></th>
            </tr>
            </thead>
        </table>
    </div>
    <div style="width: 1521px; height:500px; position: relative; overflow:auto; left: 10px;">
        <table id="prevTable" style="width: 1504px;max-height:300px;border-style:solid; border-width:1px; border-color:#000;overflow-y:scroll;">
        </table>
    </div>
    <div style="position: absolute;bottom: 25px;left: 20px;">
        <sam:Button accessControl="Y" dim="Y"  onclick="Back();" altKey="button.common.back"/>
    </div>
</div>
<div class="sub">
    <sam:Button accessControl="Y" dim="Y"  onclick="doBack();" altKey="button.common.back" id="BUTTON_BACK"/>
    <sam:Button accessControl="Y" dim="N" btnName="new_role_save" onclick="SaveRole1()"  altKey="button.common.save" id="BUTTON_SAVE"/>
    <sam:Button accessControl="Y" dim="N" btnName="Read" onclick="PrevShow()" altKey="button.common.preview.permissions" id="BUTTON_PREV"/>
</div>
<script type="text/javascript">

    $(document).ready(function(){
        $(function(){
            var data = ${requestScope.treeData};
            $("#tt1").tree({
                lines:true,
                checkbox:true,
                data:data,
                onLoadSuccess:function(){
                    //最后一级横向排列
                    $("#tt1").find("ul>li:has(ul)").css("clear","both");
                    $("#tt1").find("ul>li:not(:has(ul))").each(function(){
                        var id = $(this).children().attr("node-id");
                        if(id!=undefined){
                            if(id.indexOf("-_")!=-1){
                                $(this).css("float","left");
                            }else{
                                $(this).css("clear","both");
                            }
                        }
                    });
                },
                onClick:function(node){
                    $(this).tree("toggle", node.target);
                },
                onContextMenu:function(e, node){
                    e.preventDefault();
                    $("#tt1").tree("select", node.target);
                }
            });
            if($("#roleCode").val()!=""&&$("#roleCode").val()!=null){//检视角色流程
                $("#BUTTON_SAVE").hide();
                $(".cover").css("display","block");
            }else{//新增角色流程
                $("#effectDate").val(getDateFormat("YYYY/MM/DD"));
                $("#stopDate").val(getDateFormat("YYYY/MM/DD"));
                $("#BUTTON_SAVE").show();
                $(".operate_btn").css("display","none");
                $(".cover").css("display","none");
            }
        });
    });

    $(function(){
        $("#effectDate,#stopDate").on("click",function(){
            WdatePicker({lang:"${language eq 'EN' ? 'en' : 'zh-tw' }",el:$dp.$($(this).prop("id")),dateFmt:'yyyy/MM/dd',isShowClear:true});
        });
    });
    function changeColor(el){
        $("li[data_code]").removeClass("selected");
        $(el).addClass("selected");
    }

    function treeFunction(){
        var nodes = $("#tt1").tree("getChecked");

        var s = '';
        for(var i = 0; i < nodes.length; i++){
            if (s != ''){
                s += ',';
            }
            var temp = nodes[i].attributes;
            if(temp == undefined){
                if(nodes[i].id!=0){
                    s += nodes[i].id;
                };
            }else{
                s += temp.function_code+'-'+temp.control_code;
            };
        }
        return s;
    }
    var nodeArr = new Array();

    function treeFunction1(){
        var nodes = $("#tt1").tree("getChecked");
        var arr = new Array();
        console.log("=nodes=",nodes)

        for(var i = 0; i < nodes.length; i++){
            var obj = {
                id:'',
                text:'',
                function_code:'',
                control_code:''
            };


            var temp = nodes[i].attributes;
            if(temp == undefined){
                if(nodes[i].id != undefined && nodes[i].id != 'home'){
                    obj.id = nodes[i].id;
                    obj.text = nodes[i].text;
                    obj.function_code = "READ";
                    arr.push(obj);
                };


            }else{
                obj.id=temp.function_code+'-'+temp.control_code;
                obj.text = temp.control_name;
                obj.function_code = temp.function_code;
                obj.control_code = temp.control_code;
                arr.push(obj);

            };

        }
        return arr;
    }
    //新增角色
    function yz(){
        var message="";
        message+=validate("roleName","<spring:message code='newRole.roleName' />",true);
        message+=validate("roleChiName","<spring:message code='newRole.roleChiName'/>",true);
        message+=validate("effectDate","<spring:message code='newRole.effectDate'/>",true);
        message+=validate("stopDate","<spring:message code='newRole.stopDate'/>",true);
        var tree = treeFunction();
        if(tree==null&&tree==""){
            message +="<spring:message code='newRole.message'/>";
        }
        return message;
    }
    function SaveRole(){
        var message = "";//聲明提示語
        var allCheck = $("#tt1").tree("getChecked");//获取所有选中节点
        var Rli=$("ul[data_left]").find("li");//右邊左框的所有Li
        var tip="";
        Rli.each(function(){//遍曆Li
            var proError="";		//保存流程下的某个权限在tree中不存在
            var code = $(this).attr("data_code");//獲取所有流程CODE
            var Rspan=$("ul[data_left] li[data_code='"+code+"']");//多個流程CODE保存在數組裏
            var proName = Rspan.attr("proname");		//获取流程名称  用于说明流程绑定有误
            Rspan.find("span").each(function(){
                var bool=true;
                for(var i = 0; i < allCheck.length; i++){
                    var leftLi=$("ul[data_left] li[data_code='"+code+"'] span[menu_code='"+$(this).attr("menu_code")+"']");//獲取當前流程的菜單CODE
                    if(leftLi.length>1){//比较按钮（如果有read甚至更多按鈕則比較除了read按鈕權限）
                        if($(this).text().indexOf("READ")==-1){
                            //綁定的流程必須滿足綁定流程的所有權限   每一個流程根據菜單code和按鈕code去跟tree對比

                            if($(this).text()+"-_"==allCheck[i].id){//按鈕的code保存在text()中 $(this).text()即按鈕CODE
                                bool=true;
                                break;//只要權限在tree中能找到就直接跳出進行下一個權限的判斷
                            }else{
                                bool=false;
                            }
                        }else{
                            break;
                        }
                    }else{//比較menu（只有一個read按權限直接比較菜單權限）

                        if(allCheck[i].id!=null){
                            if($(this).attr("menu_code")==allCheck[i].id){
                                bool=true;
                                break;
                            }else{
                                bool=false;
                            }
                        }
                    }
                }
                if(bool==false){

                    var nodeMenu = $("#tt1").tree("find",$(this).attr("menu_code"));
                    var nodeCon = $("#tt1").tree("find",$(this).text()+"-_");
                    if(nodeCon!=null){

                        proError=nodeMenu.text+"-"+nodeCon.text+","+proError;
                    }else{

                        proError=nodeMenu.text+","+proError;
                    }
                }
            })
            if(proError!=""){
                proError = proError.substring(0,proError.length-1);
                message = "該角色應包含選擇流程"+proName+"的"+proError+"功能！";
                tip = message+"\n"+tip;
            }

        })

        if(message!=""){
            console.log("====",tip)
            alert(tip);
            return;
        }

        var selectedLi=$("ul[data_left] li");
        var process_code="";
        selectedLi.each(function(){
            var left = $(this).attr("data_code");
            process_code += left+",";
        });
        process_code= process_code.substring(0,process_code.length-1);
        var message=yz();
        if(message!=null&&message!=""&&message!=undefined&&message!="undefined"){
            alert(message);
            return;
        }
        var roleCode=$("#roleCode").val();
        var roleName=$("#roleName").val();
        var effectDate=$("#effectDate").val();
        var stopDate=$("#stopDate").val();
        var roleChiName=$("#roleChiName").val();
        var data="jsonTree="+treeFunction();
        data+="&roleCode="+roleCode;
        data+="&roleName="+roleName;
        data+="&roleChiName="+roleChiName;
        data+="&effectDate="+effectDate;
        data+="&stopDate="+stopDate;
        data+="&process_code="+process_code;
        data+="&action=SaveNewRole";
        console.log("data",data);
        $.post("newRole.do",data,function(message){
            var arr=message.split("%");
            $("#roleCode").val(arr[0]);
            alert(arr[1]);
        });
    };
    function SaveRole1(){
        var message = "";//聲明提示語
        var allCheck = $("#tt1").tree("getChecked");//获取所有选中节点
        var Rli=$("ul[data_left] li");
        var arr = [];
        Rli.each(function(){
            arr.push($(this).attr("data_code"));
        })
        var roleCode=$("#roleCode").val();
        var roleName=$("#roleName").val();
        var effectDate=$("#effectDate").val();
        var stopDate=$("#stopDate").val();
        var roleChiName=$("#roleChiName").val();
        var data = {
            code:arr,
            roleCode:roleCode,
            roleName:roleName,
            effectDate:effectDate,
            stopDate:stopDate,
            roleChiName:roleChiName,
            treelist:treeFunction1(),
            nodeList:nodeArr
        }

        var selectedLi=$("ul[data_left] li");
        var process_code="";
        selectedLi.each(function(){
            var left = $(this).attr("data_code");
            process_code += left+",";
        });
        process_code= process_code.substring(0,process_code.length-1);
        var message=yz();

        if(message!=null&&message!=""&&message!=undefined&&message!="undefined"){
            // Showbo.Msg.alert(message);
            alert(message);
            return;
        }
        var roleCode=$("#roleCode").val();
        var roleName=$("#roleName").val();
        var effectDate=$("#effectDate").val();
        var stopDate=$("#stopDate").val();
        var roleChiName=$("#roleChiName").val();
        var data="jsonTree="+treeFunction();
        data+="&roleCode="+roleCode;
        data+="&roleName="+roleName;
        data+="&roleChiName="+roleChiName;
        data+="&effectDate="+effectDate;
        data+="&stopDate="+stopDate;
        data+="&process_code="+process_code;
        data+="&action=SaveNewRole";
        console.log("data",data);
        $.post("newRole.do",data,function(message){
            var arr=message.split("%");
            $("#roleCode").val(arr[0]);
            //Showbo.Msg.alert(arr[1]);
            alert(arr[1]);
        });
    }
</script>
</body>
</html>
