<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath() + "/";
    request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <jsp:include page="../includestatic.jsp"/>
</head>
<script type="text/javascript" src="<%=basePath %>jedate/jedate.js"></script>

<body>
<jsp:include page="../menu.jsp"/>
<form id="formData" enctype="multipart/form-data" onclick="getOldMenu()">

    <div class="cont">
        <table class="assign_tab add_tab" id="pafTable" border="0px" cellpadding="0" cellspacing="0" width="98%">
            <tr>
                <th>
                    <label><spring:message code="paf.assignPAF.pafProject"/></label>
                    <span data-text='col'></span>
                </th>
                <td style="width:280px">

                    <input id="projectId" list="projectData"  project-id="${pafVisioVersionVo.projectId}" value="${pafVisioVersionVo.projectVo.projectName}"
                           onchange="changeProject(this)" style="width:180px"/>

                    <dataList id="projectData">
                       <option value="" />
                        <c:forEach var="projectData" items="${projectDataList}">
                            <option value="${projectData.projectVos.projectName}"
                                project-id ="${projectData.projectId}"
                            />
                        </c:forEach>
                    </dataList>

                </td>
                <th style="vertical-align:top">
                    <label><spring:message code='paf.assignPAF.selectPAF'/></label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input id="pafEngName" list="pafListData"  project-id="" value="" paf-id=""
                           onchange="changePaf(this)" style="width:180px"/>
                    <dataList id="pafListData">
                        <option value="" />
                        <c:forEach var="pafData" items="${pafVisioVersionVoList}">
                            <option value="${pafData.frameworkVersionPafVO.pafName}" project-id="${pafData.projectId}"   paf-id="${pafData.pafId}"
                            />
                        </c:forEach>
                    </dataList>
                </td>
                <th>
                    <label><spring:message code='paf.assignPAF.selectVersion'/></label>
                    <span data-text='col'></span>
                </th>
                <td>

                    <select id="pafVisioVersion" maxlength="15"  name="pafVisioVersion" class="tr" style="width:185px"
                                 onchange="changeVisioVersion(this)" value="${pafVisioVersionVo.pafVisioVersion}">
                    </select>
                </td>
            </tr>

            <tr>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.pafNumber"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="pafId" name="pafId" class="yellow"
                           value="${pafVisioVersionVo.pafId}" maxlength="20" style="width:180px;"/>
                </td>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.pafFramework"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="frameworkName" name="frameworkName" class="yellow"
                           value="${pafVisioVersionVo.frameworkVo.frameworkName}" maxlength="12" style="width:180px;"/>
                </td>
                <th class="td">
                <label>
                    <spring:message code="paf.assignPAF.pafVersion"/>
                </label>
                <span data-text='col'></span>
            </th>
                <td>
                    <input type="text" readonly="readonly" id="versionsNo" name="versionsNo" class="yellow"
                           value="${pafVisioVersionVo.frameworkVersionPafVO.versionsNo}" maxlength="12" style="width:180px;"/>
                </td>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.pafStatus"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="status" name="status" class="yellow"
                           value="${pafVisioVersionVo.status}" maxlength="12" style="width:180px;"/>
                </td>
            </tr>

            <tr>
                <th>
                    <label>
                        <div class="label_en"><spring:message code="paf.assignPAF.pafName"/></div>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="pafNameChi" name="pafNameChi" class="yellow"
                           value="${pafVisioVersionVo.frameworkVersionPafVO.pafNameChi}" maxlength="20" style="width:180px;"/>
                </td>
                <th>
                    <label><spring:message code='paf.assignPAF.designer'/></label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="designBy" name="designBy" class="yellow"
                           value="${pafVisioVersionVo.designBy}" maxlength="20" style="width:180px;"/>
                </td>
                <th>
                    <label><spring:message code='paf.assignPAF.pafBpwinNo'/></label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="bpwinNo" name="bpwinNo" class="yellow"
                           value="${pafVisioVersionVo.frameworkVersionPafVO.bpwinNo}" maxlength="20" style="width:180px;"/>
                </td>
            </tr>

            <tr>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.pafEngName"/>

                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="pafName" name="pafName" class="yellow"
                           value="${pafVisioVersionVo.frameworkVersionPafVO.pafName}" maxlength="20" style="width:250px;"/>
                </td>
                <th >
                    <label>
                        <spring:message code="paf.assignPAF.developer"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="englishName" name="englishName" class="yellow"
                           value="${pafVisioVersionVo.englishName}" maxlength="20" style="width:120px;"/>
                </td>
                <th >
                    <label>
                        <spring:message code="paf.assignPAF.pafRemarks"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td rowspan="2">
                    <div>
                        <textarea rows="3" class="yellow" readonly="readonly" id="remarkAssign" name="remarkAssign" style="width: 185px" >${pafVisioVersionVo.remarkAssign}</textarea>
                    </div>

                </td>
            </tr>

            <tr>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.assignTime"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text"  id="assignDate"  name="assignDate" class="yellow" readonly="readonly"
                           value="${pafVisioVersionVo.assignDate}" maxlength="12" style="width:100px;float: left"/>
                    <span id="assignDay" style="font-size: 18px;display: inline-block;line-height: 32px;vertical-align: middle;float: left"></span>
                </td>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.estimateCompleteHour"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td >
                    <input type="text" id="estDuration" readonly="readonly" class="yellow" name="estDuration" oninput="value=value.replace(/[^\d]/g,'')"
                           value="${pafVisioVersionVo.estDuration}" maxlength="12" style="width:160px;"/>
                    <span style="font-size: 19px;display: inline-block;line-height: 32px;vertical-align: middle">
                        (小時)</span>
                </td>
            </tr>

            <tr>
                <th>
                    <label>
                        <spring:message code="paf.newPafSubmit.submitStartDate"/>
                        <span data-text='asterisk'></span>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input id="startDD" onchange="chengDD(this)" placeholder="d-1"  style="width: 80px;float: left;margin-right: 4px"/>
                    <input type="text"  id="submitStartDate" name="submitStartDate" class="calendar_bg fl" readonly="readonly"
                           value="${pafVisioVersionVo.submitStartDate}" maxlength="12" style="width:100px;"/>
                    <span id="submitStartDay" style="font-size: 18px;display: inline-block;line-height: 32px;vertical-align: middle;margin-left: 2px"></span>

                </td>
                <th>
                    <label>
                        <spring:message code="paf.newPafSubmit.actualDuration"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td >
                    <input type="text" id="actualDuration" name="actualDuration" oninput="value=value.replace(/[^\d]/g,'')"
                           value="${pafVisioVersionVo.actualDuration}" maxlength="12" style="width:160px;"/>
                    <span style="font-size: 19px;display: inline-block;line-height: 32px;vertical-align: middle">
                        (小時)</span>
                </td>
                <!-- 提交备注-->
                <th>
                    <label>
                        <spring:message code="paf.newPafSubmit.remarkSubmit"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td rowspan="2">
                    <div>
                        <textarea rows="3"  id="remarkSubmit" name="remarkSubmit" style="width: 185px" >${pafVisioVersionVo.remarkSubmit}</textarea>
                    </div>

                </td>
            </tr>

            <tr>
                <th>
                    <label>
                        <spring:message code="paf.newPafSubmit.submitDate"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input id="submitDD" onchange="chengDD(this)" placeholder="d-1"  style="width: 80px;float: left;margin-right: 4px"/>
                    <input type="text"  id="submitDate" name="submitDate" class="calendar_bg fl" readonly="readonly"
                           value="${pafVisioVersionVo.submitDate}" maxlength="12" style="width:100px;"/>
                    <span id="submitDay" style="font-size: 18px;display: inline-block;line-height: 32px;vertical-align: middle;margin-left: 2px"></span>

                </td>
            </tr>

        </table>
        <br><br>

    </div>


    <div style="position: fixed;bottom:36px; left:135px; z-index: -1;">

        <sam:Button accessControl="Y" dim="N" id="submit_save" btnName="new_paf_submit_save" onclick="updatePaf(0)"
                    altKey="button.common.save"/>
        <sam:Button accessControl="Y" id="submit_code" dim="N" btnName="new_paf_submit_code" onclick="updatePaf(1)"
                    altKey="button.common.code"/>
        <sam:Button accessControl="Y" id="submit_submit" dim="N" btnName="new_paf_submit_submit" onclick="updatePaf(2)"
                    altKey="button.common.submit"/>


    </div>
