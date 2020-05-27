<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../includestatic.jsp"></jsp:include>
    <script type="text/javascript">
        var sourceData = "";
        $(function () {

            new control("ca");

            var userCode = "${systemUser.userCode}";
            if (userCode != '' && userCode != null) {
                $("#userId").addClass("yellow").attr("readOnly", "readOnly");
                sourceData += $("#roleCode").val();
                sourceData += "," + $("#eff_date").val();
                sourceData += "," + $("#stop_date").val();
            }

            var activeInd = $("#activeInd").val();
            if (activeInd != undefined && activeInd != "") {
                if (activeInd == "Y") {
                    BottonIFWhether(true, $("#userRstart"));
                } else {
                    BottonIFWhether(true, $("#userStop"));
                }
            }
        })
    </script>
</head>
<body>
<jsp:include page="../../menu.jsp"/>
<div onclick="getOldMenu();" class="clrfix pa h_canvas">
    <div class="cont">
        <div class="add_box">
            <form id="add_tab">
                <input type="hidden"
                       value="<fmt:formatDate value="${systemUser.lud}" pattern="yyyy/MM/dd HH:mm:ss"/>"
                       name="yzLastUpDate" id="last_upd_date"/>
                <input type="hidden" value="${systemUser.activeInd}" id="activeInd" name="activeInd"/>
                <table class="add_tab" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th align="left"><label><spring:message code="newUser.user_code"/></label><span
                                data-text='col'/></th>
                        <td>
                            <%--<input type="hidden"  value="${systemUser.user_status}" id="user_status" name="user_status"/>--%>
                            <input class="tr yellow cont_num_en w150" size="20" type="text" readonly="readonly"
                                   name="userCode" id="user_code" value="${systemUser.userCode}"/>
                        </td>
                        <th align="left"><label id="roleCode_text"><spring:message code="newUser.role"/><span
                                data-text='asterisk'/></label><span data-text='col'/></th>
                        <td>
                            <sam:select class="tr w150" maxlength="15"
                                        id="roleCode" name="roleCode" value="${systemUser.roleCode}"
                                        dropdownName="GetAllRoleCode" where=""
                                        plsSelectText="outpatientService.department"/>
                        </td>
                        <th align="left"><label><spring:message code="newUser.emailAddress"/></label><span
                                data-text='col'/></th>
                        <td>
                            <input class="tr cont_num_en w150" size="20" type="text" id="email" name="email"
                                   staff
                                   onchange="OnBlur('email','<spring:message
                                           code="newUser.emailAddress"/>',false,0,validataEmail);"
                                   value="${systemUser.email}"/>
                        </td>
                        <th align="right"><label><spring:message code="paf.PAFassign.assignStatus"/></label><span
                                data-text='col'/></th>
                        <td>
                            <input class="tr yellow cont_num_en w150" value="${systemUser.userStatus}" size="20"
                                   readonly="readonly" id="user_status" name="userStatus"/>
                        </td>
                    </tr>
                    <tr>
                        <th align="left"><label id="userId_text"><spring:message code="newUser.userId"/><span
                                data-text='asterisk'/></label><span data-text='col'/></th>
                        <td>
                            <input class="tr cont_num_en w150" size="20" type="text" name="userId" id="userId"
                                   value="${systemUser.userId}" value="${systemUser.userName}"
                                   onchange="checkUserId()"/>
                            <input type="password" style="display:none;" value="${systemUser.loginPsw}" id="loginPsw"
                                   name="loginPsw" autocomplete="off"/>
                            <input type="hidden" name="isstaff" value="${systemUser.isstaff}"/>
                            <input type="hidden" id="HidestaffCode" value="${systemUser.staffCode}"/>
                            <input type="hidden" name="reqChangepwdInd" id="chg_pwd" value="N"/>
                            <input type="hidden" name="valUserId" id="val_userId" value="Y"/>
                        </td>
                        <th align="left"><label><spring:message code="newUser.chi_name"/></label><span data-text='col'/>
                        </th>
                        <td>
                            <input class="tr cont_num_en w150" size="20" type="text" id="chi_Name"
                                   onchange="OnBlur('chi_Name','<spring:message
                                           code="newUser.chi_name"/>',false,0,isChinese);" name="chineseName" staff
                            <%--onchange="OnBlur('chi_Name','<spring:message code="newUser.message.valChiName" />',false,0,validataChiName);"--%>
                                   value="${systemUser.chineseName}"/>
                        </td>
                        <th align="left"><label><spring:message code="newStaff.telephoneNo"/></label><span
                                data-text='col'/></th>
                        <td>
                            <input class="tr cont_num_en w150" size="20" type="text" id="telephoneNo" name="telephoneNo"
                                   staff
                                   onchange="OnBlur('telephoneNo','<spring:message
                                           code="newStaff.telephoneNo"/>',false,0,validtaPhone);"
                                   value="${systemUser.telephoneNo}"/>
                        </td>
                    </tr>
                    <tr>
                        <th align="left"><label><spring:message code="newStaff.staff_code"/></label><span
                                data-text='col'/></th>
                        <td>
                            <%--<input class="tr cont_num_en w150" size="20" type="text" name="staff_code" value="${systemUser.staff_code}"/>--%>
                            <sam:select class="tr w150" maxlength="15" id="staff_code" name="staffCode"
                                        value="${systemUser.staffCode}"
                                        onchange="changeStaffCode(this)" dropdownName="GetStaffCode" where=""
                                        plsSelectText="outpatientService.staff_code"/>
                        </td>
                        <th align="left"><label><spring:message code="newStaff.eng_Name"/></label><span
                                data-text='col'/></th>
                        <td>
                            <input class="tr cont_num_en w150" size="20" type="text" id="eng_name" name="englishName"
                                   staff
                            <%--onchange="OnBlur('eng_name','<spring:message code="newUser.message.valEngName" />',false,0,validataEngName);"--%>
                                   value="${systemUser.englishName}"/>
                        </td>
                        <th align="left"><label><spring:message code="newStaff.skype"/></label><span data-text='col'/>
                        </th>
                        <td>
                            <input class="tr cont_num_en w150" size="20" onchange="OnBlur('skype','<spring:message
                                    code="newStaff.skype"/>',false,0,validataChinese);" type="text" id="skype"
                                   name="skype"
                            <%--onchange="OnBlur('eng_name','<spring:message code="newUser.message.valEngName" />',false,0,validataEngName);"--%>
                                   value="${systemUser.skype}"/>
                        </td>

                    </tr>
                    <tr>
                        <th align="left"><label><spring:message code="newStaff.department"/><span
                                data-text='asterisk'/></label><span
                                data-text='col'/></th>
                        <td>
                            <%--   						<sam:select class="tr w150" maxlength="15"--%>
                            <%--							id="department_Code" name="department" value="${systemUser.department}"--%>
                            <%--							dropdownName="GetStaffDepartment" where="" --%>
                            <%--							plsSelectText="outpatientService.department" />--%>
                            <%--<input class="w150" id="department" name="department" staff
                                   value="${systemUser.department}"/>--%>
                            <sam:select id="department" maxlength="15" name="department" class="tr" style="width:112px"
                                        dropdownName="GetUserDepartment" onchange="changeDepartment(this)"
                                        where="AREA" plsSelectText="nwp.contact.informat.region"
                                        value="${systemUser.department}"/>
                        </td>
                        <th align="left"><label><spring:message code="newStaff.nickname"/></label><span
                                data-text='col'/></th>
                        <td>
                            <input class="tr cont_num_en w150" size="20" type="text" name="nickName" id="nickName" staff
                                   value="${systemUser.nickName}"/>
                        </td>
                        <th align="left"><label><spring:message code="newStaff.wechat"/></label><span data-text='col'/>
                        </th>
                        <td>
                            <input class="tr cont_num_en w150" size="20" type="text" name="wechat"
                                   onchange="OnBlur('wechat','<spring:message
                                           code="newStaff.wechat"/>',false,0,validataChinese);" id="wechat" staff
                                   value="${systemUser.wechat}"/>
                        </td>

                    </tr>
                    <tr>
                        <th align="left"><label><spring:message code="newStaff.position"/><span
                                data-text='asterisk'/></label><span data-text='col'/></th>
                        <td>
                            <sam:select id="position" maxlength="15" name="position" class="tr" style="width:150px"
                                        dropdownName="GetUserPosition"
                                        where="AREA" plsSelectText="nwp.contact.informat.region"
                                        value="${systemUser.position}"/>
