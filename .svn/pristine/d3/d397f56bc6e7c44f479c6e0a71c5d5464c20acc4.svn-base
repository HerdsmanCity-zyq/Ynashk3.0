<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sam" uri="WEB-INF/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../includestatic.jsp"></jsp:include>
    <style type="text/css">
        .clear {clear: both; zoom: 1}
        .hidden{display: none}
    </style>
    <script type="text/javascript">

        function revise(staff_code) {
            window.location.href = "newUser.do?staffCode=" + staff_code;
        }
        $(function(){
            new control("ca");

        });

        Date.prototype.Format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "H+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }

        function getOnJobAge(type){
            var obj=$("#"+type);
            var onJobAge="";
            var startDate=$("#inductionDate").val();
            var endDate=$("#dimissionDate").val();
            var currentDate=new Date().Format("yyyy/MM/dd");
            var sDate  = new Date(Date.parse(startDate.replace(/-/g, "/")));
            var eDate  = new Date(Date.parse(endDate.replace(/-/g, "/")));
            var date1 = new Date(sDate);
            var date2 = new Date(currentDate);
            var date3 = "";
            var date4 = new Date(eDate);
            if(date4.getTime()<date2.getTime()) {
                date3 = date4.getTime()-date1.getTime();
                onJobAge=Math.floor(date3/(24*3600*1000*365));
                $("#onJobAge").attr("value",onJobAge);
            }else {
                date3=date2.getTime()-date1.getTime();
                onJobAge=Math.floor(date3/(24*3600*1000*365));
                $("#onJobAge").attr("value",onJobAge);
            }
        }

        function save(status){
            var chineseName = document.getElementById("chiName").value;
            var englishName = document.getElementById("engName").value;
            var inductionDate1 = document.getElementById("inductionDate").value;
            var email1 = document.getElementById("email").value;
            var telephoneNo1 = document.getElementById("telephoneNo").value;
            var skype1 = document.getElementById("skype").value;
            var position1 = document.getElementById("position").value;
            var department1 = document.getElementById("department").value;
            if(inductionDate1 === ""||inductionDate1 === null){
                Showbo.Msg.alert("入職日期不能為空")
                return false;
            }
            if((chineseName === ""||chineseName === null)&&(englishName === ""||englishName === null)){
                Showbo.Msg.alert("中文名字或EngName必須填寫一個");
                return false;
            }
            if(email1 === ""||email1 === null){
                Showbo.Msg.alert("郵電不能為空")
                return false;
            }
            if(telephoneNo1 === ""||telephoneNo1 === null){
                Showbo.Msg.alert("手機號碼不能為空且必須為8位或11位")
                return false;
            }
            if(skype1 === ""||skype1 === null){
                Showbo.Msg.alert("Skype不能為空")
                return false;
            }
            if(department1 === "0"||department1 === ""||department1 === null){
                Showbo.Msg.alert("部門不能為空")
                return false;
            }

            if(position1 === "0"||position1 === ""||position1 === null){
                Showbo.Msg.alert("職位不能為空")
                return false;
            }
            var message=Check();
            var dimissionDate1 = document.getElementById("dimissionDate").value;
            if(status === "已離職"){
                if(dimissionDate1 === ""|| dimissionDate1 === null){
                    Showbo.Msg.alert("必須填寫離職日期");
                    return;
                }
            } else if(status === "在職中"){
                $("#dimissionDate").val("")
            }
            if(message==""){
                //获取值
                var data=getData(status);
                $.post("newStaff.do?action=newStaff",data,function(message){
                    var vmessage=JSON.parse(message);
                    if(vmessage.status=='success'){
                        $("#staffStatus").val(vmessage.staffVo.staffStatus);
                        if(vmessage.staffVo.staffStatus === "已保存" ){
                            BottonIFWhether(true,$("#dimission"));
                            BottonIFWhether(false,$("#induction"));
                            show();
                            $(".icon42").addClass('hidden');
                        }else if(vmessage.staffVo.staffStatus === "在職中"){
                            BottonIFWhether(false,$("#dimission"));
                            BottonIFWhether(true,$("#induction"));
                            show();
                        }else if(vmessage.staffVo.staffStatus === "已離職"){
                            BottonIFWhether(true,$("#dimission"));
                            BottonIFWhether(false,$("#induction"));
                            hidden();
                        }
                        $("#old").val(vmessage.old);
                        if(vmessage.message=="<spring:message code='newStaff.succ' />"){
                            $("#staffCode").attr("value",vmessage.staffVo.staffCode);
                        }
                        $("#lastUpdateDate").val(vmessage.staffVo.yz_last_up_date);
                        Showbo.Msg.alert(vmessage.message);
                    }else{
                        if(vmessage.Identity!=undefined){
                            Showbo.Msg.alert(vmessage.Identity);
                            return;
                        }
                        Showbo.Msg.alert(vmessage.message);
                    }
                });
            }else{
                Showbo.Msg.alert(message);
            }
        }

        function Check(){
            var message="";
            message +=validataEmail($("#email").val(),"<spring:message code='newStaff.emailAddress'/>",true);
            message +=validateNumEnglish($("#personCode").val(),$("#person_code_text").text());
            message +=validtaPhone($("#telephoneNo").val(),"<spring:message code='newStaff.telephone_No' />",true);
            message +=validataChinese($("#skype").val(),"<spring:message code='newStaff.skype' />",true);
            message +=validataChinese($("#wechat").val(),"<spring:message code='newStaff.wechat' />");
            return message;
        }

        function CheckPerson(){
            var message="";
            message +=validataEmail($("#personemail").val(),"<spring:message code='newStaff.emailAddress'/>",true);
            message +=validtaPhone($("#persontelephoneNo").val(),"<spring:message code='newStaff.telephone_No' />",true);
            message +=validataChinese($("#personskype").val(),"<spring:message code='newStaff.skype' />",true);
            message +=validataChinese($("#personwechat").val(),"<spring:message code='newStaff.wechat' />");
            return message;
        }

        function getData(status){
            var data ;
            var position = document.getElementById("position").value;
            var personCode = document.getElementById("personCode").value;
            var department = document.getElementById("department").value;
            var staffStatus = document.getElementById("staffStatus").value;
            if(staffStatus ==="已離職"){
                data = $("#newStaff").serialize()+"&staffStatus="+status+"&personCode="+personCode+
                    "&position="+position+"&department="+department+"&action=newStaff";
            }else {
                data = $("#newStaff").serialize()+"&staffStatus="+status+"&action=newStaff";
            }
            return data;
        }

        function getPersonData() {
            var data = $("#person").serialize();
            return data;
        }

        var staffDepartmentAndPositonList = JSON.parse('${staffDepartmentAndPositonList}');
        $(function(){
            var personCodes = '${staff.personCode}';
            if (personCodes.trim() !== ""){
                $("#personCode").val(personCodes);
                $("#personCode").trigger("onchange");
            }
            $("#department").change();
            $("#position").val('${staff.position }');
            var staffStatus = $("#staffStatus").val();
            if(staffStatus === "已保存" ){
                BottonIFWhether(true,$("#dimission"));
                BottonIFWhether(false,$("#induction"));
                $(".icon42").addClass('hidden');
            }else if(staffStatus === "在職中"){
                BottonIFWhether(false,$("#dimission"));
                BottonIFWhether(true,$("#induction"));
            }else if(staffStatus === "已離職"){
                BottonIFWhether(true,$("#dimission"));
                BottonIFWhether(false,$("#induction"));
                hidden();
            }
        });

        function show(){
            $(".icon42").removeClass('hidden');
            $("#personCode").removeAttr("disabled");
            $('.icon52').removeClass('hidden');
            $("#department").removeAttr("disabled","disabled");
            $("#position").removeAttr("disabled","disabled");
        }
        function hidden(){
            $(".icon42").addClass('hidden');
            $("#personCode").attr("disabled","disabled");
            $('.icon52').addClass('hidden');
            $("#department").attr("disabled","disabled");
            $("#position").attr("disabled","disabled");
        }
        function changeDepartment(el){
            var department_id = $(el).val().trim();
            $("#position").empty();
            $("#position").append("<option value='0'></option>");
            for(var i in staffDepartmentAndPositonList){
                if(staffDepartmentAndPositonList[i].staffDepartmentCode==department_id){
                    var staffPositionVoList = staffDepartmentAndPositonList[i]["staffPositionList"];
                    for(var j in staffPositionVoList){
                        var vo = staffPositionVoList[j];
                        $("#position").append("<option value="+vo.positionId+" >"+vo.positionChiName+"</option>");
                    }
                    break;
                }
            }
        }

        function setAge(jeDate){
            var date = new Date();
            if(jeDate.indexOf("-")>-1)
                jeDate = jeDate.split("-");
            else
                jeDate = jeDate.split("/");
            var YearJ = 0;
            if(((date.getMonth()+1 - new Number(jeDate[1])))>6){
                YearJ=1;
            }
            $("#age").val((date.getFullYear() - jeDate[0])+YearJ);
        }

        /**
         * 数据填充
         * @param val
         */
        function fill(val) {
            var personCode = $(val).val().trim();
            var info = $("#personCode option:selected").attr("info");
            if (personCode !== "0"){
                if (info !== ""){
                    var jsonObj = JSON.parse(info);
                    for(var i in jsonObj){
                        if (i === "sex"){
                            $("input[name='sex']").removeAttr("checked");
                            $("input[name='sex'][value='"+jsonObj[i]+"']").prop("checked",'checked');
                        }else{
                            $("#person").find("[name*='"+i+"']").val(jsonObj[i]);
                        }
                    }
                    for(var i in jsonObj){
                        $("#newStaff").find("[name*='"+i+"']").val(jsonObj[i]);
                    }
                }
            }else{
                $("#person").find("input").val("");
                $("#person").find("select").val("");
            }
        }

        function fillPersonAfterSucc(message) {
            var jsonObj=JSON.parse(message);
            var curOption = $("#personCode").find("option[value='"+jsonObj.personVo.personCode+"']");
            if(curOption.length === 0){
                var html = $("<option></option>");
                html.attr("info",JSON.stringify(jsonObj.personVo));
                html.attr("value",jsonObj.personVo.personCode);
                html.text(jsonObj.personVo.personCode1);
                $("#personCode").append(html);
            }else{
                curOption.attr("info",JSON.stringify(jsonObj.personVo));
                curOption.attr("value",jsonObj.personVo.personCode);
                curOption.text(jsonObj.personVo.personCode1);
            }
            $("#personCode").val(jsonObj.personVo.personCode);
            $("#personCode").trigger("onchange");
            $("#lastUpdateDate1").val(jsonObj.personVo.yz_last_up_date);
            $("#chiName").val(jsonObj.personVo.chiName);
            $("#engName").val(jsonObj.personVo.engName);
            $("#telephoneNo").val(jsonObj.personVo.telephoneNo);
            $("#email").val(jsonObj.personVo.email);
            $("#wechat").val(jsonObj.personVo.wechat);
            $("#skype").val(jsonObj.personVo.skype);
            CloseDiv();
        }

        /**
         * 保存回填
         */
        function backfill() {
            var chineseName = document.getElementById("personchiName").value;
            var englishName = document.getElementById("personengName").value;
            var val = document.getElementById("personCode").value;
            var data = getPersonData();
            var message = CheckPerson();
            if((chineseName == ""||chineseName == null)&&(englishName == ""||englishName == null)){
                Showbo.Msg.alert("中文名字或EngName必須填寫一個");
                return;
            }
            if(message==""){
                if(val===''||val===null){
                    $.post("newStaff.do?action=addStaffPersonData",data,function (message) {
                        fillPersonAfterSucc(message);
                    })
                }else {
                    $.post("newStaff.do?action=updateStaffPersonData",data,function (message) {
                        fillPersonAfterSucc(message);
                    })
                }

            }else{
                Showbo.Msg.alert(message);
            }


        }
        $(function(){
            $("#inductionDate").on("click",function(){
                WdatePicker({lang:"${lang eq 'en_US' ? 'en' : 'zh-tw' }",el:$dp.$($(this).prop("id")),dateFmt:'yyyy-MM-dd',isShowClear:true,maxDate:'#F{$dp.$D(\'dimissionDate\')}'});
            });
            $("#dimissionDate").on("click",function(){
                WdatePicker({lang:"${lang eq 'en_US' ? 'en' : 'zh-tw' }",el:$dp.$($(this).prop("id")),dateFmt:'yyyy-MM-dd',isShowClear:true,minDate:'#F{$dp.$D(\'inductionDate\')}'});
            });
            $("#dob").on("click",function(){
                WdatePicker({lang:"${lang eq 'en_US' ? 'en' : 'zh-tw' }",el:$dp.$($(this).prop("id")),dateFmt:'yyyy-MM-dd',isShowClear:true,maxDate:'%y-%M-%d'});
            });
        });
        //弹出隐藏层
        function ShowDiv() {
            document.getElementById("docDiv").style.display = 'block';
            //設置頁面樣式
            $(".cover").css("display", "block");
            BottonIFWhether(true,$("#backBtn"));
            BottonIFWhether(true,$("#save"));
            BottonIFWhether(true,$("#induction"));
            BottonIFWhether(true,$("#dimission"));

        };
        //关闭弹出层
        function CloseDiv() {
            document.getElementById("docDiv").style.display = 'none';
            $(".cover").css("display", "none");
            BottonIFWhether(false,$("#backBtn"));
            BottonIFWhether(false,$("#save"));
            BottonIFWhether(false,$("#induction"));
            BottonIFWhether(false,$("#dimission"));

        };

        //提示用户进行保存 ，保存后修改tab内容
        window.serialize=[];
        $(function(){
            window.serialize[0]=$("#newStaff").serialize();
            $(".sub:first").hide();
        });

        function toDoBack(){
            if (window.serialize[0]=== $("#newStaff").serialize()){
                CloseDiv();
            }else{
                Showbo.Msg.confirm("<spring:message code='message.common.45'/>","",function () {
                    save('已保存');
                },function () {
                    doBack();
                })
            }
        };

    </script>
