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
    <script type="text/javascript" src="<%=basePath %>js/newFRAPAF.js"></script>
</head>

<style>
    .underline {
        text-decoration: underline;
    }
    .ieHeight{
        height:99%;
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
    #table_tbody td,#newPafTable_thead th{
        border: 1px solid #a0a0a0;}
    #addPAF span{
        margin-right: 0px;}
    .hidden{display: none}
    .add_tab label, .bt_label{ width:168px; text-align:left; display:inline-block; line-height:32px;}
    .add_tab tr th { width:190px; font-weight:bold; font-size:19px; line-height:32px;}
    .tab_cut_tit ul li.unselected a{background:#92d050; display:inline-block; outline:none; color:black; }

</style>
<body>
<jsp:include page="../menu.jsp"/>
<div class="cont" onclick="getOldMenu()">

    <div class="wrapper">

    </div>
    <div class="editmode">
        <a href="javascript:void(0)" id="editFRA" class="icon22" onclick="editProjectPaf()"></a>
        <a href="javascript:void(0)" id="deleteFRA" class="icon21" onclick="deleteProjectPaf()"></a>
    </div>
    <form id="formData1" enctype="multipart/form-data">

        <div class="add_paf">
            <table class="add_tab" id="addPAF" border="0px" cellpadding="0" cellspacing="0" width="98%">
                <tr>
                    <th>
                        <label><span class="label_en">選擇</span>Framework PAF</label>
                        <span data-text='col'/>
                    </th>
                    <td>
                        <datalist id="pafList"></datalist>
                        <input list="pafList" id="currentPafName" style="width:220px" onchange="pafChange(this.value)" value="" />

                    </td>
                </tr>
                <tr>

                    <th>
                        <label><span class="label_en">PAF</span>編號</label>
                        <span data-text='col'/>
                    </th>
                    <td style="width:280px">
                        <c:if test="${pageType == '1' || pageType == '3'}">
                            <input type="text" readonly="readonly" id="newPafNo" name="pafId"
                                   value="" maxlength="15"  class="tr yellow cont_num_en" style="width:60px;text-align: center"/>
                        </c:if>
                        <c:if test="${pageType == '2' || pageType == '4'}">
                            <input type="text" readonly="readonly" id="newPafNo" name="pafId"
                                   value="${pafItem.pafId}" maxlength="15"  class="tr yellow cont_num_en" style="width:60px;text-align: center"/>
                        </c:if>
                    </td>
                    <th style="vertical-align:top">
                        <label class="label_en"><spring:message code='paf.newPAF.pafFramework'/></label>
                        <span data-text='col'/>
                    </th>
                    <td>
                        <c:if test="${pageType == '1' || pageType == '3'}">
                            <c:forEach items="${pafItem.frameworkVo}" var="framework">
                                <input type="radio" name="frameworkId"  value="${framework.frameworkId}"/>
                                <span id="framework${framework.frameworkId}"  class="label_en">${framework.frameworkName}</span>
                            </c:forEach>
                        </c:if>
                        <c:if test="${pageType == '2' || pageType == '4'}">
                            <c:forEach items="${pafItem.frameworkVo}" var="framework">
                                <c:if test="${pafItem.frameworkId==framework.frameworkId}">
                                    <input type="radio" name="frameworkId" value="${framework.frameworkId}" checked="checked"/>
                                    <span id="framework${framework.frameworkId}" class="label_en">${framework.frameworkName}</span>

                                </c:if>
                                <c:if test="${pafItem.frameworkId!=framework.frameworkId}">
                                    <input type="radio" name="frameworkId"  value="${framework.frameworkId}"/>
                                    <span id="framework${framework.frameworkId}"  class="label_en">${framework.frameworkName}</span>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </td>
                    <th >
                        <label class="label_en"><spring:message code='paf.newPAF.pafVersion'/></label>
                        <span data-text='col'/>
                    </th>
                    <td>
                        <select id="versionsNO" name="versionsNO" style="width:120px" readonly>
                            <c:if test="${pageType == '1' || pageType == '3'}">
                                <c:forEach items="${pafItem.versionsVo}" var="v">
                                    <c:if test="${pafItem.frameworkId==v.frameworkId}">
                                        <option value="${v.versionsNO}"></option>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${pageType == '2' || pageType == '4'}">
                                <option value="${pafItem.versionsNo}" selected="selected">${pafItem.versionsNo}</option>
                            </c:if>
                        </select>
                        <a href="javascript:void(0)" id="newPafversion" class="icon46"></a>
                        <%--<a href='javascript:void(0)' class='icon46' id="addNewPafVersion"></a>--%>
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
                               value="${pafItem.pafNameChi}" maxlength="20" class="w150 yellow" style="width:200px;"readonly/>
                    </td>
                    <th>
                        <label>
                            <div class="inblck label_en"><spring:message code="paf.newPAF.pafEngName"/></div>

                        </label>
                        <span data-text='col'/>
                    </th>
                    <td>
                        <input type="text" id="newPafEnName" name="pafName"
                               value="${pafItem.pafName}" maxlength="20" style="width:200px;" class="w150 yellow" readonly/>
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
                               style="width:160px;"class="w150 yellow" readonly/>
                    </td>
                </tr>

                <tr>
                    <th>
                        <label>
                            <spring:message code="paf.newPAF.project"/>
                            <span data-text='asterisk'/>
                        </label>
                        <span data-text='col'/>

                    </th>
                    <td>

                        <sam:select id="newPafProject" dropdownName="getPafProject" name="projectId" style="width:220px" onchange="changeCustomer()"/>

                    </td>
                    <th>
                        <label><spring:message code='paf.newPAF.pafRemarks'/></label>
                        <span data-text='col'/>
                    </th>
                    <td>
                        <c:if test="${pageType == '1' || pageType == '3'}">
                            <sam:select name="remarkId" id="newPafRemarks" dropdownName="getPafRemarks" class="w150" style="width:220px"/>
                        </c:if>
                        <c:if test="${pageType == '2' || pageType == '4'}">
                            <select name="remarkId" id="newPafRemarks" dropdownName="getPafRemarks" class="w150" style="width:220px">
                                <c:forEach items="${pafItem.pafRemarksVo}" var="remarks">
                                    <c:if test="${pafItem.remark==remarks.pafRemarksId}">
                                        <option value="${remarks.pafRemarksId}" selected="selected">${remarks.pafRemarkDesc}</option>
                                    </c:if>
                                    <c:if test="${pafItem.remark!=remarks.pafRemarksId}">
                                        <option value="${remarks.pafRemarksId}">${remarks.pafRemarkDesc}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </c:if>

                    </td>
                </tr>
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
                </tr>

            </table>
            <br><br>
            <div class="tab_cut_tit clrfix">
                <ul>
                    <li class="selected">
                        <a href="javascript:void(0);" style="width: 270px">
							<span id="box1">
								<spring:message code="paf.newPAF.downloadFPFile"/>
							</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" style="width: 220px">
							<span id="box2">
								<spring:message	code="paf.newPAF.uploadPPFile" />
							</span>
                        </a>
                    </li>

                </ul>
            </div>

            <div class="tab_cut_box">
                <div id="div_box1" class="insidePanel" title="" style="display:block;">
                    <table class="tc base_table hbod child"  border="1" cellpadding="0" cellspacing="0">
                        <thead>
                        <tr>
                            <th width="48"></th>
                            <th width="320"><spring:message code="label.newCompanion.fileName"/></th>
                            <th width="320"><spring:message code="label.newCompanion.describe"/></th>
                            <th width="96"><spring:message code="label.newCompanion.uploadDate"/></th>
                        </tr>
                        </thead>
                    </table>
                    <div style="height: 255px;width:850px;  OVERFLOW-Y:auto ;">
                        <table class="base_table hbod child" id="table_tbody1" border="1" cellpadding="0" cellspacing="0" >
                            <tbody>
                            <tr init>
                                <%--<td colspan="1"  align="center" width="48">
                                    <a href='javascript:void(0)' onclick="tablePlan.addTr(this,'init');" class='add'/>
                                    <a href='javascript:void(0)' onclick="tablePlan.deleteTr(this,'all');" class='delete'/>
                                </td>--%>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="div_box2" class="insidePanel" title="">
                    <table class="tc base_table hbod child"  border="1" cellpadding="0" cellspacing="0">
                        <thead>
                        <tr>
                            <th width="48"></th>
                            <th width="320"><spring:message code="label.newCompanion.fileName"/></th>
                            <th width="320"><spring:message code="label.newCompanion.describe"/></th>
                            <th width="96"><spring:message code="label.newCompanion.uploadDate"/></th>
                        </tr>
                        </thead>
                    </table>
                    <div style="height: 255px;width:850px;  OVERFLOW-Y:auto ;">
                        <table class="base_table hbod child" id="table_tbody2" border="1" cellpadding="0" cellspacing="0" >
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
        </div>


        <div style="position: fixed;bottom:36px; left:132px; z-index: 100;">
            <sam:Button accessControl="Y" dim="N" btnName="new_paf_save" id="saveBtn" onclick="saveNewPafProject()"
                        altKey="button.common.save"/>
        </div>
    </form>
</div>
</body>
</html>
<script type="text/javascript">
    //提示用户进行保存 ，保存后修改tabN内容
    window.serialize=[];
    /*标签是否可以切换*/
    window.confirmSave={"span":undefined,"Status":undefined};
    var hasChange = 0;
    function tab_cut_titClick(tag, beforeFunction, afterFunction) {
        // var id = $(this).children("a").children("span").attr("id");
        var before = $(".tab_cut_tit ul li.selected"),
            after = tag,
            id = after.find("span").attr("id");
        if ($.isFunction(beforeFunction)) {
            if (beforeFunction(before, after, id)) {
                ToggleTabSave(before, tag);
                return;
                /*保存Tabe 内容*/
            }
        }
        if(hasChange==0){
            toggleTabing(tag, id);
            if ($.isFunction(afterFunction)) {
                afterFunction(before, after);
            }
        }
    }


    function ToggleTabSave(saveSpan,tag){
        window.confirmSave.span = tag;
        var id = saveSpan.find("span").attr("id");
        /*$("[buttonTab='tabSave"+ (id+"").replace("box","") +"']").click();*/
        toSaveCurrTab('submitBtn');
    }

    //继续切换Tab and 将window.confirmSave.span 设置为未定义状态
    //parem isTab = false 不进行切换
    function ContinueSwitchingTab(isTab){
        if(window.confirmSave.span!=undefined && isTab != false){
            window.confirmSave.span.click();
        }
        window.confirmSave.span==undefined;
    }

    function toggleTabing(tag,id){
        $(".tab_cut_tit ul li.selected").toggleClass("selected");
        tag.toggleClass("selected");
        $(".tab_cut_box div.insidePanel").css("display","none");
        $("#div_"+id).css("display","block");
    }
    function tabClickberfore(before, after, id) {
        var beforeId = before.find("span").attr("id"),
            formDate = $("#div_"+beforeId+" input[type='text'],#div_"+beforeId+" select").serialize(),
            tab = new Number((beforeId + "").replace("box", ""));
        //單獨序列tab10中的textarea
        if(beforeId=="box10"){
            formDate = $("#supenor_Suggest").serialize();
        }

        if ((window.serialize[tab] != undefined && window.serialize[tab] != formDate)){
            hasChange =1;
            Showbo.Msg.confirm("<spring:message code='message.common.16' />","",
                function(){
                    //var id = after.find("span").attr("id");
                    ToggleTabSave(before, after);
                    toggleTabing(after, id);
                    hasChange = 0;
                },
                function(){
                    toggleTabing(after, id);
                    hasChange = 0;
                });
        }
        return false;
    }
    //頁面加載完成的入口

    //1代表新增，2代表详情
    var pageType = ${pageType};
    var pfList = ${pafList};
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

            "<input hidden  name='file2List[?].pafDocumentName'  value='0'/></td>"+

            "<td onclick='tablePlan.toChangeFile(this)' width='320px' >"+
            "<a name='file2List[?].pafDocumentName' download='' class='underline'  onclick='tablePlan.todownloadFile()' maxlength='50'  for='TRindex_LLL'  />" +
            "</a>"+
            "</td>"+

            "<td width='320px'>"+
            "<input type='text' name='file2List[?].pafDocumentDesc'  class='nobd doc_desc ieHeight'/>"+
            "</td>"+


            "<td width='96px'>"+
            "<input type='file' hidden id='TRindex_LLL' class='fileName' onchange='tablePlan.fileChange(this);' maxlength='50' name='file2List[?].files' />"+
            "<input type='text' readonly='readonly' name='file2List[?].fileCrd' style='width:90%;' class='nobd' />"+
            "<input type='text' hidden name='file2List[?].pafDocumentName'  />"+
            "</td>" +
            "</tr>",
        tab_TR2:
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
            "<input type='text' readonly='readonly' name='fileList[?].fileCrd' style='width:90%;' class='nobd' />"+
            "<input type='text' hidden name='fileList[?].pafDocumentName'  />"+
            "</td>" +
            "</tr>",
        /**
         * 根據當前顯示的tab，添加相應的行
         * */
        addTr:function (e, init){
            var text = $(".tab_cut_tit ul li.selected span").attr("id");
            var $tab_TR ;
            if (text == "box1"){
                $tab_TR = $(this.tab_TR);

            }else if (text == "box2"){
                $tab_TR = $(this.tab_TR2);

            }
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
                        if(key === "pafDocumentName") {
                            trd.find("a[name*='" + "pafDocumentName" + "']").addClass("underline");
                            trd.find("a[name*='"+"pafDocumentName"+"']").attr("href",tablePlan.basePath+"newFRAPAF.do?action=downloadDocFile&pafDocumentName="+list[i].pafDocumentName+ "&pafId="+"${pafItem.pafId}");
                            trd.find("a[name*='" + "pafDocumentName" + "']").text(list[i][key]);
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
                            console.log(pageType);
                            if(pageType == "1"){
                                trd.find("a[name*='" + "pafDocumentName"+"']").attr("href",tablePlan.basePath+"newProjectPAF.do?action=downloadProjectPafDocFile&pafDocumentName="+list[i].pafDocumentName+"&pafId="+list[i].pafId+"&projectId="+list[i].projectId);
                            }else{
                                trd.find("a[name*='" + "pafDocumentName"+"']").attr("href",tablePlan.basePath+"newProjectPAF.do?action=downloadProjectPafDocFile&pafDocumentName="+list[i].pafDocumentName+"&pafId="+"${pafItem.pafId}"+"&projectId="+list[i].projectId);
                            }
                        }
                        if(key === "lud"){
                            trd.find("input[name*='" + "fileCrd" + "']").val(changeTime(formatUTC(list[i][key])));
                        }continue;
                    }

                }

            }
        },
        toShowPafData:function (formName, list,tabTR){
            if (list !== undefined){
                for(var i =0;i<list.length;i++){
                    var $tab_TR = $(tabTR);
                    $("#"+formName+" tr[init]").before($tab_TR);
                    var trd = $("#" + formName + " tr[context]").eq(i);
                    for(var key in list[i]){
                        if(key ==="files") continue;
                        if(key === "pafDocumentName") {
                            trd.find("a[name*='" + "pafDocumentName" + "']").addClass("underline");
                            trd.find("a[name*='"+"pafDocumentName"+"']").attr("href",tablePlan.basePath+"newProjectPAF.do?action=downloadProjectPafDocFile&pafDocumentName="+list[i].pafDocumentName+"&pafId="+list[i].pafId+"&projectId="+list[i].projectId);
                            trd.find("a[name*='" + "pafDocumentName" + "']").text(list[i][key]);
                        }
                        trd.find("[name*='"+key+"']").val(list[i][key]);
                        if(key === "lud"){
                            trd.find("input[name*='" + "fileCrd" + "']").val(changeTime(formatUTC(list[i][key])));
                        }continue;
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
                //window.event.cancelBubble = true;
            })
        }

    };


    //初始化jsp，设置不可编辑项目
    $(function () {
        $(".tab_cut_tit ul li").click(function () {
            tab_cut_titClick($(this), tabClickberfore)
        });
        $("input[name='frameworkId']").attr("disabled","disabled");
        $("#versionsNO option:first").prop("selected", 'selected');
        $("#versionsNO").attr("disabled","disabled");
        if(pageType != '4'){
            $(".wrapper").addClass('hidden');
            $("#editFRA").addClass('hidden');
            $('#deleteFRA').addClass('hidden');
        }
        if(pageType == '4'){
            $("#newPafProject").val("${pafItem.projectId}")
            $("#customerName").val("${customer.customerNameChi}")
        }
        //$('#newPafversion').addClass('hidden');

        getPafList();
        //給frameworkPaf賦初始值
        if(pageType == '2' || pageType == '4'){
            var value1= $("#pafList").find("option[idInfo='${pafItem.pafId}']").attr("value");
            $("#currentPafName").val(value1)
        }
        //從檢視列表跳轉過來時，也需要重新加載數據
        if('${document}'.length>2?true:false){
            tablePlan.toShowData("table_tbody1",${document},tablePlan.tab_TR);
        }
        //检视项目PAF 需要展示上载paf列表
        if(pageType == '4'){
            if('${pafDocument}'.length>0?true:false){
                tablePlan.toShowPafData("table_tbody2",${pafDocument},tablePlan.tab_TR2);
            }
        }

        $('#table_tbody').find("td:eq(0)").hide();
        $('#newPafTable_thead').find("th:eq(0)").hide();
        var pafStatus = $("#pafStatus").val();
        BottonIFWhether(false,$("#saveBtn"));
        if (pafStatus == "已使用") {
            BottonIFWhether(true,$("#useBtn"));
        }else{
            BottonIFWhether(false,$("#useBtn"));
        }
    });

    function pafChange(value) {
        $('#versionsNO').empty();
        $('#newPafRemarks').empty();
        $('#table_tbody1').find("tr[context]").remove();
        $('#table_tbody2').find("tr[context]").remove();
        var option = $("#pafList").find("option[value='"+value+"']");
        var info = JSON.parse(option.attr("info"));
        if (info != undefined){
            var jsonObj = info;
            $("input[type='radio']").each(function () {
                if(this.defaultValue == jsonObj.frameworkId){
                    $("input[type=radio][value= "+jsonObj.frameworkId+"]").prop("checked",true)
                }
            })
            $("#newPafNo").val(jsonObj.pafId)
            $("#newPafName").val(jsonObj.pafNameChi)
            $("#newPafEnName").val(jsonObj.pafName)
            $("#newPafBpwinNo").val(jsonObj.bpwinNo)
            $("#versionsNO").append("<option value='" + jsonObj.versionsNo + "' selected=\"selected\" >" +jsonObj.versionsNo + "</option>");
            //此处这样处理，是因为后端所传的对象不一样
            if(pageType == '1'|| pageType == '2'){
                if(jsonObj.pafRemarks != undefined){
                    $("#newPafRemarks").append("<option value='" + jsonObj.pafRemarks.pafRemarksId + "' selected=\"selected\" >" + jsonObj.pafRemarks.pafRemarkDesc + "</option>");
                }else{
                    $("#newPafRemarks").append("<option value='" + 0 + "' selected=\"selected\" ></option>");
                }
            }else{
                if(jsonObj.pafRemarksVo != undefined){
                    $("#newPafRemarks").append("<option value='" + jsonObj.pafRemarksVo.pafRemarksId + "' selected=\"selected\" >" + jsonObj.pafRemarksVo.pafRemarkDesc + "</option>");
                }else{
                    $("#newPafRemarks").append("<option value='" + 0 + "' selected=\"selected\" ></option>");
                }
            }
            if(jsonObj.fileList != undefined){
                tablePlan.toShowData("table_tbody1",jsonObj.fileList,tablePlan.tab_TR);
            }
        }
        //检视项目PAF 才有此处
        if(pageType == '3' || pageType == '4'){
            var pafId = info.pafId;
            var projectId = info.projectVo.projectId;
            $.ajax({
                url: '${basePath}searchProjectPAF.do?action=searchProjectPafDoc&pafId='+pafId+'&projectId='+projectId+'',
                type: 'POST',
                dataType: "json",//预期服务器返回的类型c
                contentType: false,
                success: function (data) {
                    tablePlan.emptyFile("table_tbody2");
                    tablePlan.toShowPafData("table_tbody2",data.projectPafDocumentVo.fileList,tablePlan.tab_TR2);
                },
            })
        }
    }

    function getPafList(){
        var obj = ${pafList};
        for(var j = 0 ; j < obj.length; j++){
            var chiValue = obj[j].pafNameChi === undefined?obj[j].pafName: obj[j].pafNameChi;
            var value = chiValue +"/"+ obj[j].frameworkName +"/"+ obj[j].versionsNo +"/"+obj[j].bpwinNo;
            var option = "<option value='"+value+"' idInfo='"+obj[j].pafId+"'>"+value+"</option>";
            var Joption = $(option);
            Joption.attr("info",JSON.stringify(obj[j]));
            $("#pafList").append(Joption);
        }
    }

    function changeCustomer(){
        //先进行填入客户信息
        var selectValue = $("#newPafProject").val()
        var projectId
        //检视项目PAF才需要进行筛选
        if(pageType == '3' || pageType == '4'){
            clearPafData();
        }
        if (selectValue !== "0"){
            var info = $("#newPafProject").find("option:selected").attr("info");
            if (info != undefined){
                var jsonObj = JSON.parse(info);
                projectId = jsonObj.projectId;
                $("#customerName").val(jsonObj.customerNameChi);
                $("#newPafCustomer").val(jsonObj.customerId);
            }
            if(pageType == '3' || pageType =='4'){
                //进一步筛选projectId为限制条件筛选pafList
                $('#pafList').empty();
                $("input[list='pafList']").val("");
                var obj = ${pafList}
                for(var j = 0 ; j < obj.length; j++){
                    if(obj[j].projectVo.projectId == projectId){
                        var chiValue = obj[j].pafNameChi === undefined?obj[j].pafName: obj[j].pafNameChi;
                        var value = chiValue +"/"+ obj[j].frameworkName +"/"+ obj[j].versionsNo +"/"+obj[j].bpwinNo;
                        var option = "<option value='"+value+"' idInfo='"+obj[j].pafId+"'>"+value+"</option>";
                        var Joption = $(option);
                        Joption.attr("info",JSON.stringify(obj[j]));
                        $("#pafList").append(Joption);
                    }
                }
            }

        }else{
            //空白重置
            if(pageType == '3' || pageType =='4'){
                $("input[list='pafList']").val("");
                getPafList()
            }
            $("#customerName").val('');
            $("#newPafCustomer").val('');
        }

    }

    function  clearPafData() {
        $("#newPafNo").val('');
        $("#newPafName").val('');
        $("#newPafEnName").val('');
        $("#newPafBpwinNo").val('');
        $("#versionsNO").val('');
        $("#newPafRemarks").val('');
        tablePlan.emptyFile("table_tbody1");
        tablePlan.emptyFile("table_tbody2");

    }

    //表單的验证
    function valifyFormData1() {
        var error = "";

        //验证PAF的中文名和英文名至少输入一个
        if (!$("#newPafName").val() && !$("#newPafEnName").val()) {
            error += "<spring:message code='message.common.31' />" + "\r\n";
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

        if($("#customerName").val()=== ""){
            error += "<spring:message code='paf.message.09' />" + "\r\n";
        }


        var  $tabtr =  $('#table_tbody').find("tr[context]");
        for(var j = 0; j < $tabtr.length;j++){
            var txt = $tabtr.eq(j).find("a[name*='pafDocumentName']").text();
            if (txt.trim() === ""){
                error +="<spring:message code='paf.message.03' />\n";
                break;
            }
        }

        return error;
    }


    //提交表單（頁面上“save”按鈕）
    $("#saveBtn").click(function(){
        var error = valifyFormData1();
        if (error !== "") {
            alert(error);
            return;
        }
        //验证表单1
        var error = valifyFormData1();
        if (error !== "") {
            alert(error);
            return;
        }
        var formData1 = tablePlan.getUpdateSerialize();
        formData1.append("action", "saveNewPafProject");
        formData1.append("projectId",$("#newPafCustomer").val())
        formData1.append("cru","${pafItem.cru}")
        formData1.append("pafNo",$('#newPafNo').val())
        formData1.append("versionsNo",$("#versionsNO option:first").val())

        //序列化表单1的值
        $.ajax({
            url: "newProjectPAF.do",
            type: 'POST',
            data: formData1,
            cache: false,
            contentType: false, //不设置内容类型
            processData: false, //不处理数据type: 'post',
            datType: 'json',
            success: function (data) {
                var info = $("#newPafProject").find("option:selected").attr("info");
                var projectId = JSON.parse(info).projectId;
                if (data.code === 200) {
                    if ( data.data != null){
                        tablePlan.emptyFile("table_tbody2");
                        tablePlan.updateData("table_tbody2",data.data.projectPafDocumentVo.fileList);
                    }
                    //window.location.href="${basePath}searchProjectPAF.do?action=viewProjectPaf&pafId="+$('#newPafNo').val()+"&projectId="+projectId+"";
                    Showbo.Msg.alert(data.msg);
                }else{
                    Showbo.Msg.alert(data.msg);
                }

            }, error: function () {
                alert("<spring:message code='paf.message.02'/>");
            }
        });

    });

    $('input:radio[name="frameworkId"]').change(function(){
        $('#versionsNO').empty();
        var frameworkid = $('input:radio[name="frameworkId"]:checked').val();

        var frameworks = [];
        var versions = [];

        <c:forEach items="${pafItem.versionsVo}" var="v">
        frameworks.push("${v.frameworkId}");
        </c:forEach>
        <c:forEach items="${pafItem.versionsVo}" var="v">
        versions.push("${v.versionsNO}");
        </c:forEach>

        for(var i in frameworks){
            if(frameworks[i]===frameworkid) {
                $("#versionsNO").append("<option value='" + versions[i] + "'>" + versions[i] + "</option>");
            }
        }
    });
    //日期轉換回顯
    function formatUTC(t) {
        if(t.indexOf('T')!==-1){
            var y,h; //年份,时间
            var regH = /([T ])(\d\d:\d\d:\d\d)(\.\d+)?/;// 校验时间格式
            h = t.match(regH);
            h = h&&h[2]; //拿到时分秒
            y = t.slice(0,t.indexOf('T')+1); //截取年月日
            var timestamp = new Date(Date.parse(y.slice(0,-1)+' '+h)).getTime() / 1000;
            off = new Date().getTimezoneOffset() / 60; //当前时差
            timestamp -= off * 60 * 60;
            return new Date(parseInt(timestamp) * 1000);
        }
        return new Date(t.replace(/\-/g,'/'));
    }

    function changeTime(time) {
        //var d = new Date('Thu May 12 2016 08:00:00 GMT+0800 (中国标准时间)');
        return p(time.getFullYear()) + '/' + p(time.getMonth() + 1) + '/' + p(time.getDate());
    }

    function p(s) {
        return s < 10 ? '0' + s : s
    }
    //可编辑移除遮罩
    function editProjectPaf(){
        $(".wrapper").addClass('hidden');
        $("#editFRA").addClass('hidden');
        changeMenuName("修改项目 PAF")
    }
    //刪除PAF文件
    function deleteProjectPaf() {
        //隱藏遮罩
        $(".wrapper").addClass('hidden');
        Showbo.Msg.confirm("确认删除该PAF文件？","",function () {
            $.ajax({
                url: '${basePath}searchProjectPAF.do?action=deleteProjectPaf&pafId=${pafItem.pafId}&projectId=${pafItem.projectId}',
                type: 'POST',
                dataType: "json",//预期服务器返回的类型c
                contentType: false,
                success: function (data) {
                    if (data.code === 200) {
                        Showbo.Msg.alert(data.msg)
                        window.location.href="${basePath}searchProjectPAFList.do";
                    }else{
                        Showbo.Msg.alert(data.msg)
                    }
                },
                error: function () {
                    Showbo.Msg.alert("<spring:message code='newProjectPaf.saveFailed' />");
                }
            })
        }),function(){

            $(".wrapper").removeClass('hidden');
        }

    }
</script>

