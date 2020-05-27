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

                    <c:if test="${ !empty pafVisioVersionVo.pafId}">
                        <input id="projectId" list="projectData"  project-id="${pafVisioVersionVo.projectId}" value="${pafVisioVersionVo.projectVo.projectName}"
                               onchange="changeProject(this)" style="width:180px"/>
                    </c:if>
                    <c:if test="${empty pafVisioVersionVo.pafId}">
                        <input id="projectId" list="projectData"  project-id="" value=""
                               onchange="changeProject(this)" style="width:180px"/>
                    </c:if>
                    <dataList id="projectData">
                       <option value="" />
                        <c:forEach var="projectData" items="${projectDataList}">
                            <option value="${projectData.projectVos.projectName}"
                                project-id ="${projectData.projectId}"
                            />
                        </c:forEach>
                    </dataList>

                </td>
                <th  style="vertical-align:top">
                    <label><spring:message code='paf.assignPAF.selectPAF'/></label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <sam:select id="pafId" maxlength="15"   name="pafId" class="tr" style="width:185px"
                                dropdownName="getPafVisioVersionVoAllByStatus" onchange="changePaf(this)"
                                plsSelectText="nwp.contact.informat.region" where="assign" value="${pafVisioVersionVo.pafId}"/>

                </td>
                <th >
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
                <th >
                    <label>
                        <spring:message code="paf.assignPAF.pafNumber"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="pafNumber" name="pafNumber" class="yellow"
                           value="${pafVisioVersionVo.pafId}" maxlength="20" style="width:180px;"/>
                </td>
                <th >
                    <label>
                        <spring:message code="paf.assignPAF.pafFramework"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="frameworkName" name="frameworkName" class="yellow"
                           value="${pafVisioVersionVo.frameworkVo.frameworkName}" maxlength="12" style="width:180px;"/>
                </td>
                <th>
                <label>
                    <spring:message code="paf.assignPAF.pafVersion"/>
                </label>
                <span data-text='col'></span>
            </th>
                <td>
                    <input type="text" readonly="readonly" id="versionsNo" name="versionsNo" class="yellow"
                           value="${pafVisioVersionVo.frameworkVersionPafVO.versionsNo}" maxlength="12" style="width:180px;"/>
                </td>
                <th >
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
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.developer"/>
                        <span data-text='asterisk'></span>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <sam:select id="codeBy" maxlength="15"  name="codeBy" class="tr" style="width:120px"
                                dropdownName="getuserBygroupCode" where="CODER"
                                plsSelectText="nwp.contact.informat.region" value="${pafVisioVersionVo.codeBy}"/>
                </td>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.pafRemarks"/>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td rowspan="2">
                    <div>
                        <textarea rows="3" cols="" id="remarkAssign" name="remarkAssign" style="width: 185px" >${pafVisioVersionVo.remarkAssign}</textarea>
                    </div>

                </td>
            </tr>
            <%-- 開發人員	提交時間 --%>
            <tr>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.assignTime"/>
                        <span data-text='asterisk'></span>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <input id="dd" onchange="chengDD(this)" placeholder="d-1"  style="width: 80px;float: left;margin-right: 4px"/>
                    <input type="text"  id="assignDate" name="assignDate" class="calendar_bg fl" readonly="readonly"
                           value="${pafVisioVersionVo.assignDate}" maxlength="12" style="width:100px;"/>
                    <span id="day" style="font-size: 18px;display: inline-block;line-height: 32px;vertical-align: middle;margin-left: 2px"></span>
                </td>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.estimateCompleteHour"/>
                        <span data-text='asterisk'></span>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td >
                    <input type="text" id="estDuration" name="estDuration" oninput="value=value.replace(/[^\d]/g,'')"
                           value="${pafVisioVersionVo.estDuration}" maxlength="12" style="width:160px;"/>
                    <span style="font-size: 19px;display: inline-block;line-height: 32px;vertical-align: middle">
                        (小時)</span>
                </td>
            </tr>

            <tr>
                <th>
                    <label>
                        <spring:message code="paf.assignPAF.assignRen"/>
                        <span data-text='asterisk'></span>
                    </label>
                    <span data-text='col'></span>
                </th>
                <td>
                    <sam:select id="assignBy" maxlength="15"  name="assignBy" class="tr" style="width:120px"
                                dropdownName="getuserBygroupCode" where="SA"
                                plsSelectText="nwp.contact.informat.region" value="${pafVisioVersionVo.assignBy}"/>
                </td>

            </tr>

        </table>
        <br><br>

    </div>


    <div style="position: fixed;bottom:36px; left:135px; z-index: -1;">

        <sam:Button accessControl="Y" dim="N" btnName="new_paf_assign_save" onclick="saveOrAssignPaf(0)"
                    altKey="button.common.save"/>
        <sam:Button accessControl="Y" id="fen_pai" dim="N" btnName="new_paf_assign_assign" onclick="saveOrAssignPaf(1)"
                    altKey="button.common.assign"/>


    </div>