</head>
<body >
<input type="hidden" id="old"/>
<jsp:include page="../../menu.jsp" />
<div onclick="getOldMenu();" class="clrfix pa h_canvas">
    <div class="cont">
        <div class="add_box">
            <form action="" id="newStaff">
                <input type="hidden" value="${staff.lud2}" name="yz_last_up_date" id="lastUpdateDate"/>
                <table class="add_tab" border="0" cellpadding="0" cellspacing="0">
                    <!-- 1-->
                    <tr>
                        <th align="left">
                            <label><%--員工編號 --%>
                                <spring:message code="newStaff.staff_code" />
                                <span data-text='asterisk' />
                            </label>
                            <span data-text='col' />
                        </th>
                        <td >
                            <input type="text" name="staffCode" id="staffCode" readonly="readonly" style="width: 128px" class="yellow cont_num_en" value="${staff.staffCode }"/>
                        </td>
                        <!-- 中文名字 -->
                        <th align="left">
                            <label id="chi_Name_text">
                                <spring:message code="newStaff.chi_Name" />
                            </label>
                            <span data-text='col'/>
                        </th>
                        <td><input  type="text" maxlength="40" name="chiName" id="chiName" style="width:128px" value="${staff.chiName}"/>
                        </td>

                        <!-- 电邮-->
                        <th align="left">
                            <label id="email_text"><spring:message code="newStaff.emailAddress"/><span data-text='asterisk'/>
                            </label>
                            <span data-text='col'/>
                        </th>
                        <td>
                            <input style="width: 256px" type="text" maxlength="40" name="email" id="email" value="${staff.email}"/>
                        </td>
                        <!-- 状态-->
                        <th align="left">
                            <label id="staff_status">
                                <spring:message code="newStaff.staffStatus"/>
                            </label>
                            <span data-text='col'/>
                        </th>
                        <td>
                            <input style="width:96px" type="text" readonly="readonly" class="yellow cont_num_en"
                                   maxlength="40" name="staffStatusa" id="staffStatus" value="${staff.staffStatus}"/>
                            <i class="icon42" onclick="revise('${staff.staffCode}')"></i>

                        </td>
                    </tr>
                    <!-- 2-->
                    <tr>
                        <!-- 人物编号 -->
                        <th align="left">
                            <label id="person_code_text"><spring:message code="newStaff.person_code" />
                            </label>
                            <span data-text='col' /></th>
                        <td>
                            <sam:select dropdownName="getPersonCode"  name="personCode" id="personCode" style="width:112px"
                                        onchange="fill(this)"/>
                            <i style="cursor:pointer;" class="icon52" onclick="ShowDiv() "></i>
                        </td>
                        <%--ENG Name--%>
                        <th align="left">
                            <label id="english_name">
                                <spring:message code="newStaff.EngName" />
                            </label>
                            <span data-text='col' />
                        </th>
                        <td>
                            <input style="width: 256px" type="text" maxlength="40" name="engName" id="engName" value="${staff.engName}"/>
                        </td>
                        <%--手机号码--%>
                        <th align="left">
                            <label id="telephone_No_text">
                                <spring:message code="newStaff.telephone_No" />
                                <span data-text='asterisk'/>
                            </label>
                            <span data-text='col' />
                        </th>
                        <td>
                            <input style="width: 128px"  type="text" maxlength="40" name="telephoneNo" id="telephoneNo" value="${staff.telephoneNo}"/>
                        </td>
                    </tr>
                    <!-- 3-->
                    <tr>
                        <!-- 部門-->
                        <th align="left">
                            <label id="department_text">
                                <spring:message code="newStaff.department" />
                            </label>
                            <span data-text='col' />
                        </th>
                        <td>
                            <sam:select id="department" maxlength="15"  name="department" class="tr" style="width:112px"
                                        dropdownName="GetStaffDepartment" onchange="changeDepartment(this)"
                                        where="AREA" plsSelectText="nwp.contact.informat.region" value="${staff.department }"/>
                        </td>
                        <%--暱稱--%>
                        <th align="left">
                            <label id="nickname_text">
                                <spring:message code="newStaff.nickname" />
                            </label>
                            <span data-text='col' />
                        </th>
                        <td>
                            <input style="width: 128px" type="text" maxlength="40" name="nickname" id="nickname" value="${staff.nickname}"/>
                        </td>
                        <%--Skype--%>
                        <th align="left">
                            <label id="skype_text">
                                <spring:message code="newStaff.skype" />
                                <span data-text='asterisk'/>
                            </label>
                            <span data-text='col' />
                        </th>
                        <td>
                            <input style="width: 128px" type="text" maxlength="40" name="skype" id="skype" value="${staff.skype}"/>
                        </td>
                    </tr>
                    <!-- 4-->
                    <tr>
                        <!-- 職位-->
                        <th align="left">
                            <label id="position_text">
                                <spring:message code="newStaff.position" />
                                <span data-text='asterisk'/>
                            </label>
                            <span data-text='col' />
                        </th>
                        <td>
                            <span class="m150">
                                <sam:select id="position" maxlength="15"  name="position" class="tr" style="width:112px"
                                            dropdownName="GetStaffPosition" plsSelectText="nwp.contact.informat.region"
                                            value="${staff.position }"/>
			    	 		</span>
                        </td>
                        <!-- 離職日期 -->
                        <th>
                            <label id="dimission_date_text">
                                <spring:message code="newStaff.dimission_date"/>
                            </label>
                            <span data-text='col'/>
                        </th>
                        <td>
                            <input type="text" id="dimissionDate" name="dimissionDate"
                                   class="calendar_bg cont_num_en" onblur="getOnJobAge('dimissionDate')"
                                   value="${staff.dimissionDate }"/>
                        </td>
                        <%--微信號--%>
                        <th align="left">
                            <label id="wechat_text">
                                <spring:message code="newStaff.wechat" />
                            </label>
                            <span data-text='col' />
                        </th>
                        <td>
                            <input style="width: 128px" type="text" maxlength="40" name="wechat" id="wechat" value="${staff.wechat}"/>
                        </td>
                    </tr>
                    <!-- 5-->
                    <tr>
                        <!-- 入職日期 -->
                        <th>
                            <label id="induction_date_text">
                                <spring:message code="newStaff.inductionDate"/>
                                <span data-text='asterisk'/>
                            </label>
                            <span data-text='col'/>
                        </th>
                        <td>
                            <input type="text" id="inductionDate" name="inductionDate"
                                   class="calendar_bg cont_num_en" onblur="getOnJobAge('inductionDate')"
                                   value="${staff.inductionDate }"/>
                        </td>
                        <th>
                            <label><!-- 在職年期 -->
                                <spring:message code="newStaff.onJobAge"/>
                            </label>
                            <span data-text='col'/>
                        </th>
                        <td>
                            <input type="text" name="onJobAge" id="onJobAge" readonly="readonly" class="yellow cont_num_en" value="${staff.onJobAge }"/>
                        </td>
                    </tr>

                </table>
                <br />
            </form>
        </div>

        <div class="sub">
            <sam:Button accessControl="N" altKey="button.common.back"  onclick="toDoBack()"  id="backBtn"/>
            <sam:Button accessControl="Y" dim="N" btnName="new_staff_save" onclick="save('已保存')" altKey="button.common.save" id="save"/>
            <sam:Button accessControl="Y" dim="N" btnName="new_staff_save" onclick="save('在職中')" altKey="button.common.induction" id="induction"/>
            <sam:Button accessControl="Y" dim="N" btnName="new_staff_save" onclick="save('已離職')" altKey="button.common.dimission" id="dimission"/>
        </div>
    </div>
    <div class="cover" style="display: none"></div>
