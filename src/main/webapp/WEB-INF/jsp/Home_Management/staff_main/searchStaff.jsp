<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sam" uri="WEB-INF/tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-

transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../includestatic.jsp"></jsp:include>
</head>
<body >
<jsp:include page="../../menu.jsp" />
<div onclick="getOldMenu();" class="clrfix pa h_canvas">
    <div class="cont">
        <div class="tab_cut_tit clrfix" id="">
            <!-- tab_head -->
            <table class="base_table hbod child" style="width:1364px;table-layout:fixed;" id="">
                <c:choose>
                    <c:when test="${ !empty staffList}">
                        <tr>
                            <th width="96px" onclick="TableSort('staffCode');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.staff_code" />
                            </label>
                            </th>
                            <th width="144px" onclick="TableSort('position');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.position" />
                            </label>
                            </th>
                            <th width="96px" onclick="TableSort('department');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.department" />
                            </label>
                            </th>
                            <th width="96px" onclick="TableSort('chiName');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.chi_Name" />
                            </label>
                            </th>
                            <th width="128px" onclick="TableSort('engName');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.EngName" />
                            </label>
                            </th>
                            <th width="96px" onclick="TableSort('nickname');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.nickname" />
                            </label>
                            </th>
                            <th width="96px" onclick="TableSort('wechat');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.wechat" />
                            </label>
                            </th>
                            </th>
                            <th width="208px" onclick="TableSort('skype');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.skype" />
                            </label>
                            </th>
                            <th width="272px" onclick="TableSort('email');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.emailAddress" />
                            </label>
                            </th>
                            <th width="112px" <%--onclick="TableSort('telephone_no');"--%>>
                                <label<%--style="cursor:pointer;--%>"><spring:message
                                    code="newStaff.telephone_No" />
                                </label>
                            </th>
                            <th width="96px" onclick="TableSort('staffStatus');"><label
                                    style="cursor:pointer;"><spring:message
                                    code="newStaff.staffStatus" />
                            </label>
                            </th>
                            <th width="20px" style="border:0px";></th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td style="border:0px;color:red;font-size:25px" colspan="34"
                                align="left"><spring:message code="message.common.28" /></td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </table>
        </div>
        <div class="tab_cut_tit clrfix"
             style="height: 580px;width:1520px;  OVERFLOW-X:auto; OVERFLOW-Y:auto;"
             id="">
            <table class="base_table hbod child" style="width:1364px;table-layout:fixed;" id="">
                <c:if test="${staffList!=null}">
                    <c:forEach items="${staffList}" var="s">
                        <tr>
                            <td onclick="editStaff('${s.staffCode}')" style="cursor:pointer;"width="96px" class="cont_num_en">&nbsp;${s.staffCode}</td>
                            <td width="144px">&nbsp;${s.position}</td>
                            <td width="96px">&nbsp;${s.department}</td>
                            <td width="96px" align="center">&nbsp;${s.chiName}</td>
                            <td width="128px" title="${s.engName}">&nbsp;<label class="cut_label">${s.engName}</label></td>
                            <td width="96px" title="${s.nickname}">&nbsp;<label class="cut_label">${s.nickname}</label></td>
                            <td width="96px"><label class="cut_label" style="width:96px" title="${s.wechat}">&nbsp;${s.wechat}</label></td>
                            <td width="208px"><label class="cut_label" style="width:208px" title="${s.skype}">&nbsp;${s.skype}</label></td>
                            <td width="272px" title="${s.email}">&nbsp;<label class="cut_label">${s.email}</label></td>
                            <td width="112px" class="cont_num_en" ><label class="cut_label" style="width:112px" title="${s.telephoneNo}">&nbsp;${s.telephoneNo}</label></td>
                            <td width="96px" >&nbsp;${s.staffStatus}</td>
                            <td style="border:none;width:20px;">
                                <c:if test="${s.staffStatus=='在職中'}">
                                    <span class="" id="iconCaCap">
                                         <a class="icon5" title="新增用戶"
                                            onclick="newUser('${s.staffCode}')"></a>
								    </span>
                                </c:if>

                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
    </div>
    <div class="sub">
        <sam:Button accessControl="Y" dim="Y" altKey="button.common.back"
                    onclick="doBack()" />
    </div>
</div>
</body>
<script>
    function newUser(obj){
        window.location.href="newUser.do?staffCode="+obj;
    }
    function editStaff(obj){
        /*$.post("newStaff.do?action=editStaff",data,function (message) {
            var vmessage=JSON.parse(message);
            alert(vmessage);
        })*/
        window.location.href="newStaff.do?action=editStaff&staffCode="+obj;
    }
</script>
</html>