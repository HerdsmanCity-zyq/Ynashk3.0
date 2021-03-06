<%--
  Created by IntelliJ IDEA.
  User: youquan
  Date: 2019/12/25
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("basePath", basePath);
    /*禁止缓存*/
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <jsp:include page="../includestatic.jsp"/>
    <%--<script type="text/javascript" src="<%=basePath %>js/mouseDownForTable.js"></script>--%>
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath %>css/SearchFrame.css">--%>
    <script type="text/javascript" src="<%=basePath %>js/newFRAPAF.js"></script>
    <style type="text/css">
        .hidden{display: none}
        .editmode a {
            margin-left: 30px;
        }
        .editmode{
            width:100%;
            height:50px;
            background-color:#f1f2f4;
            margin-left: -8px;
        }
        .wrapper {
            position: fixed;
            z-index: 9999;
            background: #f7f7f7;
            width: 100%;
            height: 100%;
            margin-top: 30px;
            opacity: 0.4;
            left: 0;
        }

    </style>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="cont" onclick="getOldMenu()">
<c:if test="${pageType == '2'}">

    <div class="wrapper">

    </div>
    <div class="editmode">
        <a href="javascript:void(0)" id="editPVV" class="icon22" onclick="editPVV()"></a>
        <a href="javascript:void(0)" id="deletePVV" class="icon21" onclick="deletePVV('${fvp.projectId}','${fvp.pafId}')"></a>
    </div>