</form>

</body>

<script type="text/javascript">

    var pafVisioVersionVoList = JSON.parse('${pafVisioVersionVoListJson}');
    var visioVersionAll = JSON.parse('${visioVersionAll}');
    var projectDataListJson = JSON.parse('${projectDataListJson}');

    //获取当前时间，格式YYYY/MM/DD
    function getNowFormatDate() {
        var date = new Date();
        var seperator = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9){
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator + month + seperator + strDate;
        return currentdate;
    }

    $(document).ready(function () {

        if ('${pafVisioVersionVo.pafId}'){
            //paf 下拉框赋值
            $("#pafListData").find("option").remove();
            $("#pafListData").append("<option value=''></option>");
            for(var i in pafVisioVersionVoList){
                if(pafVisioVersionVoList[i].projectId == '${pafVisioVersionVo.projectId}'){
                    var vo = pafVisioVersionVoList[i];
                    $("#pafListData").append("<option value="+vo.frameworkVersionPafVO.pafName+" project-id="+vo.projectId+ " paf-id="+vo.pafId+"/>");
                }
                if(pafVisioVersionVoList[i].projectId == '${pafVisioVersionVo.projectId}' && pafVisioVersionVoList[i].pafId == '${pafVisioVersionVo.pafId}'){
                    var vo = pafVisioVersionVoList[i];
                    $("#pafEngName").val(vo.frameworkVersionPafVO.pafName);
                    $("#pafEngName").attr("project-id",'${pafVisioVersionVo.projectId}');
                    $("#pafEngName").attr("paf-id",'${pafVisioVersionVo.pafId}');
                }
            }
            //版本下拉框赋值
            for (var j in visioVersionAll){
                if (visioVersionAll[j].pafId == '${pafVisioVersionVo.pafId}' &&
                    visioVersionAll[j].projectId == '${pafVisioVersionVo.projectId}') {
                    $("#pafVisioVersion").append("<option value="+visioVersionAll[j].pafVisioVersion+">"+visioVersionAll[j].pafVisioVersion+"</option>");
                }
            }

            $("#pafVisioVersion").find("option[value='${pafVisioVersionVo.pafVisioVersion}']").attr("selected","selected")
        } else{
            $("#assignBy").find("option[value='${sessionScope.currUser.userCode}']").attr("selected","selected")
        }
        btnControl()
        changeDate();
    });


    function changeProject(el){
        var projectData = $(el).val().trim();
        var project_id = $("#projectData").find("option[value='"+projectData+"']").attr("project-id");
        $("#projectId").attr("project-id",project_id);
        $("#pafTable").find("input[list!='projectData'][id!='pafEngName'],select,textarea").val("");
        $("#pafListData").find("option").remove();
        $("#pafListData").append("<option value=''></option>");
        $("#pafVisioVersion").empty();
        if (project_id) {
            for(var i in pafVisioVersionVoList){
                if(pafVisioVersionVoList[i].projectId==project_id){
                    var vo = pafVisioVersionVoList[i];
                    $("#pafListData").append("<option value="+vo.frameworkVersionPafVO.pafName+" project-id="+vo.projectId + " paf-id="+vo.pafId+"/>");
                }
            }
        }else{
            for(var i in pafVisioVersionVoList){
                var vo = pafVisioVersionVoList[i];
                $("#pafListData").append("<option value="+vo.frameworkVersionPafVO.pafName+" project-id="+vo.projectId+ " paf-id="+vo.pafId+"/>");
            }
            $("#pafTable").find("input,select,textarea").val("");
        }
        btnControl();
        changeDate();
    }

    function changePaf(el){
        var pafEngName = $("#pafEngName").val();
        if (!pafEngName) {
            //清空数据
            $("#pafTable").find("input[id!=projectId],select,textarea").val("");
            $("#pafVisioVersion").empty();
            btnControl();
            changeDate();
            return;
        }
        var projectId = $("#pafListData").find("option[value="+pafEngName+"]").attr("project-id");
        var pafId = $("#pafListData").find("option[value="+pafEngName+"]").attr("paf-id");
        $("#pafVisioVersion").empty();
        if (pafId) {
            for(var i in pafVisioVersionVoList){
            if(pafVisioVersionVoList[i].pafId==pafId && pafVisioVersionVoList[i].projectId == projectId){
                var vo = pafVisioVersionVoList[i];
                //版本下拉框赋值
                for (var j in visioVersionAll){
                    if (visioVersionAll[j].pafId == vo.pafId && visioVersionAll[j].projectId == vo.projectId) {
                        $("#pafVisioVersion").append("<option value="+visioVersionAll[j].pafVisioVersion+">"+visioVersionAll[j].pafVisioVersion+"</option>");
                    }
                }
                var $table = $("#pafTable").find("input[id!='pafEngName'],select,textarea");
                $.each($table,function(){
                    var $this = $(this);
                    var name = $this.attr("name");
                    $.each(vo,function(key,value){
                        if (name == key){
                            $this.val(value);
                        }
                        if (key == "frameworkVersionPafVO"){
                            $.each(vo[key],function(key,value){
                                if (name == key){
                                    $this.val(value);
                                }
                            })
                        }
                        if (key == "frameworkVo"){
                            $.each(vo[key],function(key,value){
                                if (name == key){
                                    $this.val(value);
                                }
                            })
                        }
                    })

                })
                break;
            }
          }
            //给选择项目赋值
            for (var k in projectDataListJson){
                if (projectDataListJson[k].projectId == projectId){
                    var vo = projectDataListJson[k];
                    $("#projectId").attr("project-id",projectId);
                    $("#projectId").val(vo.projectVos.projectName);
                    break;
                }
            }
        }else{
            //清空数据
             $("#pafTable").find("input[id!=projectId],select,textarea").val("");
        }
        btnControl();
        changeDate();
    }

    function changeVisioVersion(el){
        var pafId = $("#pafId").val();
        var projectId = $("#projectId").attr("project-id");
        var thisVal = $(el).val();
        for (var j in visioVersionAll){
            if (visioVersionAll[j].pafId == pafId && visioVersionAll[j].projectId == projectId
              && visioVersionAll[j].pafVisioVersion == thisVal) {
                $("#designBy").val(visioVersionAll[j].designBy);
                $("#status").val(visioVersionAll[j].status);
                $("#remarkAssign").val(visioVersionAll[j].remarkAssign);
                $("#englishName").val(visioVersionAll[j].englishName);
                $("#assignBy").val(visioVersionAll[j].assignBy);
                $("#assignDate").val(visioVersionAll[j].assignDate);
                $("#estDuration").val(visioVersionAll[j].estDuration);
                $("#submitStartDate").val(visioVersionAll[j].submitStartDate);
                $("#actualDuration").val(visioVersionAll[j].actualDuration);
                $("#submitDate").val(visioVersionAll[j].submitDate);
                $("#remarkSubmit").val(visioVersionAll[j].remarkSubmit);
            }
        }
        btnControl();
        changeDate()
    }

    jeDate({
        dateCell:"#submitStartDate",
        format:"YYYY/MM/DD",
        maxDate:getNowFormatDate(),
        choosefun:function(){
            changeDate()
        }
    })
    jeDate({
        dateCell:"#submitDate",
        format:"YYYY/MM/DD",
        maxDate:getNowFormatDate(),
        choosefun:function(){
            changeDate()
        }
    })

    //選擇時間后的觸發事件
    function changeDate(){
        var assignDate = $("#assignDate").val();
        var submitStartDate =$("#submitStartDate").val()
        var submitDate = $("#submitDate").val();
        if (assignDate){
            $("#assignDay").html(returnDay(assignDate));
        }else{
            $("#assignDay").html("");
        }

        if (submitStartDate){
            $("#submitStartDay").html(returnDay(submitStartDate));
            var iDays = Math.floor(Math.abs(Date.parse(getNowFormatDate()) - Date.parse(submitStartDate)) / (24 * 3600 * 1000));
            if (iDays == 0){
                $("#startDD").val("d");
            } else{
                $("#startDD").val("d-"+iDays);
            }
        }else{
            $("#submitStartDay").html("");
            $("#startDD").val("");
        }

        if (submitDate) {
            $("#submitDay").html(returnDay(submitDate));
            var iDays = Math.floor(Math.abs(Date.parse(submitDate)-Date.parse(getNowFormatDate())) / (24 * 3600 * 1000));
            if (iDays == 0){
                $("#submitDD").val("d");
            } else{
                $("#submitDD").val("d-"+iDays);
            }
        }else{
            $("#submitDay").html("");
            $("#submitDD").val("");
        }

    }

    //保存PAf時字段驗證 num 0-保存，1-編碼 ，2-提交
    function checkSave(num) {
        var submitStartDate = $("#submitStartDate").val();
        var projectId = $("#projectId").val();
        var pafId = $("#pafId").val();
        var pafVisioVersion = $("#pafVisioVersion").val();
        var submitDate =$("#submitDate").val();
        var actualDuration = $("#actualDuration").val();
        if(!projectId){
            Showbo.Msg.alert("請選擇項目！");
            return false;
        }
        if(!pafId){
            Showbo.Msg.alert("請選擇PAF！");
            return false;
        }
        if(pafVisioVersion == null || pafVisioVersion == ""){
            Showbo.Msg.alert("請選擇版本！");
            return false;
        }
        if(submitStartDate == null || submitStartDate == ""){
            Showbo.Msg.alert("開始時間不能爲空！");
            return false;
        }
        if (Date.parse(submitStartDate) < Date.parse($("#assignDate").val())) {
            Showbo.Msg.alert("開始時間必須大於分派時間！");
            return false;
        }
        if (num == 2 && (submitDate == null || submitDate == "")){
            Showbo.Msg.alert("提交時間不能爲空！");
            return false;
        }
        if (num == 2 && (actualDuration == null || actualDuration == "")){
            Showbo.Msg.alert("完成時長不能爲空！");
            return false;
        }
        if (submitDate && Date.parse(submitDate) < Date.parse(submitStartDate)) {
            Showbo.Msg.alert("提交時間必須大於開始時間！");
            return false;
        }

        return true;
    }


    // num 0-保存，1-編碼 ，2-提交
    function updatePaf(num){
        var status = $("#status").val();
        var check = checkSave(num);
        if(check){
            if (num == 0){
                if (status == "已分派") {
                    $("#status").val("編碼中")
                }
            }else if(num == 1){
                $("#status").val("已編碼")
            }else if(num == 2){
                $("#status").val("已提交")
            }
            var formData = $("#formData").serialize()+"&projectId="+$("#projectId").attr("project-id");
            console.info(formData);
            $.ajax({
                url: "${basePath}newPafSubmit.do?action=update",
                type: 'post',
                async:false,
                data:formData ,
                success: function(data){
                    var message;
                    if(data){
                        message = "成功";
                        Showbo.Msg.alert(message,function(){
                            var pafId = $("#pafId").val()
                            var projectId = $("#projectId").attr("project-id");
                            var pafVisioVersion = $("#pafVisioVersion").val();
                            window.location.href="${basePath}newPafSubmit.do?pafId="+pafId+"&projectId="+projectId+"&pafVisioVersion="+pafVisioVersion;
                        });
                    }else{
                        message = "失敗,請聯係管理員";
                        Showbo.Msg.alert(message);
                    }

                },
                error: function(){
                    console.log("assign failure");
                    $("#status").val(status);
                }
            });
        }
    }

    function chengDD(el){
        var val = $(el).val();
        var id = $(el).attr("id");
        var dayText = "";
        var day ="";
       if (val){
           if (val == "d"){
               day = getNowFormatDate();
               dayText = returnDay(getNowFormatDate());
           } else{
               if (val.substr(0,2) =="d-" && isNumber(val.substr(2,val.length))){
                   day = GetDateStr(val.substr(2,val.length));
                   dayText = returnDay(day);
               }
           }
       }
        if (id == "submitDD") {
            $("#submitDate").val(day);
            $("#submitDay").html(dayText);
        }
        if(id == "startDD"){
            $("#submitStartDate").val(day);
            $("#submitStartDay").html(dayText);
        }
    }

    //根据日期返回周几
    function returnDay(day) {
        var weekDay = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];
        var myDate = new Date(Date.parse(day));
        return weekDay[myDate.getDay()];
    }

    function GetDateStr(AddDayCount) {
        var dd = new Date();
        dd.setDate(dd.getDate()-AddDayCount);//获取AddDayCount天前的日期
        var y = dd.getFullYear();
        var m = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);//获取当前月份的日期，不足10补0
        var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate();//获取当前几号，不足10补0
        return y+"/"+m+"/"+d;
    };

    //按鈕控制
    function btnControl(){
        var status = $("#status").val();
        if (status == "已分派"){
            //true 是不可点击  false 是可以点击
            BottonIFWhether(false,$("#submit_save"));
            BottonIFWhether(true,$("#submit_code"));
            BottonIFWhether(true,$("#submit_submit"));
        }else if(status == "編碼中"){
            BottonIFWhether(false,$("#submit_save"));
            BottonIFWhether(false,$("#submit_code"));
            BottonIFWhether(true,$("#submit_submit"));
        }else if(status == "已編碼"){
            BottonIFWhether(false,$("#submit_save"));
            BottonIFWhether(true,$("#submit_code"));
            BottonIFWhether(false,$("#submit_submit"));
        }else{
            BottonIFWhether(true,$("#submit_save"));
            BottonIFWhether(true,$("#submit_code"));
            BottonIFWhether(true,$("#submit_submit"));
        }
    }

</script>
</html>
