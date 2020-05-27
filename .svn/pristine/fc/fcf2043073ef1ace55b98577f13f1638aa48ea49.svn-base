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
    <jsp:include page="../../includestatic.jsp"/>
    <script type="text/javascript" src="<%=basePath %>js/newFRAPAF.js"></script>
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
    .hidden{display: none}
    .editmode a {
        margin-left: 30px;
    }
    .editmode{
        width:100%;
        heigth:50px;
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
    .versionDiv {
        z-index: 99999;
        background: #f7f7f9;
        width: 100%;
        height: 100%;
        position: fixed;
        top: 100px;
        opacity: 0.8;
    }
    .versionDiv2 {
         width: 360px;
         height: 200px;
         margin: auto;
         background: #a0c850;
         border: 1px solid black;
         opacity: 1;
         border-radius: 5px;
         margin-top: 5%;
     }
    .versionDiv3 {
        height: 180px;
        background: white;
        margin: 10px;
    }

</style>
<body>
<jsp:include page="../../menu.jsp"></jsp:include>
<div class="cont" onclick="getOldMenu()">
    <div class="wrapper">

    </div>
    <div class="editmode">
        <a href="javascript:void(0)" id="editFRA" class="icon22" onclick="editFRA()"></a>
        <a href="javascript:void(0)" id="deleteFRA" class="icon21"></a>
    </div>
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
                           value="${pafItem.pafId}"
                           maxlength="15"  class="tr yellow cont_num_en"
                           style="width:60px;text-align: center"/>
                </td>
            </tr>
            <tr>
                <th>
                    <label>
                        <span class="label_en">PAF</span>名稱

                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type="text" id="newPafName" name="pafNameChi"
                           value="${pafItem.pafNameChi}" maxlength="20" class="cont_num_en" style="width:200px;"/>
                </td>
                <th style="vertical-align:top">
                    <label class="label_en"><spring:message code='paf.newPAF.pafFramework'/></label>
                    <span data-text='col'/>
                </th>
                <td>
                    <c:forEach items="${pafItem.frameworkVo}" var="framework">
                        <c:if test="${pafItem.frameworkId==framework.frameworkId}">
                            <input type="radio" name="frameworkId" value="${framework.frameworkId}" checked="checked"/>
                            <span id="framework" class="label_en">${framework.frameworkName}</span>

                        </c:if>
                        <c:if test="${pafItem.frameworkId!=framework.frameworkId}">
                            <input type="radio" name="frameworkId"  value="${framework.frameworkId}"/>
                            <span id="framework"  class="label_en">${framework.frameworkName}</span>
                        </c:if>
                    </c:forEach>
                </td>
                <th >
                    <label class="label_en"><spring:message code='paf.newPAF.pafVersion'/></label>
                    <span data-text='col'/>
                </th>
                <td>
                    <select id="versionsNO" name="versionsNo" style="width:120px">
                        <c:if test="${pageType == '1'}">
                            <c:forEach items="${pafItem.versionsVo}" var="v" varStatus="s">
                                <c:if test="${pafItem.frameworkId==v.frameworkId}">
                                    <c:if test="${s.first}">
                                        <option selected="selected" value="${v.versionsNO}">${v.versionsNO}</option>
                                    </c:if>
                                    <c:if test="${!s.first}">
                                        <option value="${v.versionsNO}">${v.versionsNO}</option>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <c:if test="${pageType == '2'}">
                            <option value="${pafItem.versionsNo}" selected="selected">${pafItem.versionsNo}</option>
                        </c:if>
                    </select>
                    <a href="javascript:void(0)" id="newPafversion" class="icon46"></a>

                    <%--<a href='javascript:void(0)' class='icon46' id="addNewPafVersion"></a>--%>
                </td>
                <th>
                    <label><spring:message code="paf.newPAF.pafStatus"/></label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type="text" readonly="readonly" id="pafStatus"
                           maxlength="15"  value="${pafItem.status}"  class="tr yellow "
                           style="width:80px;text-align: center">
                    <input type="hidden" name="status" id="status" value="${pafItem.status}"/>
                </td>
            </tr>
            <%-- 			Visio文檔 --%>
            <tr>
                <th>
                <label>
                    <div class="inblck label_en"><spring:message code="paf.newPAF.pafEngName"/></div>

                </label>
                <span data-text='col'/>
                </th>
                <td>
                    <input type="text" id="newPafEnName" name="pafName"
                           value="${pafItem.pafName}" maxlength="20" style="width:200px;"/>
                </td>
                <th>
                    <label>
                        <span class="label_en">Visio</span>文檔
                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type='text' id="newVisio" readonly='readonly' name="visioObject" maxlength='50' value="${pafItem.visioName}"
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
                        <span class="label_en">BPWIN</span>編號
                        <span data-text='asterisk'/>
                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <input type="text" id="newPafBpwinNo" name="bpwinNo" value="${pafItem.bpwinNo}"
                           style="width:160px;"/>
                </td>
            </tr>
            <%-- sa 備注 --%>
            <tr>
                <th>
                    <label ><spring:message code='paf.newPAF.SA'/>
                        <span data-text='asterisk'/>
                    </label>
                    <span data-text='col'/>
                </th>
                <td>
                    <sam:select id="SA" name="sa" dropdownName="getPafSA" style="width:120px" value="${pafItem.sa}"/>
                </td>
                <th>
                    <label><spring:message code='paf.newPAF.pafRemarks'/></label>
                    <span data-text='col'/>
                </th>
                <td>
                <c:if test="${pageType == '1'}">
                    <sam:select name="remark" id="newPafRemarks" dropdownName="getPafRemarks" class="w150" style="width:220px"/>
                </c:if>
                <c:if test="${pageType == '2'}">
                    <select name="remark" id="newPafRemarks" dropdownName="getPafRemarks" class="w150" style="width:220px">
                        <c:if test="${pafItem.remark==''}">
                            <option value="0"></option>
                        </c:if>
                        <c:forEach items="${pafItem.pafRemarksVo}" var="remarks" varStatus="s">
                            <c:if test="${pafItem.remark==remarks.pafRemarksId}">
                                <option value="${remarks.pafRemarksId}" selected="selected">${remarks.pafRemarkDesc}</option>
                            </c:if>
                            <c:if test="${pafItem.remark!=remarks.pafRemarksId}">
                                <option value="${remarks.pafRemarksId}">${remarks.pafRemarkDesc}</option>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pafItem.remark!=''}">
                            <option value="0"></option>
                        </c:if>
                    </select>
                </c:if>

                </td>
            </tr>

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
        <sam:Button accessControl="Y" dim="N" id="saveBtn" onclick="saveNewFRAPafItem('已保存')"
                    altKey="button.common.save"/>
        <sam:Button accessControl="Y" dim="N" id="useBtn" onclick="saveNewFRAPafItem('')"
                    altKey="button.common.use"/>
    </div>