<%--                            <input class="w150" id="position" name="position" staff value="${systemUser.position}"/>--%>
                        </td>
                        <th align="left"><label><spring:message code="newUser.eff_date"/><span
                                data-text='asterisk'/></label><span data-text='col'/></th>
                        <td>
                            <input class="calendar_bg cont_num_en w150" type="text" onclick="getDate()" id="eff_date"
                                   name="effectDate" value="${systemUser.effectDate}"/>
                        </td>
                        <th align="left"><label><spring:message code="newUser.stop_date"/><span
                                data-text='asterisk'/></label><span data-text='col'/></th>
                        <td>
                            <input class="calendar_bg cont_num_en w150" type="text" onclick="getDate()" id="stop_date"
                                   name="stopDate" value="${systemUser.stopDate}"/>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>

                </table>
            </form>
        </div>
        <div class="sub" id="bnt" style="z-index: 30001;">

            <sam:Button accessControl="Y" dim="N" altKey="button.common.save" btnName="new_user_save"
                        onclick="save(1)"/>
            <sam:Button accessControl="Y" dim="N" altKey="button.common.startUse" btnName="new_user_save"
                        onclick="save(2)" id="userRstart"/>
            <sam:Button accessControl="Y" dim="N" altKey="button.common.stopUse" btnName="new_user_save"
                        onclick="save(3)" id="userStop"/>
            <sam:Button accessControl="Y" dim="N" altKey="button.common.reset2" btnName="new_user_save"
                        onclick="save(4)" id="userStop"/>
            <sam:Button accessControl="Y" dim="N" altKey="button.common.setPassword" btnName="new_user_save"
                        onclick="save(5)"/>
            <sam:Button accessControl="Y" dim="Y" altKey="button.common.back" onclick="doBack()"/>
        </div>
        <div id="div_loading"
             style="display:none;width:100%;height:100%;z-index:1777;left:0px;	top:0px;filter:alpha(opacity=70);opacity:0.7;background:url('img/loadingForSave.gif') center center no-repeat;background-color:#fff;position:fixed;"></div>
        <div id="div_over"
             style="display:none;width:100%;height:100%;z-index:3001;left:0px;	top:0px;filter:alpha(opacity=70);opacity:0.7;background-color:#fff;position:fixed;"></div>
    </div>
    <div id="passwordDiv"
         style="position:absolute;right:100px;bottom:150px;width:800px;border:10px solid #50a050;padding:10px;display:none;z-index:3002">
        <form>
            <table class="add_tab" border="0" cellpadding="0" cellspacing="0" width="500px">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr id="oldPwdTr">
                    <th align="left"><label><spring:message code="newUser.oldPwd"/></label><span data-text='col'/></th>
                    <td>
                        <input class="tr  cont_num_en w150" size="20" type="text" id="oldPwd" onchange="valOldPwd()"
                               onfocus="this.type='password'" autocomplete="off"/>
                    </td>
                </tr>
                <tr>
                    <th align="left"><label><spring:message code="newUser.newPwd"/></label><span data-text='col'/></th>
                    <td>
                        <input class="tr  cont_num_en w150" size="20" type="text" onchange="valNewPwd()"
                               onfocus="this.type='password'" id="newPwd"/>
                        <p id="p1" style="font-size:10px; display: none;color: red;"><spring:message
                                code="newUser.message.valNewPwd"/></p>
                    </td>
                </tr>
                <tr>
                    <th align="left"><label><spring:message code="newUser.confirmPwd"/></label><span data-text='col'/>
                    </th>
                    <td>
                        <input class="tr  cont_num_en w150" size="20" type="text" onchange="valConfPwd()"
                               onfocus="this.type='password'" id="confirmPwd"/>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <sam:Button accessControl="N" dim="Y" altKey="newUser.sure" onclick="savePassword()"/>
            <sam:Button accessControl="N" dim="Y" altKey="button.common.back" onclick="hiddenPasswordDiv()"/>
        </form>
        <input type="hidden" id="old"/>
    </div>