</form>

</body>

<script type="text/javascript">

    var pafVisioVersionVoList = JSON.parse('${pafVisioVersionVoList}');
    var visioVersionAll = JSON.parse('${visioVersionAll}');
    var projectDataListJson = JSON.parse('${projectDataListJson}');

    //获取当前时间，格式YYYY-MM-DD
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
        var nowDate = getNowFormatDate();
        var test = $("#assignDate").val();
        if(test == ""||test==null);
        {
            $("#assignDate").val(nowDate);
        }

        if ('${pafVisioVersionVo.pafId}'){
            //paf 下拉框赋值
            $("#pafId").empty();
            $("#pafId").append("<option value='0'></option>");
            for(var i in pafVisioVersionVoList){
                if(pafVisioVersionVoList[i].projectId == '${pafVisioVersionVo.projectId}'){
                    var vo = pafVisioVersionVoList[i];
                    $("#pafId").append("<option value="+vo.pafId+" projectId="+vo.projectId+">"+vo.frameworkVersionPafVO.pafName+"</option>");
                }
            }
            //版本下拉框赋值
            for (var j in visioVersionAll){
                if (visioVersionAll[j].pafId == '${pafVisioVersionVo.pafId}' &&
                    visioVersionAll[j].projectId == '${pafVisioVersionVo.projectId}') {
                    $("#pafVisioVersion").append("<option value="+visioVersionAll[j].pafVisioVersion+">"+visioVersionAll[j].pafVisioVersion+"</option>");
                }
            }
            $.each($("#pafId").find("option"),function(){
                if ($(this).attr("value") == '${pafVisioVersionVo.pafId}' && $(this).attr("projectId") == '${pafVisioVersionVo.projectId}') {
                    $(this).attr("selected","selected");
                }

            });
            $("#pafVisioVersion").find("option[value='${pafVisioVersionVo.pafVisioVersion}']").attr("selected","selected")
        } else{
            $("#assignBy").find("option[value='${sessionScope.currUser.userCode}']").attr("selected","selected")
        }

        if($("#status").val() != "確認設計"){
            BottonIFWhether(true, $("#fen_pai"));  //true 是不可点击  false 是可以点击
        }
        changeAssignDate();
    });


    function changeProject(el){
        var projectData = $(el).val().trim();
        var project_id = $("#projectData").find("option[value='"+projectData+"']").attr("project-id");
        $("#projectId").attr("project-id",project_id);
        $("#pafTable").find("input[list!='projectData'],select,textarea").val("");
        $("#pafId").empty();
        $("#pafVisioVersion").empty();
        $("#pafId").append("<option value='0'></option>");
        $("#pafVisioVersion").empty();
        if (project_id) {
            for(var i in pafVisioVersionVoList){
                if(pafVisioVersionVoList[i].projectId==project_id){
                    var vo = pafVisioVersionVoList[i];
                    $("#pafId").append("<option value="+vo.pafId+" projectId="+vo.projectId+">"+vo.frameworkVersionPafVO.pafName+"</option>");
                }
            }
        }else{
            for(var i in pafVisioVersionVoList){
                var vo = pafVisioVersionVoList[i];
                $("#pafId").append("<option value="+vo.pafId+" projectId="+vo.projectId+">"+vo.frameworkVersionPafVO.pafName+"</option>");

            }
        }
        $("#assignDate").val(getNowFormatDate());
        changeAssignDate();
    }

    function changePaf(el){
        var paf_id = $(el).val();
        var projectId = $(el).find("option:selected").attr("projectId");
        $("#pafVisioVersion").empty();
        if (paf_id != 0) {
            for(var i in pafVisioVersionVoList){
            if(pafVisioVersionVoList[i].pafId==paf_id && pafVisioVersionVoList[i].projectId == projectId){
                var vo = pafVisioVersionVoList[i];
                $("#pafNumber").val(vo.pafId);
                //版本下拉框赋值
                for (var j in visioVersionAll){
                    if (visioVersionAll[j].pafId == pafVisioVersionVoList[i].pafId &&
                        visioVersionAll[j].projectId == pafVisioVersionVoList[i].projectId) {
                        $("#pafVisioVersion").append("<option value="+visioVersionAll[j].pafVisioVersion+">"+visioVersionAll[j].pafVisioVersion+"</option>");
                    }
                }
                var $table = $("#pafTable").find("input,select[id!='pafId'],textarea");
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
        if ($("#status").val() == '確認設計'){
            BottonIFWhether(false, $("#fen_pai"));  //true 是不可点击  false 是可以点击
        }else{
            BottonIFWhether(true, $("#fen_pai"));
        }
        changeAssignDate();
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
                $("#codeBy").val(visioVersionAll[j].codeBy);
                $("#assignBy").val(visioVersionAll[j].assignBy);
                $("#assignDate").val(visioVersionAll[j].assignDate);
                $("#estDuration").val(visioVersionAll[j].estDuration);
            }
        }
        if ($("#status").val() == '確認設計'){
            BottonIFWhether(false, $("#fen_pai"));  //true 是不可点击  false 是可以点击
        }else if($("#status").val() == '已分派'){
            BottonIFWhether(true, $("#fen_pai"));
        }
        changeAssignDate()
    }

    jeDate({
        dateCell:"#assignDate",
        format:"YYYY/MM/DD",
        maxDate:getNowFormatDate(),
        choosefun:function(){
            changeAssignDate()
        }
    })

    //選擇時間后的觸發事件
    function changeAssignDate(){
        var assignDate = $("#assignDate").val();
        if (assignDate){
            $("#day").html(returnDay(assignDate));
            var iDays = Math.floor(Math.abs(Date.parse(getNowFormatDate()) - Date.parse(assignDate)) / (24 * 3600 * 1000));
            if (iDays == 0){
                $("#dd").val("d");
            } else{
                $("#dd").val("d-"+iDays);
            }
        } else{
            $("#dd").val("");
            $("#day").html("");
        }

    }

    //保存PAf時字段驗證
    function checkSave() {
        var developer = $("#codeBy").val();
        var assignTime = $("#assignDate").val();
        var estimateTime = $("#estDuration").val();
        var assignBy = $("#assignBy").val();
        var projectId = $("#projectId").val();
        var pafId = $("#pafId").val();
        var pafVisioVersion = $("#pafVisioVersion").val();
        if(projectId == 0 ){
            Showbo.Msg.alert("請選擇項目！");
            return false;
        }
        if(pafId == 0){
            Showbo.Msg.alert("請選擇PAF！");
            return false;
        }
        if(pafVisioVersion == null || pafVisioVersion == ""){
            Showbo.Msg.alert("請選擇版本！");
            return false;
        }
        if(developer == null || developer == ""){
            Showbo.Msg.alert("編碼員不能爲空！");
            return false;
        }
        if(assignTime == null || assignTime == ""){
            Showbo.Msg.alert("分派時間不能爲空！");
            return false;
        }
        if(estimateTime == null || estimateTime == ""){
            Showbo.Msg.alert("預估時間不能爲空！");
            return false;
        }
        if(assignBy == null || assignBy == ""){
            Showbo.Msg.alert("分派人不能爲空");
            return false;
        }
        return true;
    }


    //保存PAF or 分派 num 0-保存，1-分派
    function saveOrAssignPaf(num){
        var status = $("#status").val();
        var check = checkSave();
        if(check){
            if (num == 1){
                $("#status").val("已分派")
            }
            var formData = $("#formData").serialize()+"&projectId="+$("#projectId").attr("project-id");
            console.info(formData);
            $.ajax({
                url: "${basePath}newPAFAssign.do?action=update",
                type: 'post',
                async:false,
                data:formData ,
                success: function(data){
                    var message;
                    if(data){
                        if (num == 0){
                            message = "保存成功";
                        } else{
                            message = "分派成功";
                        }
                        Showbo.Msg.alert(message,function(){
                            var pafId = $("#pafId").val()
                            var projectId = $("#projectId").attr("project-id");
                            var pafVisioVersion = $("#pafVisioVersion").val();
                            window.location.href="${basePath}newPAFAssign.do?pafId="+pafId+"&projectId="+projectId+"&pafVisioVersion="+pafVisioVersion;
                        });
                    }else{
                        if (num == 0){
                            message = "保存失敗,請聯係管理員";
                        } else{
                            message = "分派失敗,請聯係管理員";
                        }
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
       if (val){
           if (val == "d"){
               $("#assignDate").val(getNowFormatDate());
               $("#day").html(returnDay(getNowFormatDate()));
           } else{
               if (val.substr(0,2) =="d-" && isNumber(val.substr(2,val.length))){
                   var day = GetDateStr(val.substr(2,val.length));
                   $("#day").html(returnDay(day));
                   $("#assignDate").val(day);
               }
           }
       } else{
           $("#day").html("");
           $("#assignDate").val("");
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

</script>
</html>