</c:if>
<form id="newFormData" enctype="multipart/form-data">
    <div>
        <table class="add_tab" border="0px" cellpadding="0" cellspacing="0" width="98%">
            <%--第一行--%>
            <tr>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.project"/>
                        <span data-text='asterisk'></span>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td style="width:280px">
                    <%--下拉框 需要联动--%>
                    <sam:select dropdownName="getProjectWithoutVisio" id="project" name="projectId" style="width:120px" onchange="projectChange(this.value)"
                     value="${fvp.projectId}"/>


                </td>

                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.pafName"/>
                        <span data-text='asterisk'></span>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>

                <%--<sam:select dropdownName="getPafNameInFvp" id="pafName" name="pafName" style="width:220px" onchange="pafNameChange(this.value)" />--%>
                 <%--   <sam:selectDataList id="pafName" dropdownName="getPafNameInFvp" />--%>
                    <datalist id="pafList"></datalist>
                    <input list="pafList" id="pafName" style="width:220px" onchange="pafNameChange(this.value)" value="" />

                </td>
            </tr>
            <%--第二行--%>
            <tr>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.pafNo"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="newPafNo" name="pafId"
                           value="${fvp.pafId}"
                           maxlength="15"  class="tr yellow cont_num_en"
                           style="width:60px;text-align: left"/>

                </td>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.pafFramework"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <c:if test="${pageType == '1'}">
                        <input type="text" id="newPafFramework"
                               value="${fvp.frameworkName}" maxlength="20" readonly="readonly" class="yellow cont_num_en" style="width:200px;"/>
                    </c:if>

                    <c:if test="${pageType == '2'}">
                        <input type="text" id="newPafFramework"
                               value="" maxlength="20" readonly="readonly" class="yellow cont_num_en" style="width:200px;"/>
                    </c:if>


                </td>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.version"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td width="180px">
                    <c:if test="${pageType == '1'}">
                        <input type="text" id="newVersion" value="${fvp.versionsNo}"
                               readonly="readonly" class="yellow cont_num_en" style="width: 160px"/>
                    </c:if>

                    <c:if test="${pageType == '2'}">
                        <input type="text" id="newVersion" value=""
                               readonly="readonly" class="yellow cont_num_en" style="width: 160px"/>
                    </c:if>

                </td>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.pafStatus"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="pafStatus"
                           maxlength="15"   class="tr yellow "
                           style="width:80px;text-align: center"
                            <c:if test="${pageType == '1'}">
                                value=""
                            </c:if>
                            <c:if test="${pageType == '2'}">
                                value="${fvp.status}"
                            </c:if> />
                    <%--<input type="hidden" name="status" id="status" value=""/>--%>

                </td>
            </tr>
            <%--第三行--%>
            <tr>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.pafName2"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <c:if test="${pageType == '1'}">
                        <input type="text" id="newPafName2" value="${fvp.pafNameChi}"
                               maxlength="20" readonly="readonly" class="yellow cont_num_en" style="width:200px;"/>
                    </c:if>
                    <c:if test="${pageType == '2'}">
                        <input type="text" id="newPafName2" value=""
                               maxlength="20" readonly="readonly" class="yellow cont_num_en" style="width:200px;"/>
                    </c:if>


                </td>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.pafEngName"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <c:if test="${pageType == '1'}">
                        <input type="text" id="newPafEnName" value="${fvp.pafName}"
                               maxlength="20" readonly="readonly" class="yellow cont_num_en" style="width:200px;"/>
                    </c:if>
                    <c:if test="${pageType == '2'}">
                        <input type="text" id="newPafEnName" value=""
                               maxlength="20" readonly="readonly" class="yellow cont_num_en" style="width:200px;"/>
                    </c:if>


                </td>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.pafBpwinNo"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" id="newPafBpwinNo"
                            <c:if test="${pageType == '1'}">
                                value="${fvp.bpwinNo}"
                            </c:if>
                            <c:if test="${pageType == '2'}">
                                value=""
                            </c:if>
                            maxlength="20" readonly="readonly" class="yellow cont_num_en" style="width:160px;"/>

                </td>
            </tr>
            <%--第四行--%>
            <tr>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.SA"/>
                        <span data-text='asterisk'></span>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <%--当前用户要是SA 才能默认显示--%>
                    <c:if test="${pageType == '1'}">
                        <sam:select id="SA" name="designBy" dropdownName="getPafSA" style="width:120px" value="${sessionScope.currUser.userCode}"/>
                    </c:if>
                    <c:if test="${pageType == '2'}">
                        <sam:select id="SA" name="designBy" dropdownName="getPafSA" style="width:120px" value="${fvp.designBy}"/>
                    </c:if>
                </td>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.pafVisioDocument"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td width="376px">
                    <input type='text' id="newVisio" readonly='readonly' name="visioName" maxlength='50'
                            <c:if test="${pageType == '1'}">
                                value=""
                            </c:if>
                            <c:if test="${pageType == '2'}">
                                value="${fvp.visioName}"
                            </c:if>
                           onclick="openPafDoc()" style="width:260px;"/>
                    <input type="file" hidden id='PafVsdFile' accept=".vsdx,vsd" onchange='pafOnChange(this);' name='visioFile'/>
                    <%--	<input type="text" id="newVisio" name="pafDocument"
                               value="" maxlength="50" />--%>
                        <a href='javascript:void(0)' id="newPafUploadVsd" class='icon45' title="上傳文檔"></a>
                    <a id="downVsd" class='icon47' title="下載最新的文檔" download=""></a>
                    <a id="downVsd2" hidden download="" href=""></a>
                </td>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.visioVersion"/>
                        <span data-text='asterisk'></span>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" id="visioVersion"  name="pafVisioVersion" onchange="checkVisioVersion()" oninput="value=value.replace(/[^\d]/g,'')"
                            <c:if test="${pageType == '1'}">
                                value=""
                            </c:if>
                            <c:if test="${pageType == '2'}">
                                value="${fvp.pafVisioVersion}"
                            </c:if>
                           maxlength="12" style="width:160px;"/>

                </td>
            </tr>
            <%--第五行--%>
            <tr>
                <th>
                    <label>
                        <spring:message code="paf.newOnePafEdition.pafRemarks"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <c:if test="${pageType == '1'}">
                        <sam:select name="remarkId" id="newRemarkId" dropdownName="getPafRemarks" class="w150" style="width:220px"/>
                        <input id="lastUpdate" hidden name="lastUpdate" value="${lud}"/>
                    </c:if>
                    <c:if test="${pageType == '2'}">
                        <sam:select name="remarkId" id="newRemarkId" dropdownName="getPafRemarks" class="w150" style="width:220px"
                                    value="${fvp.remarkId}"/>
                        <input id="lastUpdate" hidden name="lastUpdate" value="<fmt:formatDate value="${fvp.lud}" pattern="yyyy/MM/dd HH:mm:ss" />"/>
                    </c:if>

                </td>
            </tr>




        </table>
    </div>

    <%--页面底部的按钮--%>
    <div style="position: fixed;bottom:36px; left:32px; z-index: -1;">
        <sam:Button accessControl="N" dim="N"  onclick="todoBack()" altKey="button.common.back"/>
        <sam:Button accessControl="Y" dim="N" btnName="new_paf_edition_save" onclick="savePafEdition('已保存')" id="btn1"
                    altKey="button.common.save"/>
        <sam:Button accessControl="Y" dim="N" btnName="new_paf_edition_designing" onclick="savePafEdition('設計中')" id="btn2"
                    altKey="button.common.initial.design"/>
        <sam:Button accessControl="Y" dim="N" btnName="new_paf_edition_design" onclick="savePafEdition('已設計')" id="btn3"
                    altKey="button.common.design"/>
        <sam:Button accessControl="Y" dim="N" btnName="new_paf_edition_confirm" onclick="savePafEdition('確認設計')" id="btn4"
                    altKey="button.common.customerConfirm"/>

    </div>