</div>
<script>
    /**進入頁面根據員工編號選擇對應的option*/
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
    $(function () {
        $($(".sub")[0]).hide();  //隐藏默认返回按钮
        var userStatus = $("#user_status").val();


        console.info($(".sub"));
        if ("${systemUser.staffCode}" != "") {
            $("#staff_code").find("option[value='${systemUser.staffCode}']").attr("selected", true);
        }
    });

    /**驗證舊密碼*/
    function valOldPwd() {
        var oldPwd = $("#loginPsw").val();
        if (oldPwd != null || oldPwd != "") {
            var old_pwd = $("#oldPwd").val();
            if (oldPwd != old_pwd) {
                $("#oldPwd").css("border", "1px solid red");
            } else {
                $("#oldPwd").css("border", "1px solid #8a8a8a");
            }
        }
    }

    /**驗證新密碼*/
    function valNewPwd() {
        var newPwd = $("#newPwd").val();
        var c = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,}$/;
        if (!newPwd.match(c)) {
            $("#newPwd").css("border", "1px solid red");
            $("#p1").show();
        } else {
            $("#newPwd").css("border", "1px solid #8a8a8a");
            $("#p1").hide();
        }
    }

    /**驗證新密碼和確認密碼*/
    function valConfPwd() {
        var newPwd = $("#newPwd").val();
        var confPwd = $("#confirmPwd").val();
        if (newPwd != confPwd) {
            $("#confirmPwd").css("border", "1px solid red");
        } else {
            $("#confirmPwd").css("border", "1px solid #8a8a8a");
        }
    }

    /**设置密码**/
    function savePassword() {
        var message = "";
        if ($("#oldPwdTr").css("display").trim() != "none") {
            message += validate("oldPwd", "<spring:message code='newUser.oldPwd' />", true);
        }
        message += validate("newPwd", "<spring:message code='newUser.newPwd' />", true);
        message += validate("newPwd", "<spring:message code='newUser.message.valNewPwd' />", false, 0, validataNewPwd);
        message += validate("confirmPwd", "<spring:message code='newUser.confirmPwd' />", true);
        if (message != "") {
            alert(message);
            return;
        }

        if ($("#oldPwd").val() != $("#loginPsw").val() && $("#oldPwdTr").css("display").trim() != "none") {
            message += "<spring:message code='newUser.message.OldPwdError' />";
            alert(message);
            return;
        }

        if ($("#confirmPwd").val() != $("#newPwd").val()) {
            message += "<spring:message code='newUser.message.newPwdAndOldPwdError' />";
            alert(message);
            return;
        }
        var pwd = $("#loginPsw").val();
        $("#loginPsw").val($("#confirmPwd").val());
        if (pwd != "" && pwd != $("#confirmPwd").val()) {
            message = validateAdd_tab();
            if (message == null || message == "") {
                $("#chg_pwd").val("Y");
                var menu_name = $(".current_bg:last a").text();
                var old_value = '${systemUser}';
                var data = $("#add_tab").serialize();
                data += "&menu_name=" + menu_name;
                data += "&old_value=" + old_value;
                $.ajax({
                    url: "newUser.do?action=saveUser",
                    data: data,
                    type: "post",
                    success: function (mapMessage) {
                        var map = JSON.parse(mapMessage);
                        if (map.error == undefined) {
                            if ("Y" != map.self) {
                                alert("<spring:message code='newUser.message.changePsaawordSuccess'/>");
                            } else {
                                alert("<spring:message code='error.login.userIsUpdate'/>", function () {
                                    window.location.href = "login.do?action=logout";
                                });
                            }
                        } else {
                            alert(map.error);
                        }
                    }
                });
            } else {
                alert(message);
            }
        }
        hiddenPasswordDiv();
    }

    /**隐藏修改密码div**/
    function hiddenPasswordDiv() {
        $("#div_over").css("display", "none");
        $("#newPwd").css("border", "1px solid #8a8a8a");
        $("#confirmPwd").css("border", "1px solid #8a8a8a");
        $("#p1").hide();
        $("#passwordDiv").hide();
    }

    /**
     *檢查該員工編號是否已經創建有用戶
     */
    function checkUser() {
        var staffCode = $("#staff_code").val();
        var result = true;
        CheckRepeate({type: "USER", staffCode: staffCode, action: "CheckUserId"}, function (returnVal) {
            if (returnVal == "Y") {
                alert("该员工已经创有账号");
                //$("#" + id).val("");
                $("#staff_code").addClass("error");
                $("#staff_code").val("");
                result = false;
            } else if (returnVal == "N") {
                $("#staff_code").removeClass("error");

            }
        });
        return result;
    }

    function save(num) {
        var action = "";
        switch (num) {
            case 1: {//保存
                action = "saveUser";
                var oldStatus = checkUser();
                var st = $("#user_status").val();
                if (st.trim() == "") {
                    $("#user_status").val("已保存");
                    $("#activeInd").val("N");
                }
                save_request(action, num);
                var sourceD = $("#roleCode").val() + "," + $("#eff_date").val() + "," + $("#stop_date").val();
                if ("${systemUser.userId}" == "${sessionScope.currUser.userName}") {
                    if (sourceD != sourceData) {
                        alert("<spring:message code='error.login.userIsUpdate'/>");
                        window.location.href = "login.do?action=logout";
                    }
                }
                break;
            }
            case 2: {//重啟
                action = "saveUser";
                $("#user_status").val("已啟動");
                $("#activeInd").val("Y");
                // $("#eff_date").val("ney");
                var curentDate = new Date();
                curentDate.setFullYear(curentDate.getFullYear() + 1);
                $("#stop_date").val(curentDate.Format("yyyy/MM/dd"));
                // ;
                save_request(action, num);
                break;
            }
            case 3: {//停用
                action = "saveUser";
                $("#user_status").val("已停用");
                $("#activeInd").val("N");
                $("#eff_date").val(getNeedDate("pre_day"));
                $("#stop_date").val(getNeedDate("now_day"));
                save_request(action, num);
                break;
            }
            case 4: {//取消
                break;
            }
            case 5: {//設定密碼
                setPassword();
                break;
            }
            default:
                break;
        }
    }

    function setPassword() {
        $("#div_over").css("display", "block");
        $("#passwordDiv").find("input[type='password']").each(function () {
            $(this).val("");
        });
        if ($("#user_code").val() == "" || $("#user_code").val() == undefined) {
            $("#oldPwdTr").hide();
        } else {
            $("#oldPwdTr").show();
        }
        $("#passwordDiv").show();
    }

    function save_request(action, num) {
        var validateAdd_tab_val = validateAdd_tab();
        if (validateAdd_tab_val != "") {
            alert(validateAdd_tab_val);
            return;
        }
        $("#div_loading").show();
        var menu_name = $(".current_bg:last a").text();
        var old_value = '${systemUser}';
        if ($("#old").val() != null && $("#old").val() != "" && $("#old").val() != undefined) {
            old_value = $("#old").val();
        }
        var nursingHome = "";
        var datas = control.bind.getJSON(), home = "";
        for (var k in datas) {
            home = datas[k];
        }

        var data = $("#add_tab").serialize();
        console.log("data=" + data);
        data = data + nursingHome;
        data += "&menu_name=" + menu_name;
        data += "&old_value=" + old_value;
        // console.info("獲取的date:"+data);
        $.ajax({
            url: "newUser.do?action=" + action,
            data: data,
            type: "post",
            success: function (message) {
                $("#div_loading").hide();
                var message = JSON.parse(message);
                $("#old").val(message.old);
                if (message.error != undefined && message.error != "") {
                    if (message.error == "restartTip") {
                        Showbo.Msg.confirm("<spring:message code='newUser.message.restartTip'/>", "", function fn1() {
                            window.location.href = "newStaff.do?action=editStaff&staffCode=" + $('#HidestaffCode').val();
                        });
                    } else {
                        alert(message.error);
                        return;
                    }
                } else {
                    var vo = message.systemUserVo;
                    $("#user_code").val(vo.userCode);
                    $("#last_upd_date").val(vo.yzLastUpDate);
                    switch (num) {
                        case 1: {
                            alert("<spring:message code='message.common.09'/>");
                            $("#userId").addClass("yellow").attr("readOnly", "readOnly");
                            break;
                        }
                        case 2: {
                            alert("<spring:message code='newUser.message.restartSuccess'/>");
                            BottonIFWhether(true, $("#userRstart"));
                            BottonIFWhether(false, $("#userStop"));
                            break;
                        }
                        case 3: {
                            alert("<spring:message code='newUser.message.resetSuccess'/>");
                            BottonIFWhether(false, $("#userRstart"));
                            BottonIFWhether(true, $("#userStop"));
                            break;
                        }
                    }
                }
            }
        });
    }

    function validateAdd_tab() {
        var message = "";
        if ($("#userId").val().trim() == "") {
            message += "<spring:message code='message.common.02'/>\r\n".replace("{0}", "<spring:message code='newUser.userId' />");
        }
        if ($("#roleCode").val() == "0") {
            message += "<spring:message code='message.common.02'/>\r\n".replace("{0}", "<spring:message code='newUser.role' />");
        }

        message += validate('email', '<spring:message code="newUser.emailAddress" />', false, 0, validataEmail);
        message += validate('department', '<spring:message code="newStaff.department" />', true, 0, validaDepartment);
        message += validate('telephoneNo', '<spring:message code="newStaff.telephoneNo" />', false, 0, validtaPhone);
        message += validate("eff_date", "<spring:message code='newUser.eff_date' />", true);
        message += validate("stop_date", "<spring:message code='newUser.stop_date' />", true);
        if (new Date($("#eff_date").val()) > new Date($("#stop_date").val())) {
            message += "<spring:message code='newUser.message.eff_dateMorethan_stop_date'/>" + "\r\n";
        }
        if ($("#loginPsw").val() == "" || $("#loginPsw").val() == undefined) {
            message += "<spring:message code='newUser.message.pleaseSetPwdFirst'/>";
        }
        var eng_name = $("#eng_name").val();
        var chi_Name = $("#chi_Name").val();
        if(eng_name==''&&chi_Name==""){
            message+="\n<spring:message code='newStaff.message.nameErr'/>";
        }
        //驗證身份證號
        var cardInput = $("#card_input").val();
        if (cardInput == "Y") {
            message += "";
        } else if (cardInput == "ERROR") {
            message += "<spring:message code='nwp.message.common.02'/>";
        }
        //驗證用戶賬號
        var userInput = $("#val_userId").val();
        if (userInput == "Y") {
            message += "";
        } else if (userInput == "REPEATE") {
            message += "<spring:message code='newUser.message.ReUserId'/>";
        } else if (userInput == "ERROR") {
            message += "<spring:message code='newUser.message.valUserId'/>";
        }
        return message;
    }

    $(function () {
        if ($("#userId").val() == "" || $("#userId").val()) {
            $("#loginPwd").val();
        }
    });
