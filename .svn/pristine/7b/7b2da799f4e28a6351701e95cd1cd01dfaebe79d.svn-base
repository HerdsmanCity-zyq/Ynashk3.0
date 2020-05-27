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
    <script type="text/javascript" src="<%=basePath %>js/NewPAF.js"></script>
</head>

<style>
    .underline {
        text-decoration: underline;
    }
    .ieHeight{
        height:99%;
    }
    #table_tbody td,#newPafTable_thead th{
        border: 1px solid #a0a0a0;}
    #addPAF span{
        margin-right: 0px;}

</style>
<body>
<jsp:include page="../menu.jsp"></jsp:include>
<div class="cont" onclick="getOldMenu()">
<form id="formData1" enctype="multipart/form-data">

    <div class="add_paf">
        <table class="add_tab" id="addPAF" border="0px" cellpadding="0" cellspacing="0" width="98%">
            <tr>
                <th>
                    <label><span class="label_en">PAF</span>編號</label>
                    <span data-text='col'/>
                </th>
                <td style="width:280px">

                        <input type="text" readonly="readonly" id="newPafNo" name="pafId"
                                                                              value="${requestScope.pafLastVersionName}"
                                                                              maxlength="15"  class="tr yellow cont_num_en"
                                                                              style="width:60px;text-align: center"/>
                </td>
                <th style="vertical-align:top">
                    <label class="label_en"><spring:message code='paf.newPAF.pafFramework'/></label>
                    <span data-text='col'/>
                </th>
                <td>

                    <c:forEach items="${requestScope.frameworks}" var="fw" varStatus="s">
                        <c:if test="${s.first}">
                            <input type="radio" name="frameworkId" value="${fw.frameworkId}" checked="checked"/>
                            <span id="framework${ fw.frameworkId}" class="label_en">${fw.frameworkName}</span>

                        </c:if>
                        <c:if test="${!s.first}">
                            <input type="radio" name="frameworkId"  value="${fw.frameworkId}"/>
                            <span id="framework${ fw.frameworkId}"  class="label_en">${fw.frameworkName}</span>
                        </c:if>

                    </c:forEach>

                </td>
                <th >
                    <label class="label_en"><spring:message code='paf.newPAF.pafVersion'/></label>
                    <span data-text='col'/>
                </th>
                <td>
                    <select id="versionsId" name="versionsId" style="width:120px">
                        <c:forEach items="${requestScope.versions}" var="v" varStatus="ver">
                            <c:if test="${ver.last}">
                                <option value="${v.versionsId}" selected="selected">${v.versionsNum}</option>
                            </c:if>
                            <c:if test="${!ver.last}">
                                <option value="${v.versionsId}">${v.versionsNum}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <a href='javascript:void(0)' class='icon46' id="addNewPafVersion"></a>
                </td>
                <th>
                    <label><spring:message code="paf.newPAF.pafStatus"/></label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="pafStatus" name="statusName"
                           maxlength="15"  value="<spring:message code="paf.newPAF.unSaveStatus"/>"  class="tr yellow "
                           style="width:80px;text-align: center">
                </td>
            </tr>
            <%-- paf編號	Framework		Version		狀態--%>
            <tr>
                <th>
                    <label>
                       <span class="label_en">PAF</span>名稱

                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type="text" id="newPafName" name="pafNameChi"
                           value="" maxlength="20" class="cont_num_en" style="width:200px;"/>
                </td>
                <th>
                    <label>
                        <span class="label_en">BPWIN</span>編號
                        <span data-text='asterisk'/>
                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type="text" id="newPafBpwinNo" name="bpwinNo"
                             style="width:160px;"/>
                </td>
                <th >
                <label ><spring:message code='paf.newPAF.SA'/>
                    <span data-text='asterisk'/>
                </label>
                <span data-text='col'/>
            </th>
                <td>
                    <sam:select id="SA" name="sa" dropdownName="getPafSA" style="width:120px" value="${sessionScope.currUser.userId}"/>
                </td>

            </tr>
            <%-- paf名稱	BPWIN編號 --%>
            <tr>
                <th>
                    <label>
                        <div class="inblck label_en"><spring:message code="paf.newPAF.pafEngName"/></div>

                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type="text" id="newPafEnName" name="pafName"
                           value="" maxlength="20" style="width:200px;"/>
                </td>
                <th>
                    <label><spring:message code='paf.newPAF.pafRemarks'/></label>
                    <span data-text='col'/>
                </th>
                <td>
                    <sam:select name="pafRemarksId" id="newPafRemarks" dropdownName="getPafRemarks" class="w150" style="width:220px"/>

                </td>
            </tr>
            <%-- Eng Name	備注 --%>
            <tr>
                <th>
                    <label>
                        <spring:message code="paf.newPAF.client"/>
                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input name="customerName" id="customerName"  style="width:220px" class="w150 yellow" readonly />
                    <input name="customerId" id="newPafCustomer" hidden  />

                </td>
                <th>
                    <label>
                       <span class="label_en">Visio</span>文檔
                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type='text' id="newPafDocument" readonly='readonly' name="visioObject" maxlength='50'
                           onclick="openPafDoc()" style="width:260px;"/>
                    <input type="file" hidden id='PafVsdFile' accept=".vsdx,vsd" onchange='pafOnChange(this);' name='visioFile'/>
                    <%--	<input type="text" id="newPafDocument" name="pafDocument"
                               value="" maxlength="50" />--%>
                    <a href='javascript:void(0)' id="newPafUploadVsd" class='icon45' title="上傳文檔"></a>
                    <a id="downVsd" class='icon47' title="下載最新的文檔" download=""></a>
                    <a id="downVsd2" hidden download="" href=""></a>

                </td>
            </tr>
            <%-- 			Visio文檔 --%>
            <tr>
                <th>
                    <label>
                        <spring:message code="paf.newPAF.project"/>
                        <span data-text='asterisk'/>
                    </label>
                    <span data-text='col'/>

                </th>
                <td>

                    <sam:select id="newPafProject" dropdownName="getPafProject" name="projectId" style="width:220px" onchange="changCustomer()"/>

                </td>
                <th>
                    <label>
                        <spring:message code="paf.newPAF.isShared"/>
                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type="radio" name="isPublic" value="Y" class="cont_num_en" checked="checked"/>
                    <span class="label_en"><spring:message code='paf.newPAF.isShared.yes'/></span>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="isPublic" class="cont_num_en" value="N"/>
                    <span class="label_en"><spring:message code='paf.newPAF.isShared.no'/></span>
                </td>
            </tr>

            <%-- 			共享 --%>
        </table>
        <br><br>

        <div class="tab_cut_tit clrfix">
            <ul>
                <li class="selected"><a href="javascript:void(0);"><span id="box1"><spring:message
                        code="paf.newPAF.uploadFile"/></span></a></li>
            </ul>
        </div>

        <div id="itemDATA1" class="fl">

            <table class="tc base_table hbod child" id="newPafTable_thead" border="1" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <th width="48"></th>
                    <th width="320"><spring:message code="label.newCompanion.fileName"/></th>
                    <th width="320"><spring:message code="label.newCompanion.describe"/></th>
                    <th width="96"><spring:message code="label.newCompanion.uploadDate"/></th>
                </tr>
                </thead>
            </table>
            <div style="height: 255px;width:850px;  OVERFLOW-Y:auto;">
                <table class="base_table hbod child" id="table_tbody" border="1" cellpadding="0" cellspacing="0" >
                    <tbody>
                    <tr init>
                        <td colspan="1"  align="center" width="48">
                            <a href='javascript:void(0)' onclick="tablePlan.addTr(this,'init');" class='add'/>
                            <a href='javascript:void(0)' onclick="tablePlan.deleteTr(this,'all');" class='delete'/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div style="position: fixed;bottom:36px; left:132px; z-index: 100;">

        <sam:Button accessControl="Y" dim="N" btnName="new_paf_save" id="saveBtn" onclick="saveNewPafItem('PS00001')"
                    altKey="button.common.save"/>
        <sam:Button accessControl="Y" dim="N" btnName="new_paf_initial_design" id="initialBtn" onclick="saveNewPafItem('PS00002')"
                    altKey="button.common.initial.design"/>
        <sam:Button accessControl="Y" dim="N" btnName="new_paf_design"  id="designBtn" onclick="saveNewPafItem('PS00002')"
                    altKey="button.common.design"/>
        <sam:Button accessControl="Y" dim="N" btnName="new_paf_customer_confirm"  id="confirmBtn" onclick="saveNewPafItem('PS00004')"
                    altKey="button.common.customerConfirm"/>
        <sam:Button accessControl="Y" dim="N" btnName="new_paf_redesign" id="redesignBtn" onclick="saveNewPafItem('PS00002')"
                    altKey="button.common.redesign"/>
        <%--<sam:Button accessControl="Y" dim="N" btnName="newNurseItem_save"  onclick="saveNewPafItem('PS00005')"
                    altKey="button.common.startCoding"/>
        <sam:Button accessControl="Y" dim="N" btnName="newNurseItem_save"  onclick="saveNewPafItem('PS00006')"
                    altKey="button.common.startCoding"/>
        <sam:Button accessControl="Y" dim="N" btnName="newNurseItem_save"  onclick="saveNewPafItem('PS00007')"
                    altKey="button.common.codeCompletion"/>
        <sam:Button accessControl="Y" dim="N" btnName="newNurseItem_save"  onclick="saveNewPafItem('PS00008')"
                    altKey="button.common.submit2"/>
        <sam:Button accessControl="Y" dim="N" btnName="newNurseItem_save"  onclick="saveNewPafItem('PS00009')"
                    altKey="button.common.SITCompletion"/>
        <sam:Button accessControl="Y" dim="N" btnName="newNurseItem_save"  onclick="saveNewPafItem('PS00010')"
                    altKey="button.common.installCompletion"/>
        <sam:Button accessControl="Y" dim="N" btnName="newNurseItem_save"  onclick="saveNewPafItem('PS00011')"
                    altKey="button.common.UATCompletion"/>
        <sam:Button accessControl="Y" dim="N" btnName="newNurseItem_save"  onclick="saveNewPafItem('PS00012')"
                    altKey="button.common.onlineInstall"/>
        <sam:Button accessControl="Y" dim="N" btnName="newNurseItem_save"  onclick="saveNewPafItem('PS00013')"
                    altKey="button.common.use"/>