</form>
</div>

<script type="text/javascript">
    var formSerial ;
    //1为新增，2为检视
    var pageType = "${pageType}";


    $(function () {
        //页面加载完成函数
        $(".sub:first").hide();
        getDataList();
        upButton();
        formSerial = $("#newFormData").serialize();


        var value1= $("#pafList").find("option[idInfo='${fvp.pafId}']").attr("value");
        $("#pafName").val(value1);
        $("#pafName").trigger("onchange");

        if (pageType==="1"){
            $('.editmode').addClass('hidden');
            $(".wrapper").addClass('hidden');
        }else{
            //修改tab标签
            changeMenuName("修改一個_PAF_版本");
        }




    });

    var pfList = ${pfList};
    //全局变量--->存储旧的visio版本
    var oldPafVisioVersion = "" ;
    if (pageType=="1"){
       oldPafVisioVersion =  '${pafVisioVersion}';
    } else {
        <%--oldPafVisioVersion = '${fvp.pafVisioVersion}';--%>
        oldPafVisioVersion = $("#visioVersion").val();
    }



    function savePafEdition(status) {
        var project =$("#project").val();
        var pafId = $("#newPafNo").val();
        var designBy = $("#SA").val(); //下拉框的默认值是"0"
        var visioVersion = $("#visioVersion").val();
        if (project=="0"||designBy==""||pafId==""||designBy=="0"||designBy==""||visioVersion==""){
            Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.01"/>");
            return;
        }

        //判断两边的版本号是否一致，不一致，不可以保存
        if ($("#visioVersion").hasClass("error")) {
            Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.12"/>");
            return;
        }
        //从数据库检查DB中最后的一个版本
        var boo = compareVersion();
        if(!boo){
            Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.02"/>");
            return;
        }else{
            var visioVersionFlag = getLatestVisioVersion(project,pafId,visioVersion);
            if (visioVersionFlag===1){
                Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.02"/>");
                return;
            }
        }





        //点击確認設計状态按钮
        if (status==="確認設計") {
            var visioName = $("#newVisio").val();
            if (visioName==="" || visioName.indexOf("fakepath")!=-1){
                Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.03"/>");
                return;
            }
        }

        var saveStatus="";
        var currStatus = $("#pafStatus").val();
        if (currStatus==="設計中" ||currStatus==="已設計"||currStatus==="確認設計"){
            if (status==="已保存") {  //点击了保存按钮的话，当前状态不改变
                saveStatus = currStatus;
            }else {  //点击的是别的按钮
                saveStatus = status;
            }
        }else {
            saveStatus = status;
        }



        //var data = new FormData($("#newFormData")[0]);
        var data = new FormData();
        data.append("projectId",project);
        data.append("pafId",pafId);
        data.append("designBy ",designBy);
        data.append("pafVisioVersion",visioVersion);
        data.append("remarkId ",$("#newRemarkId").val());
        data.append("lastUpdate",$("#lastUpdate").val());
        //序列化旧版本字段进去old
        data.append("oldPafVisioVersion",oldPafVisioVersion);
        data.append("status",saveStatus);




        // data.set("projectId",project);
        // //保存的时候不做文件上传
        // data.delete("visioName");
        // data.delete("visioFile");
        // //序列化旧版本字段进去old
        // data.append("oldPafVisioVersion",oldPafVisioVersion);
        // data.append("status",saveStatus);
        // data.forEach(function (value,key) {
        //     console.info(key+" : "+value);
        // });
        $.ajax({
            url:"newOnePAFEdition.do?action=savePafVisioVersion",
            type: 'POST',
            data: data,
            cache: false,
            contentType: false, //不设置内容类型
            processData: false, //不处理数据
            success:function (data) {
                if (data.code === 200){
                    //保存成功之后，设置项目和PAF名称不可编辑
                    setDisabled();

                    //获取此时的status
                    var currStatus = $("#pafStatus").val();
                    if (currStatus==="設計中" ||currStatus==="已設計"||currStatus==="確認設計"){
                        if (status==="已保存") {  //点击了保存按钮的话，当前状态不改变
                            $("#pafStatus").val(currStatus);
                        }else {  //点击的是别的按钮
                            $("#pafStatus").val(status);
                        }
                    }else {
                        $("#pafStatus").val(status);
                    }

                    //获取塞完值之后的状态信息
                    var afterEditStatus = $("#pafStatus").val();
                    //確認設計等状态不能修改Visio版本号，不能再上传Visio文档
                    if (afterEditStatus==="確認設計"||afterEditStatus==="已分派"||
                        afterEditStatus==="編碼中"||afterEditStatus==="已編碼"||afterEditStatus==="已提交"){
                        $("#visioVersion").attr("readonly","readonly");
                        $("#visioVersion").addClass("yellow cont_num_en");

                        $("#newVisio").removeAttr("onclick");
                        $("#newVisio").addClass("yellow");

                        $("#newPafUploadVsd").unbind("click");
                    }




                    $("#lastUpdate").val(data.data.lastUpdate);
                    //$('#newVisio').val(data.data.visioName);
                    //$('#PafVsdFile').val('');
                    //把上一次的旧的版本信息保存为全局变量old ，， 这里应该可以直接赋值为input框内的值
                    oldPafVisioVersion =data.data.pafVisioVersion;
                    formSerial = $("#newFormData").serialize();
                    Showbo.Msg.alert("保存成功",function(){
                        if (toback === 1){
                            toback = 0;
                            doBack();
                        }
                    });
                    upButton();

                }else if (data.code === 0) {
                    <%--Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.04"/>");--%>

                    Showbo.Msg.alert(data.msg);
                }else{
                    Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.05"/>");
                }
            },
            error:function () {
                Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.06"/>");
            }
        })

    }

    function compareVersion(){
        if(oldPafVisioVersion !== ""){
            var oldVersion = parseFloat(oldPafVisioVersion);
            var newVersion = $("#visioVersion").val();
            if (newVersion  !== ""){
                 newVersion = parseFloat(newVersion);
                 if(newVersion >= oldVersion){
                     return true;
                 }
            }

        }else{
            return true;
        }
        return false;
    }

    function upButton(){
        var status = $("#pafStatus").val();
        //保存按钮是一直都可以点击的
        //true 是不可点击  false 是可以点击
        if (status === "已保存"){
            BottonIFWhether(false, $("#btn1"));
            BottonIFWhether(false, $("#btn2"));
            BottonIFWhether(true, $("#btn3"));
            BottonIFWhether(true, $("#btn4"));
        }else if(status==="設計中"){
            BottonIFWhether(false, $("#btn1"));
            BottonIFWhether(true, $("#btn2"));
            BottonIFWhether(false, $("#btn3"));
            BottonIFWhether(true, $("#btn4"));
        }
        else if(status==="已設計"){
            BottonIFWhether(false, $("#btn1"));
            BottonIFWhether(true, $("#btn2"));
            BottonIFWhether(true, $("#btn3"));
            BottonIFWhether(false, $("#btn4"));
        }
        else if(status==="確認設計"){
            BottonIFWhether(false, $("#btn1"));
            BottonIFWhether(true, $("#btn2"));
            BottonIFWhether(true, $("#btn3"));
            BottonIFWhether(false, $("#btn4"));
        }else {
            BottonIFWhether(true, $("#btn2"));
            BottonIFWhether(true, $("#btn3"));
            BottonIFWhether(true, $("#btn4"));
        }
    }
    function projectChange(value) {

        getDataList();

    }

    function fillPaf(info){

        if(info !== undefined){
            $("#newPafNo").val(info.pafId);
            $("#newPafFramework").val(info.frameworkName);
            $("#newVersion").val(info.versionsNo);
            $("#newPafName2").val(info.pafNameChi);
            $("#newPafEnName").val(info.pafName);
            $("#newPafBpwinNo").val(info.bpwinNo);
        }else{
            $("#newPafNo").val('');
            $("#newPafFramework").val('');
            $("#newVersion").val('');
            $("#newPafName2").val('');
            $("#newPafEnName").val('');
            $("#newPafBpwinNo").val('');
        }
    }
    function pafNameChange(value) {
        //下拉框联动

        var projectId = $("#project").val();
        var option = $("#pafList").find("option[value='"+value+"']");
        //当前项目被选
        if (projectId !== undefined && projectId !=="0" && value !== ""){
           //查得到打出来的字的option
           if(option.length !== 0){
               var info = JSON.parse(option.attr("info"));
               fillPaf(info);

           }else{
               fillPaf();

           }



        }else{

            //当前项目没别选
            if(option.length !== 0){
                var info = JSON.parse(option.attr("info"));
                fillPaf(info);
                //反选项目
                $("#project").val(info.projectId);
                //反选后重新帅选datalist的数据为该项目下的所有paf
                getAllDataList(pfList[info.projectId],1);

            }else{
                fillPaf();

            }


        }

    }
    $("#downVsd").click(function(){
        var pafId = $('#newPafNo').val();
        var visioVersion = $('#visioVersion').val();
        var project = $('#project').val()
            $.ajax({
                url: '${basePath}newOnePAFEdition.do?action=checkDownload&pafId='+pafId+"&pafVisioVersion="+visioVersion+"&projectId="+project,
                type: 'POST',
                dataType: "json",
                contentType: false,
                success: function (data) {
                    if (data.code === 200) {
                        $('#downVsd2').attr('href', '${basePath}newOnePAFEdition.do?action=downloadVisioFile&pafId='+pafId+"&pafVisioVersion="+visioVersion+"&projectId="+project);
                        $('#downVsd2')[0].click();
                    } else {
                        Showbo.Msg.alert(data.msg);
                    }
                },
                error: function () {
                    Showbo.Msg.alert("下载失败")
                }
            })
    });
    //上传visio
    $("#newPafUploadVsd").click(function(){
        var file = $('#PafVsdFile').get(0).files[0];
        if(file === undefined){
            Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.07"/>");
            return;
        }
        var boo = compareVersion();
        if(!boo){
            Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.02"/>");
            return;
        }


        var project = $('#project').val();
        var pafId = $('#newPafNo').val();
        var visioVersion = $('#visioVersion').val();

        var visioVersionFlag = getLatestVisioVersion(project,pafId,visioVersion);
        if (visioVersionFlag===1){
            Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.02"/>");
            return;
        }



        var formData = new FormData();
        formData.append("visioFile", file); //需要上传的文件
        formData.append("projectId", project);
        formData.append("pafId", pafId);
        formData.append("pafVisioVersion", visioVersion);
        formData.append("oldPafVisioVersion", oldPafVisioVersion);
        // formData.forEach(function (value,key) {
        //     console.info(key+" : "+value);
        // });
        if ("undefined" != typeof(file) && file != null && file != "") {
            $.ajax({
                url: '${basePath}newOnePAFEdition.do?action=uploadFRAPafVsb',
                type: 'POST',
                data: formData,
                cache: false,
                contentType: false, //不设置内容类型
                processData: false, //不处理数据
                success: function (data) {
                    if (data.code === 200) {
                        $('#newVisio').val(data.data.visioName);
                        $('#lastUpdate').val(data.data.lastUpdate);
                        $('#PafVsdFile').val('');
                        oldPafVisioVersion = visioVersion;
                        formSerial = $("#newFormData").serialize();
                        Showbo.Msg.alert(data.msg);

                    } else {
                        Showbo.Msg.alert(data.msg);
                    }
                },
                error: function () {
                    Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.09"/>");
                }
            })
        } else {
            Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.10"/>");
        }
    });

    function openPafDoc() {
        $('#PafVsdFile').click();
    }

    function pafOnChange(Tag) {
        var value1;
        if ($(Tag).val() != "") {
            value1 = $(Tag).val();
            $('#newVisio').val(value1);
            //截取visio版本号
            var visioversion = value1.substring(value1.lastIndexOf(".")-2,value1.lastIndexOf("."));
            //console.log("visio="+visioversion)
            var reg = /^[0-9]{2}$/;
            if(reg.test(visioversion)){
                $("#visioVersion").val(visioversion)

            }else{
                Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.11"/>");
                $("#newVisio").val("");
                $("#PafVsdFile").val("");
                $("#visioVersion").val("");
            }
            $("#visioVersion").removeClass("error");



        }

    }

    function getLatestVisioVersion(project,pafId,visioVersion) {
        var visioVersionFlag = 0;
        $.ajax({
            url:"newOnePAFEdition.do?action=getLatestVisioVersion",
            type: 'POST',
            data:{projectId:project,pafId:pafId},
            async:false,
            success:function (data) {
                if (data!=="" && parseInt(visioVersion.toString())<parseInt(data.toString())) {
                    visioVersionFlag =1;
                }

            },
            error:function () {
                Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.08"/>");

            }

        });
        return visioVersionFlag;

    }

    function checkVisioVersion(){
        var version1 = $("#visioVersion").val();

        var reg = /^[0-9]{2}$/;
        if (!reg.test(version1)) {
            $("#visioVersion").val("");
        }

        var value1 = $("#newVisio").val();
        var version2 = value1.substring(value1.lastIndexOf(".")-2,value1.lastIndexOf("."));
        // console.log(version2);
        // 先判断Visio 文档框有没有值
        var file = $('#PafVsdFile').get(0).files[0];
        var visioValue = $("#newVisio").val();
        if (version1 !== version2 && visioValue!==""){
            Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.12"/>");
            $("#visioVersion").addClass("error")
        }else{
            $("#visioVersion").removeClass("error")
        }
    }



    function getAllDataList(obj,type){
        $("#pafList").empty();  //清除datalist里面的数据
        //var html= "";
        if (type === undefined){

            for(var i in obj){
                var list = obj[i];
                for(var j = 0;j <list.length;j++){
                    var chiValue = list[j].pafNameChi === undefined?"":"("+list[j].pafNameChi+")";
                    //var value = list[j].pafName + chiValue + list[j].projectName;
                    var value = list[j].pafName + chiValue;
                    var option = "<option value='"+value+"' idInfo='"+list[j].pafId+"'>"+value+"</option>";
                    var Joption = $(option);
                    Joption.attr("info",JSON.stringify(list[j]));
                    $("#pafList").append(Joption);
                }
            }
        }else{
            for(var j = 0 ; j < obj.length; j++){
                var chiValue = obj[j].pafNameChi === undefined?"":"("+obj[j].pafNameChi+")";
                // var value = obj[j].pafName + chiValue + obj[j].projectName;
                var value = obj[j].pafName + chiValue;
                var option = "<option value='"+value+"' idInfo='"+obj[j].pafId+"'>"+value+"</option>";
                var Joption = $(option);
                Joption.attr("info",JSON.stringify(obj[j]));

                $("#pafList").append(Joption);

            }

        }


    }


    function getDataList(){

        //清空之前datalist的input框的值
        //console.info( $("input[list='pafList']"));
        $("input[list='pafList']").val("");


        var projectId = $("#project").val();
        //选出该project 的所有frameworkPaf
        if(projectId !== undefined && projectId !== "0"){
            //console.info(pfList[projectId]);
            getAllDataList(pfList[projectId],1);
        }else{
            //选出所有project 的frameworkPaf
            getAllDataList(pfList);
        }
    }

    var toback = 0;
    function todoBack(){
        var currSerial = $("#newFormData").serialize();
        if (currSerial=== formSerial){
            doBack();
        }else{
            Showbo.Msg.confirm("<spring:message code='message.common.45'/>","",function () {
                toback = 1;
                if(!$("#btn1").hasClass("after")){
                    $("#btn1").click();
                }else if(!$("#btn2").hasClass("after")){
                    $("#btn2").click();
                }else if(!$("#btn3").hasClass("after")){
                    $("#btn3").click();
                }else if(!$("#btn4").hasClass("after")){
                    $("#btn4").click();
                }
            },function () {
                doBack();
            })
        }
    }


    function editPVV(){
        //编辑时，设置项目和PAF名称不可编辑
        setDisabled();

        //隐藏遮罩
        $(".wrapper").addClass('hidden');
        //隐藏点击的按钮
        $("#editPVV").addClass('hidden');
        var status = "${fvp.status}";
        if (status==="確認設計"){
            //只可以修改设计人和备注
            $("#newVisio").removeAttr("onclick");
            $("#newVisio").addClass("yellow");

            $("#newPafUploadVsd").unbind("click");

            $("#visioVersion").attr("readonly","readonly");
            $("#visioVersion").addClass("yellow cont_num_en");

        }
    }
    
    function deletePVV(project,pafId,pafVisioVersion) {
        if (oldPafVisioVersion!=$("#visioVersion").val()){
            //点击了上传文件，但文件还未上传。还是删除原来版本的数据（无需考虑）
        }
        var status ='${fvp.status}';
        //隐藏遮罩
        $(".wrapper").addClass('hidden');
        if (status==="已分派"||status==="編碼中"||status==="已編碼"||status==="已提交"){
            Showbo.Msg.alert("<spring:message code="paf.newOnePafEdition.js.13"/>");  //不是阻塞式弹出框
            return;
        }

        Showbo.Msg.confirm("是否删除数据","",function () {

            $.ajax({
                url:"searchOnePAFEdition.do?action=deleteOnePAFEdition",
                type: 'POST',
                data:{projectId:project,pafId:pafId,pafVisioVersion:oldPafVisioVersion},
                success:function (data) {
                    if (data.code === 200) {
                        Showbo.Msg.alert(data.msg);
                        //window.location.reload();//强制刷新
                        //成功删除数据之后，跳转到检式页面
                        window.location.href="${basePath}searchPAFEditionList.do";
                    }else {
                        Showbo.Msg.alert(data.msg);

                    }


                },
                error:function () {
                    Showbo.Msg.alert("失败");

                }

            });

        },function () {
            //点击否的时候，把遮罩添加上
            if (!$("#editPVV").hasClass("hidden")){
                $(".wrapper").removeClass('hidden');
            }

        });

        
    }

    //设置项目和PAF名称不可编辑
    function setDisabled() {
        $("#project").attr("disabled","disabled");
        $("#project").addClass("yellow");

        $("#pafName").attr("readonly","readonly");
        // $("#pafName").addClass("yellow cont_num_en");
        $("#pafName").addClass("yellow");

    }





</script>

</body>
</html>