</script>
<script>
    function getDate() {
        WdatePicker({
            lang: "${language eq 'EN' ? 'en' : 'zh-tw' }",
            el: $dp.$($(this).prop("eff_date,stop_date")),
            dateFmt: 'yyyy/MM/dd',
            isShowClear: true,
            //minDate: new Date()
        });
    }

    /**获取所需要的时间**/
    function getNeedDate(type) {
        //当前日期
        var curDate = new Date();
        //前一天的日期
        var preDate = new Date(curDate.getTime() - 24 * 60 * 60 * 1000);
        //獲取生效日期后一年的時間
        var effDate = new Date($("#eff_date").val());
        effDate = new Date(effDate.setFullYear(effDate.getFullYear() + 1));
        //獲取停止日期后一年的時間
        var stopDate = new Date($("#stop_date").val());
        stopDate = new Date(stopDate.setFullYear(stopDate.getFullYear() + 1));
        //格式化
        var preDay = formatDate(preDate);
        var nextEffYear = formatDate(effDate);
        var nextStopYear = formatDate(stopDate);
        var nowDay = formatDate(curDate);
        if (type == "pre_day") {
            return preDay;
        } else if (type == "next_eff_year") {
            return nextEffYear;
        } else if (type == "next_stop_year") {
            return nextStopYear;
        } else if (type == "now_day") {
            return nowDay;
        }
    }

    /**格式化時間**/
    function formatDate(dates) {
        var sep = "/";
        var year = dates.getFullYear();
        var month = dates.getMonth() + 1;
        var strDate = dates.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        return (year + sep + month + sep + strDate);

    }

    /**
     * 切換員工編號后給相應input賦值
     */
    function changeStaffCode(el) {
        if ($(el).find("option:selected").attr("info") != undefined) {
            // $("#add_tab")[0].reset()
            var info = JSON.parse($(el).find("option:selected").attr("info"));
            $("#user_code").val(info.userCode);
            $("#roleCode").val(info.roleCode);
            $("#email").val(info.email);
            $("#chi_Name").val(info.chineseName);
            $("#telephoneNo").val(info.telephoneNo);
            $("#eng_name").val(info.englishName);
            $("#skype").val(info.skype);
            $("#department").val(info.department);
            $("#nickName").val(info.nickName);
            $("#position").val(info.position);
            $("#user_status").val(info.userStatus);
            $("#wechat").val(info.wechat);
            $("#userId").val(info.userId);
            $("#eff_date").val(info.effectDate);
            $("#stop_date").val(info.stopDate);
            if(info.userId==null||typeof info.userId=="undefined"||info.userId==""){
                if(typeof $("#userId").attr("readonly")!="undefined") {
                    $("#userId").removeAttr("readonly");
                    $("#userId").removeClass("yellow");
                }
            }else{
                $("#userId").attr("readonly","readonly");
                $("#userId").addClass("yellow");
            }

            // $("#ID").val(info.identity_card);
            // $("#pay_ct_room").val(info.room);
            // $("#pay_ct_floor").val(info.floor);
            // $("#pay_ct_flat").val(info.flat);
            // $("#pay_ct_building").val(info.building);
            // $("#pay_ct_street").val(info.street);
            // $("#pay_ct_area_code").val(info.area_code);

        } else {
            $("input[staff]").val("");
            // $("#pay_ct_area_code").val(0);
        }
    }

    /**
     * 驗證 電郵/中文名/英文名/身份證號/電話/用戶賬號 輸入框内容的合法性
     */
    function OnBlur(id, title, Must, maxLength, call) {
        var message = "";
        message = validate(id, title, Must, maxLength, call);
        if (message != "") {

            $("#" + id).addClass("error");
            alert(message);
        } else {
            $("#" + id).removeClass("error");
        }
    }


    /**
     *檢查身份證號是否合法及是否重複
     */
    function checkId(id) {
        var value = $("#" + id).val();
        if (value == "" || value == undefined) {
            $("#" + id).removeClass("error");
            $("#card_input").val("Y");
            return;
        }
        var preValue = value.substring(0, value.length - 1);
        var lastValue = value.substring(value.length - 1, value.length);

        var validataMessage = validateID(value);
        if (validataMessage == "") {
            $("#" + id).removeClass("error");
            if (lastValue != getIdCharset(preValue)) {
                $("#" + id).addClass("error");
                $("#card_input").val("ERROR");
            } else {
                var param = {"type": "ID", "action": "CheckRepeate"};
                param["user_code"] = $("#user_code").val();
                param["ID"] = value;
                CheckRepeate(param, function (returnVal) {
                });
                //$("#" + id).removeClass("error");
            }

        } else {
            //alert(validataMessage);
            $("#" + id).addClass("error");
            $("#card_input").val("ERROR");
        }
    }

    /**
     * 檢查用戶賬號是否合法及是否重複
     * */
    function checkUserId() {
        var uId = $("#userId").val();
        if (uId == "" || uId == undefined) {
            $("#userId").removeClass("error");
            $("#val_userId").val("Y");
            return;
        }
        // var valMsg = validate('userId', 'error', false, 0, validataEngName);
        // if (valMsg == "") {
        var param = {"type": "USER_ID", "action": "CheckUserId"};
        param["USER_ID"] = uId;
        console.info(param);
        CheckRepeate(param, function (returnVal) {
            if (returnVal == "Y") {
                alert("<spring:message code='newUser.message.ReUserId'/>");
                //$("#" + id).val("");
                $("#userId").addClass("error");
                $("#val_userId").val("REPEATE");
            } else if (returnVal == "N") {
                $("#userId").removeClass("error");
                $("#val_userId").val("Y");
            }
        });
        // } else {
        //     $("#userId").addClass("error");
        //     $("#val_userId").val("ERROR");
        // }
    }

    //驗證身份賬號合法性
    function validateID(value) {
        if (value.length < 8) {
            return "<spring:message code='nwp.message.common.02'/>";
        }
        var preValue = value.substring(0, value.length - 1);

        var Integer = preValue.substring(1, 7),
            Charset = preValue.replace(Integer, "").toUpperCase();
        if (value.substring(value.length - 1, value.length) == "" || value.substring(value.length - 1, value.length) == undefined || Integer.length != 6) {
            return "<spring:message code='nwp.message.common.02'/>";
        } else if (!IsInt(Integer)) {
            return "<spring:message code='nwp.message.common.03'/>";
        } else {
            for (var i = 0; i < Charset.length; i++) {
                if (Charset.length == 2 && i != 0 && " " == Charset.charAt(i)) {
                    return "<spring:message code='nwp.message.common.04'/>";
                } else if (" IRAJSBKTCLUDMVENWFOXGPYHQZ".indexOf(Charset.charAt(i)) == -1) {
                    return "<spring:message code='nwp.message.common.04'/>";
                }
            }
        }
        return "";
    }

    function getIdCharset(value) {
        if (value.length == 7) {
            value = " " + value.toUpperCase();
        }
        var Integer = value.substring(value.length - 6, value.length),
            Charset = value.replace(Integer, ""),
            sum = 0;
        Map = {
            " ": 58, "I": 18, "R": 27, "A": 10, "J": 19, "S": 28, "B": 11, "K": 20, "T": 29, "C": 12, "L": 21,
            "U": 30, "D": 13, "M": 22, "V": 31, "E": 14, "N": 23, "W": 32, "F": 15, "O": 24, "X": 33, "G": 16,
            "P": 25, "Y": 34, "H": 17, "Q": 26, "Z": 35
        };
        for (var index = 0; index < Charset.length; index++) {
            sum += ((9 - index) * (Map[Charset.charAt(index)]));
        }
        for (var index = 0; index < Integer.length; index++) {
            sum += ((7 - index) * (new Number(Integer.charAt(index))));
        }
        return sum % 11 == 0 ? "0" : (((11 - (sum % 11)) == 10) ? "A" : (11 - (sum % 11)));
    }

    //檢查是否重複
    function CheckRepeate(paramJSON, call) {
        //paramJSON["action"] = "CheckRepeate";
        console.info(paramJSON);
        $.post("${basePath}newUser.do", paramJSON, function (e) {
            call(e);
        }, "text");
    }

</script>
</body>
</html>