--%>
    </div>
</form>
</div>
</body>
</html>
<script type="text/javascript">
    //頁面加載完成的入口

    //1代表新增，2代表详情
    var pageType = ${requestScope.pageType};
    var lastUpdate = "${lastUpdate}";
    var tablePlan = {
        basePath:"${basePath}",
        formId:"formData1",
        docName:"",
        /**
         * 保存被刪除的id，id的input必須存在"+"和"-"同一個tb下
         * */
        delIds:[],
        /**
         * tr
         * */
        tab_TR:
        "<tr context>" +
        "<td width='48px' align='center'>" +
        "<a href='javascript:void(0)' onclick='tablePlan.addTr(this);' class='add' />" +
        "<a href='javascript:void(0)' onclick='tablePlan.deleteTr(this);' class='delete' />" +
        "<input hidden  name='fileList[?].pafAttachmentId'  value='0'/></td>"+

        "<td onclick='tablePlan.toChangeFile(this)' width='320px' >"+
        "<a name='fileList[?].pafAttachmentName' download='' class='underline'  onclick='tablePlan.todownloadFile()' maxlength='50'  for='TRindex_LLL'  />" +
        "</a>"+
        "</td>"+

        "<td width='320px'>"+
        "<input type='text' name='fileList[?].pafAttachmentDesc'  class='nobd doc_desc ieHeight'/>"+
        "</td>"+


        "<td width='96px'>"+
        "<input type='file' hidden id='TRindex_LLL' class='fileName' onchange='tablePlan.fileChange(this);' maxlength='50' name='fileList[?].files' />"+
        "<input type='text' readonly='readonly' name='fileList[?].fileCrd' style='width:90%;' class='nobd' />"+
        "<input type='text' hidden name='fileList[?].pafAttachmentName'  />"+
        "</td>" +
        "</tr>",
        /**
         * 根據當前顯示的tab，添加相應的行
         * */
        addTr:function (e, init){
            var text = $(".tab_cut_tit ul li.selected span").attr("id");
            var $tab_TR = $(this.tab_TR);

            /*这里不需要时间选择器，注释掉
            var $input =  $tab_TR.find("input[id='_qd_value_']");
            $input.each(function(){
                $(this).attr("id",$input.attr("id")+(new Date().getTime()+Math.random()));
            });*/

            if(init!=undefined){
                $(e).parents("tr[init]").eq(0).before($tab_TR);
            }
            else{
                $(e).parents("tr[context]").eq(0).after($tab_TR);
            }
        },
        /**
         * 删除表格的行数据
         * */
        deleteTr:function(e,all){
            if(all!=undefined) {
                $(e).parents("table").eq(0).find("tr[context]").each(function(){
                    var i = $(this).find("input").eq(0).val();
                    if(i != "0"){
                        tablePlan.delIds.push(i);

                    }
                })
                $(e).parents("table").eq(0).find("tr[context]").remove();

            }else{
                var i = $(e).parents("td").eq(0).find("input").eq(0).val();
                if (i != "0"){
                    tablePlan.delIds.push(i);

                }
                $(e).parents("tr[context]").eq(0).remove();

            }

        },
       /**
         * 彈出時間選擇器
         * */
        wdatePickerClick: function (id){
            WdatePicker({lang:"${lang eq 'en_US' ? 'en' : 'zh-tw' }",el:id,dateFmt:'yyyy/MM/dd',minDate:'#F{$dp.$D(\'activity_hold_date\')}',isShowClear:true});
        },
        /**
         * 保存時整理數據，序列化數據
         * */
        getUpdateSerialize:function (){
            var TRS = $("#" + this.formId + " table tbody tr[context]");
            for (var i = 0; i < TRS.length; i++) {
                var List = TRS.eq(i).find("input,select");
                for (var k = 0; k < List.length; k++) {
                    List.eq(k).attr("name",List.eq(k).attr("name").replace("?", i));
                }
            }
            var formData1 = new FormData($("#"+this.formId)[0]);
            if (tablePlan.delIds.length != 0){

                for (var j = 0;j<tablePlan.delIds.length;j++){
                    formData1.append("delIds["+j+"]",tablePlan.delIds[j]);
                }
                tablePlan.delIds = [];
            }

            return formData1;
        },
        /**
         * 獲取tab序列化
         * */
        getWindowSerialize:function (formName){
            return $("#"+formName).find("input[type='text'],select").serialize();
        },

        /**
         * 進入检视頁面赋值
         * */
        toShowData:function (formName, list,tabTR){
            if (list !== undefined){
                for(var i =0;i<list.length;i++){
                    var $tab_TR = $(tabTR);
                    $("#"+formName+" tr[init]").before($tab_TR);
                    var trd = $("#" + formName + " tr[context]").eq(i);
                    for(var key in list[i]){
                        if(key ==="files") continue;
                        if(key === "pafAttachmentName") {
                            trd.find("a[name*='" + "pafAttachmentName" + "']").text(list[i][key]);
                            trd.find("a[name*='" + "pafAttachmentName" + "']").addClass("underline");
                            trd.find("a[name*='"+"pafAttachmentName"+"']").attr("href",tablePlan.basePath+"newPAF.do?action=downloadAttachFile&frameworkId="+list[i]["frameworkId"]+"&versionsId="+list[i]["versionsId"]+"&pafId="+list[i]["pafId"]+"&pafAttachmentId="+list[i]["pafAttachmentId"]);

                        }
                        trd.find("[name*='"+key+"']").val(list[i][key]);

                    }

                }
            }
        },

        /**
         * 保存成功后，更新數據
         * */
        updateData:function (tableId,list){

            if (list !== undefined){


                for(var i =0;i<list.length;i++){
                    var trd = $("#" + tableId + " tr[context]").eq(i);
                    for(var key in list[i]){

                        if(key ==="files") continue;
                        if(key === "pafAttachmentName") {
                            trd.find("a[name*='" + "pafAttachmentName" + "']").text(list[i][key]);
                            trd.find("a[name*='" + "pafAttachmentName" + "']").addClass("underline");
                            trd.find("a[name*='"+"pafAttachmentName"+"']").attr("href",tablePlan.basePath+"newPAF.do?action=downloadAttachFile&frameworkId="+list[i]["frameworkId"]+"&versionsId="+list[i]["versionsId"]+"&pafId="+list[i]["pafId"]+"&pafAttachmentId="+list[i]["pafAttachmentId"]);
                        }
                            trd.find("[name*='"+key+"']").val(list[i][key]);




                    }

                }

            }
        },
        toChangeFile:function(e,event){
        $(e).parent("tr").find("input[type='file']").click();
        },
        fileChange:function(e){

            var value1;
            if ($(e).val() != "") {
                tablePlan.docName = $(e).val()
            } else {
                $(e).val(tablePlan.docName);
            }
            value1 = tablePlan.docName.substr($(e).val().lastIndexOf("\\") + 1, $(e).val().length);
            $(e).parents("tr").eq(0).find("input[for='" + $(e).attr("id") + "']").val(value1 == undefined || value1.length < 1 ? "" : value1);
            $(e).parents("tr").eq(0).find("a[for='" + $(e).attr("id") + "']").text(value1 == undefined || value1.length < 1 ? "" : value1);
            var fileSet =  $(e).val();
            if (fileSet != "" && fileSet != undefined){
                $(e).parents("tr").eq(0).find("a[name*='pafAttachmentName']").removeClass("underline");
                $(e).parents("tr").eq(0).find("a[name*='pafAttachmentName']").attr("href","#");
            }

        },
        todownloadFile: function(){
            //阻止doc点击事件冒泡
            window.event.cancelBubble = true;
        },
        emptyFile:function(tableId){
            $("#"+tableId).find("tr[context]").each(function(){
                $(this).find("input[name *= 'files']").val("");
                window.event.cancelBubble = true;
            })
        }

    };

    $(function () {
        //判断进入详情页面，赋值
        if (pageType == 2){
            //获取后端传过来的文件信息
            var attachmentData = ${attachments == null ? "{}":attachments};
            var data = ${pafVo == null ?"{}":pafVo};
            var visioName = ${visioName == null ?"{}":visioName};
            changPageValue(data,attachmentData,visioName);
        }

        var pafStatus = $("#pafStatus").val();
        if (pafStatus === "設計中"){
            BottonIFWhether(false,$("#confirmBtn"));
        } else{
            BottonIFWhether(true,$("#confirmBtn"));
        }
        if (pafStatus==="已分派" || pafStatus ==="編碼中" || pafStatus === "已編碼" || pafStatus ==="已提交") {
            BottonIFWhether(false,$("#redesignBtn"));
        }else{
            BottonIFWhether(true,$("#redesignBtn"));
        }
    });


    //表單的验证
    function valifyFormData1() {
        var error = "";

        //验证PAF的中文名和英文名至少输入一个
        if (!$("#newPafName").val() && !$("#newPafEnName").val()) {
            error += "<spring:message code='message.common.31' />" + "\r\n";
        }
        if($("#newPafEnName").val()){
            if(!checkItemEng($("#newPafEnName").val())){
                error += "<spring:message code="paf.newPAF.pafEngName"/><spring:message code='message.common.38' />"+ "\r\n";
            }

        }
        if ($("#newPafBpwinNo").val().trim()===""){
            error += "<spring:message code='paf.message.08' />" + "\r\n";

        }
        if($("#versionsId").find("option[selected]").length === 0){
            error += "<spring:message code='paf.message.05' />" + "\r\n";
        }

        if ($("#SA").val() ==="0"){
            error +=  "<spring:message code='paf.message.06' />" + "\r\n";
        }
        if ($("#newPafProject").val() ==="0"){
            error +=  "<spring:message code='paf.message.07' />" + "\r\n";
        }
        //正则表达式；验证BPWIN編號不合格
        /*var zz = /^[A]\d+(\.\d+)/;
        var value = $("#newPafBpwinNo").val();
        if (!zz.test(value)) {
            error += "" + "\r\n";
        }*/

        var  $tabtr =  $('#table_tbody').find("tr[context]");
        for(var j = 0; j < $tabtr.length;j++){
            var txt = $tabtr.eq(j).find("a[name*='pafAttachmentName']").text();
            if (txt.trim() == ""){
                error +="<spring:message code='paf.message.03' />\n";
                break;
            }
        }

        return error;
    }

    //提交表單（頁面上“save”按鈕）
    function saveNewPafItem(state) {
        //验证表单1
        var error = valifyFormData1();
        if (error !== "") {
            alert(error);
            return;
        }

        var formData1 = tablePlan.getUpdateSerialize();
        formData1.append("action", "saveNewPafItem");
        formData1.append("lastUpdate",lastUpdate);
        formData1.append("pafStatusId",state);

        //序列化表单1的值
        $.ajax({
            url: "newPAF.do",
            type: 'POST',
            data: formData1,
            cache: false,
            contentType: false, //不设置内容类型
            processData: false, //不处理数据type: 'post',
            datType: 'json',
            success: function (data) {
                if (data.code === 200) {
                    $('#newPafDocument').val(data.data.visioName);
                    $('#PafVsdFile').val('');
                    $('#pafStatus').val(data.data.pafVo.pafStatusVo.statusNameChi);
                    $('#newPafNo').val(data.data.pafVo.pafId);

                    lastUpdate =data.data.pafVo.lastUpdate;

                    if ( data.data.pafVo.fileList !== undefined){

                        tablePlan.emptyFile("table_tbody");
                        tablePlan.updateData("table_tbody",data.data.pafVo.fileList);
                    }

                    var pafStatus =data.data.pafVo.pafStatusVo.statusNameChi;
                    if (pafStatus === "設計中"){
                        BottonIFWhether(false,$("#confirmBtn"));
                    } else{
                        BottonIFWhether(true,$("#confirmBtn"));
                    }
                    if (pafStatus==="已分派" || pafStatus ==="編碼中" || pafStatus === "已編碼" || pafStatus ==="已提交") {
                        BottonIFWhether(false,$("#redesignBtn"));
                    }else{
                        BottonIFWhether(true,$("#redesignBtn"));
                    }


                }
                alert(data.msg);

            }, error: function () {
                alert("<spring:message code='paf.message.02'/>");
            }
        });
    }
</script>