</form>
</div>

<!-- 新增version-->
<div id="versionDiv" name="versionDiv" class="versionDiv hidden">
    <div class="versionDiv2">
        <div class="versionDiv3">
            <form action="" id="Visio">
                <table class="add_tab" border="0" cellpadding="0" cellspacing="0" style="margin:5px;">
                    <!-- 1-->
                    <tbody><tr>
                        <th align="left">
                            <label>
                                Max Versoin
                            </label>
                            :</th>
                        <td>
                            <input type="text" name="Maxversion" id="Maxversion" readonly="readonly" class="tr yellow cont_num_en" value="">
                        </td>
                    </tr>
                    <tr>
                        <th align="left">
                            <label>
                                Versoin
                            </label>
                            :</th>
                        <td>
                            <input type="text" name="Newversion" id="Newversion" class="tr cont_num_en" value="">
                        </td>
                    </tr>
                    </tbody></table>
            </form>

            <div style="margin-top:60px;margin-left:5px;">
                <input type="button" value="取消" class="btn" onclick="CloseversionDiv()" >
                <input type="button" data-btnname="new_staff_save" onclick="GenerateNewVersion()" value="保存回填" class="btn">
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //頁面加載完成的入口

    //1代表新增，2代表详情
    var pageType = ${pageType};
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
        "<input hidden  name='fileList[?].pafDocumentName'  value='0'/></td>"+

        "<td onclick='tablePlan.toChangeFile(this)' width='320px' >"+
        "<a name='fileList[?].pafDocumentName' download='' class='underline'  onclick='tablePlan.todownloadFile()' maxlength='50'  for='TRindex_LLL'  />" +
        "</a>"+
        "</td>"+

        "<td width='320px'>"+
        "<input type='text' name='fileList[?].pafDocumentDesc'  class='nobd doc_desc ieHeight'/>"+
        "</td>"+


        "<td width='96px'>"+
        "<input type='file' hidden id='TRindex_LLL' class='fileName' onchange='tablePlan.fileChange(this);' maxlength='50' name='fileList[?].files' />"+
        "<input type='text' readonly='readonly' name='fileList[?].crdstr' style='width:90%;' class='nobd' />"+
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
            console.log(TRS.length)
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
                        if(key === "pafDocumentName") {
                            trd.find("a[name*='" + "pafDocumentName" + "']").text(list[i][key]);
                            trd.find("a[name*='" + "pafDocumentName" + "']").addClass("underline");
                            trd.find("a[name*='"+"pafDocumentName"+"']").attr("href",tablePlan.basePath+"newFRAPAF.do?action=downloadDocFile&pafId="+list[i]["pafId"]+"&pafDocumentName="+list[i]["pafDocumentName"]);

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
                        if(key === "pafDocumentName") {
                            trd.find("a[name*='" + "pafDocumentName" + "']").text(list[i][key]);
                            trd.find("a[name*='" + "pafDocumentName" + "']").addClass("underline");
                            trd.find("a[name*='"+"pafDocumentName"+"']").attr("href",tablePlan.basePath+"newFRAPAF.do?action=downloadDocFile&pafId="+list[i]["pafId"]+"&pafDocumentName="+list[i]["pafDocumentName"]);
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
                $(e).parents("tr").eq(0).find("a[name*='pafDocumentName']").removeClass("underline");
                $(e).parents("tr").eq(0).find("a[name*='pafDocumentName']").attr("href","#");
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
        if(pageType == '1'){
            $("#versionsNO option:first").prop("selected", 'selected');
            $('.editmode').addClass('hidden');
            $(".wrapper").addClass('hidden');
        }else if (pageType == '2'){
            $("input[name='frameworkId']").attr("disabled","disabled");
            $("#versionsNO").attr("disabled","disabled");
            $("#newPafBpwinNo").attr("readonly","readonly");
            $('#newPafversion').addClass('hidden');
            if('${document}'.length>2?true:false){
                tablePlan.toShowData("table_tbody",${document},tablePlan.tab_TR);
            }

            $($('.top.nav_bg.clrfix')[1]).find('li')[2].innerHTML="<a data-type='null'>更改 Framework PAF</a>";
            $($($('.top.nav_bg.clrfix')[1]).find('li')[2]).attr("class","f8 current_bg")
            $($($('.top.nav_bg.clrfix')[1]).find('li')[1]).attr("class","f8");
            $($($('.top.nav_bg.clrfix')[1]).find('li')[1]).click(function () {
                javascript:pageJump('newFRAPAF.do','null','新增_Framework_PAF');
            })
        }

        var pafStatus = $("#pafStatus").val();
        BottonIFWhether(false,$("#saveBtn"));
        if (pafStatus == "已使用") {
            BottonIFWhether(true,$("#useBtn"));
        }else{
            BottonIFWhether(false,$("#useBtn"));
        }
    });


    //表單的验证
    function valifyFormData1() {
        var error = "";

        //验证PAF的中文名和英文名至少输入一个
        if ($("#newPafName").val().trim()==="" && $("#newPafEnName").val().trim()==="") {
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
        if($("#versionsNO").find("option[selected]").length === 0){
            error += "<spring:message code='paf.message.05' />" + "\r\n";
        }

        if ($("#SA").val() ==="0"){
            error +=  "<spring:message code='paf.message.06' />" + "\r\n";
        }

        var  $tabtr =  $('#table_tbody').find("tr[context]");
        for(var j = 0; j < $tabtr.length;j++){
            var txt = $tabtr.eq(j).find("a[name*='pafDocumentName']").text();
            if (txt.trim() == ""){
                error +="<spring:message code='paf.message.03' />\n";
                break;
            }
        }

        return error;
    };

    //提交表單（頁面上“save”按鈕）
    function saveNewFRAPafItem(state) {
        //验证表单1
        var error = valifyFormData1();
        if (error !== "") {
            alert(error);
            return;
        }

        $("#status").val('已保存');
        var formData1 = tablePlan.getUpdateSerialize();
        formData1.append("action", "saveNewFRAPafItem");
        if(pageType == '2'){
            formData1.append("versionsNo",$('#versionsNO').val());
            formData1.append("frameworkId",$('input:radio[name="frameworkId"]:checked').val());
        }
        //序列化表单1的值
        $.ajax({
            url: "newFRAPAF.do",
            type: 'POST',
            data: formData1,
            cache: false,
            contentType: false, //不设置内容类型
            processData: false, //不处理数据type: 'post',
            datType: 'json',
            success: function (data) {
                if (data.code === 200) {
                    $('#pafStatus').val('已保存');
                    $("#newPafNo").val(data.data.pafId)


                    if ( data.data.fileList !== undefined){

                        tablePlan.emptyFile("table_tbody");
                        tablePlan.updateData("table_tbody",data.data.fileList);
                    }

                }
                Showbo.Msg.alert(data.msg);

            }, error: function () {
                Showbo.Msg.alert("<spring:message code='paf.message.02'/>");
            }
        });
    };

    $('input:radio[name="frameworkId"]').change(function(){
        $('#versionsNO').empty();
        var frameworkid = $('input:radio[name="frameworkId"]:checked').val();

        var frameworks = new Array();
        var versions = new Array();

        <c:forEach items="${pafItem.versionsVo}" var="v">
        frameworks.push("${v.frameworkId}");
        </c:forEach>
        <c:forEach items="${pafItem.versionsVo}" var="v">
        versions.push("${v.versionsNO}");
        </c:forEach>

        var temp=1;
        for(var i in frameworks){
            if(frameworks[i]==frameworkid) {
                if(temp==1){
                    $("#versionsNO").append("<option selected='selected' value='" + versions[i] + "'>" + versions[i] + "</option>");
                    temp=100;
                }else {
                    $("#versionsNO").append("<option value='" + versions[i] + "'>" + versions[i] + "</option>");
                }
            }
        }
    });
    //上传visio
    $("#newPafUploadVsd").click(function(){
            var formData = new FormData();
            var file = $('#PafVsdFile').get(0).files[0];
            var pafId = $('#newPafNo').val();
            var versionsNO = $('#versionsNO').val();
            formData.append("visioFile", file);
            formData.append("versionsNo", versionsNO);
            formData.append("pafId", pafId);
            if ("undefined" != typeof(file) && file != null && file != "") {
                $.ajax({
                    url: '${basePath}newFRAPAF.do?action=uploadFRAPafVsb',
                    type: 'POST',
                    data: formData,
                    cache: false,
                    contentType: false, //不设置内容类型
                    processData: false, //不处理数据
                    success: function (data) {
                        if (data.code === 200) {
                            $('#newVisio').val(data.data);
                            $('#PafVsdFile').val('')
                            Showbo.Msg.alert(data.msg);

                        } else {
                            Showbo.Msg.alert(data.msg);
                        }
                    },
                    error: function () {

                    }
                })
            } else {
                Showbo.Msg.alert("请选择上传文件")
            }
    });
    //下载visio
    $("#downVsd").click(function(){
        if(pageType == '2'){
            $.ajax({
                    url: '${basePath}newFRAPAF.do?action=checkDownload&pafId='+$('#newPafNo').val(),
                    type: 'POST',
                    dataType: "json",//预期服务器返回的类型c
                    contentType: false,
                    success: function (data) {
                        if (data.code === 200) {
                            $('#downVsd2').attr('href', '${basePath}newFRAPAF.do?action=downloadVisioFile&pafId='+$('#newPafNo').val());
                            $('#downVsd2')[0].click();
                        } else {
                            Showbo.Msg.alert(data.msg);
                        }
                    },
                    error: function () {
                    }
                })
            }
    });
    $("#newPafversion").click(function(){
        if(pageType == '1'){
            $("#versionDiv").removeClass("hidden");
            $.ajax({
                url: '${basePath}newFRAPAF.do?action=getMaxVersionByFraId&frameworkId='+$('input:radio[name="frameworkId"]:checked').val(),
                type: 'POST',
                dataType: "json",//预期服务器返回的类型c
                ContentType: "application/json",
                success: function (data) {
                    if (data.code === 200) {
                        if(data.data.versionsNO!=null && data.data.versionsNO!=''){
                            $("#Maxversion").val(data.data.versionsNO);
                        }else{
                            $("#Maxversion").val('0.0.1');
                        }
                    } else {
                        Showbo.Msg.alert(data.msg);
                    }
                },
                error: function () {
                }
            })
        }
    });
    function GenerateNewVersion(){
        var formData=new FormData();
        var versionsNo=$("#Newversion").val();
        formData.append("action","inserNewVersion")
        formData.append("frameworkId",$('input:radio[name="frameworkId"]:checked').val());
        formData.append("VersionsNO",versionsNo);
        $.ajax({
            url: '${basePath}newFRAPAF.do',
            type: 'POST',
            data:formData,
            dataType: "json",//预期服务器返回的类型c
            contentType:false,
            processData:false,
            cache:false,
            success: function (data) {
                if (data.code === 200) {
                    $("#versionsNO").find("option:selected").attr("selected",false);
                    $("#versionsNO").append("<option selected='selected' value='" + versionsNo + "'>" + versionsNo + "</option>");
                    $("#versionDiv").addClass("hidden");
                } else {
                    Showbo.Msg.alert(data.msg);
                }
            },
            error: function () {
            }
        });
    };
    function pafOnChange(Tag) {
        var value1;
        if ($(Tag).val() != "") {
            value1 = $(Tag).val();
            $('#newVisio').val(value1);
            //截取visio版本号
            var visioversion = value1.substring(value1.lastIndexOf(".")-2,value1.lastIndexOf("."));
            console.log("visio="+visioversion)
            var reg = /^[0-9]{2}$/;
            if(reg.test(visioversion)){

            }else{
                Showbo.Msg.alert("根据上传的Visio文档，没有从Visio文档名称中取到版本号");
                $("#newVisio").val("");
                $("#PafVsdFile").val("");
            }
        }

    }
</script>