</div>
<!-- 新增人物资料-->
<div id="docDiv" name="docDiv"  class="docDivCla" style="width: auto;">
    <div style="height:235px;background: white;margin:10px;">
        <form action="" id="person">
            <input type="hidden" value="${personVo.lud2}" name="yz_last_up_date" id="lastUpdateDate1"/>
            <table class="add_tab" border="0" cellpadding="0" cellspacing="0" style="margin:5px;">
                <!-- 1-->
                <tr>
                    <th align="left">
                        <label><%--人物編號 --%>
                            <spring:message code="newStaff.person_code" />
                        </label>
                        <span data-text='col' />
                    </th>
                    <td>
                        <input type="text" name="personCode" id="personCode" readonly="readonly" class="tr yellow cont_num_en" value="${staff.personCode}" />
                    </td>
                    <!-- 中文名字 -->
                    <th align="left">
                        <label id="person_chi_Name_text">
                            <spring:message code="newStaff.chi_Name" />
                        </label>
                        <span data-text='col'/>
                    </th>
                    <td><input  type="text" maxlength="40" name="chiName" id="personchiName" style="width:128px;" value="${staff.chiName}"/>
                    </td>
                    <%--ENG Name--%>
                    <th align="left">
                        <label id="english_name_text">
                            <spring:message code="newStaff.EngName" />
                        </label>
                        <span data-text='col' />
                    </th>
                    <td>
                        <input style="width: 256px" type="text" maxlength="40" name="engName" id="personengName" value="${staff.engName}"/>
                    </td>
                <tr/>
                <%--2--%>
                <%--性别--%>
                <tr>
                    <th align="left">
                        <label id="sex_radio">
                            <spring:message code="label.newCompanion.sex" />
                        </label>
                        <span data-text='col' />
                    </th>
                    <td>
                        <input  type="radio" name="sex" value="男" checked="true"/>男
                        <input  type="radio" name="sex" value="女"/>女
                    </td>

                    <%--手机号码--%>
                    <th align="left">
                        <label id="person_telephone_No_text">
                            <spring:message code="newStaff.telephone_No" />
                        </label>
                        <span data-text='col' />
                    </th>
                    <td>
                        <input style="width: 128px" type="text" maxlength="40" name="telephoneNo" id="persontelephoneNo" value="${staff.telephoneNo}"/>
                    </td>

                    <!-- 电邮-->
                    <th align="left">
                        <label id="preson_email_text"><spring:message code="newStaff.emailAddress"/><span data-text='asterisk'/>
                        </label>
                        <span data-text='col'/>
                    </th>
                    <td>
                        <input style="width: 256px" type="text" maxlength="40" name="email" id="personemail" value="${staff.email}"/>
                    </td>
                </tr>
                <tr>
                    <%--Skype--%>
                    <th align="left">
                        <label id="person_skype_text">
                            <spring:message code="newStaff.skype" />
                        </label>
                        <span data-text='col' />
                    </th>
                    <td>
                        <input style="width: 128px" type="text" maxlength="40" name="skype" id="personskype" value="${staff.skype}"/>
                    </td>
                    <%--微信號--%>
                    <th align="left">
                        <label id="person_wechat_text">
                            <spring:message code="newStaff.wechat" />
                        </label>
                        <span data-text='col' />
                    </th>
                    <td>
                        <input style="width: 128px" type="text" maxlength="40" name="wechat" id="personwechat" value="${staff.wechat}"/>
                    </td>
                    <!-- 出生日期-->
                    <th align="left"><label id="dob_text"> <spring:message
                            code="newStaff.dob" />
                    </label> <span data-text='col' /></th>
                    <td><input class="calendar_bg cont_num_en" type="text" id="dob"
                               name="birthday" placeholder=""  onblur="setAge(this.value)"/>
                    </td>
                </tr>
            </table>
        </form>

        <div style="margin-top:60px;margin-left:5px;">
            <sam:Button accessControl="Y" dim="Y" altKey="button.common.cancel" onclick="CloseDiv('docDiv')" />
            <sam:Button accessControl="Y" dim="N" btnName="new_staff_save" onclick="backfill()" altKey="button.common.PreservationBackfill"/>
        </div>
    </div>
</div>
</body>
</html>
