<%@page import="com.samhk.ynashk.mapper.SysUserDao" %>
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
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        request.setAttribute("basePath", basePath);
        /*禁止缓存*/
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
    <script type="text/javascript" src="<%=basePath %>js/mouseDownForTable.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/SearchFrame.css">
    <script type="text/javascript">
        function revise(user_code, staff_code) {
            window.location.href = "newUser.do?userCode=" + user_code + "&staffCode=" + staff_code;
        }
    </script>
</head>
<body>
<jsp:include page="../../menu.jsp"/>
<div onclick="getOldMenu();" class="clrfix pa h_canvas">
    <div class="cont">
        <div class="clrfix pr">
            <div id="bodyDiv_id" class=" fl" style="width: 1570px;"><!-- style="width:1500px;"  -->
                <table class="base_table hbod child" style="width:100%" id="table_id">
                    <thead>
                    <c:choose>
                        <c:when test="${ !empty searchUserList}">
                            <tr>
                                <th width="96" style="cursor:pointer;" <%--onclick="TableSort('USER_CODE');"--%>>
                                    <label><spring:message code="searchUser.user_code"/></label>
                                </th>
                                <th width="96" style="cursor:pointer;">
                                    <label><spring:message code="searchUser.user_id"/></label>
                                </th>
                                <th width="96" style="cursor:pointer;" <%--onclick="TableSort('STAFF_CODE');"--%>>
                                    <label><spring:message code="searchUser.staff_code"/></label>
                                </th>
                                <th width="144" style="cursor:pointer;">
                                    <label><spring:message code="searchUser.position"/></label>
                                </th>
                                <th width="96" style="cursor:pointer;">
                                    <label><spring:message code="searchUser.Chi_Name"/></label>
                                </th>
                                <th width="128" style="cursor:pointer;" <%--onclick="TableSort('Eng_Name');"--%>>
                                    <label><spring:message code="searchUser.Eng_Name"/></label>
                                </th>
                                <th width="96" style="cursor:pointer;" <%--onclick="TableSort('nickname');"--%>>
                                    <label><spring:message code="searchUser.nickname"/></label>
                                </th>
                                    <%--<th width="70" style="cursor:pointer;" onclick="TableSort('identity_card');">
                                        <label><spring:message code="searchUser.identity_card" /></label>
                                    </th>--%>
                                <th width="96" style="cursor:pointer;" <%--onclick="TableSort('wechat');"--%>>
                                    <label><spring:message code="newStaff.wechat"/></label>
                                </th>
                                <th width="208" style="cursor:pointer;">
                                    <label><spring:message code="newStaff.skype"/></label>
                                </th>
                                <th width="232" style="cursor:pointer;">
                                    <label><spring:message code="searchUser.email_address"/></label>
                                </th>
                                <th width="112" style="cursor:pointer;" <%--onclick="TableSort('telephoneNo');"--%>>
                                    <label><spring:message code="searchUser.telephone_no"/></label>
                                </th>
                                    <%--	<th width="50" style="cursor:pointer;" onclick="TableSort('ISSTAFF');">
                                            <label><spring:message code="searchUser.isstaff" /></label>
                                        </th>--%>
                                    <%--<th width="95" style="cursor:pointer;" onclick="TableSort('EFFECT_DATE');">
                                        <label  class="label_en"><spring:message code="searchUser.effect_date" /></label>
                                    </th>--%>
                                <th width="96" style="cursor:pointer;" <%--onclick="TableSort('STOP_DATE');"--%>>
                                    <label><spring:message code="searchUser.stop_date"/></label>
                                </th>
                                <th width="74" style="cursor:pointer;" <%--onclick="TableSort('USER_STATUS');"--%>>
                                    <label><spring:message code="searchUser.user_status"/></label>
                                </th>

                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td style="border:0px;color:red;font-size:25px" colspan="34" align="left">
                                    <spring:message code="message.common.28"/></td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </thead>
                </table>
            </div>
            <div style="height: 586px; width:1588px;overflow-y:auto;"><!--  -->
                <table class="base_table hbod child" width="1570px" id="table_id1">
                    <c:choose>
                        <c:when test="${ !empty searchUserList}">
                            <tbody>
                            <c:if test="${searchUserList!=null}">
                                <c:forEach items="${searchUserList}" var="sysUser" varStatus="status">
                                    <tr>
                                        <td width="96px" style="cursor:pointer"
                                            onclick="revise('${sysUser.userCode}','${sysUser.staffCode}')"><label
                                                class="cont_num_en"
                                                style="cursor:pointer">&nbsp;${sysUser.userCode}</label></td>
                                        <td width="96px"><label class="cont_num_en cut_label"
                                                                style="cursor:pointer"><span title="${sysUser.userId}">&nbsp;${sysUser.userId}</span></label>
                                        </td>
                                        <td width="96px"><label class="cut_label" style="cursor:pointer"><span
                                                title="${sysUser.staffCode}">&nbsp;${sysUser.staffCode}</span></label>
                                        </td>
                                        <td width="144px"><label class="cut_label" style="cursor:pointer"><span
                                                title="${sysUser.position}">&nbsp;${sysUser.position}</span></label>
                                        </td>
                                        <td width="96px" align="center"><label class="cut_label" style="cursor:pointer"><span
                                                title="${sysUser.chineseName}">${sysUser.chineseName}</span></label>
                                        </td>
                                        <td width="128px"><label class="cut_label" style="cursor:pointer"><span
                                                title="${sysUser.englishName}">&nbsp;${sysUser.englishName}</span></label>
                                        </td>
                                        <td width="96px"><label class="cont_num_en cut_label"
                                                                style="cursor:pointer"><span
                                                title="${sysUser.nickName}">&nbsp;${sysUser.nickName}</span></label>
                                        </td>
                                        <td width="96px"><label class="cont_num_en cut_label"
                                                                style="cursor:pointer"><span title="${sysUser.wechat}">&nbsp;${sysUser.wechat}</span></label>
                                        </td>
                                            <%--<td width="70" ><label class="cont_num_en cut_label" style="width:70px"><span title="${sysUser.identity_card}">&nbsp;${sysUser.identity_card}</span></label></td>--%>
                                        <td width="208px"><label class="cont_num_en cut_label"
                                                                 style="cursor:pointer"><span title="${sysUser.skype}">&nbsp;${sysUser.skype}</span></label>
                                        </td>
                                        <td width="232px"><label class="cont_num_en cut_label"
                                                                 style="cursor:pointer"><span title="${sysUser.email}">&nbsp;${sysUser.email}</span></label>
                                        </td>
                                        <td width="112px"><label class="cont_num_en cut_label"
                                                                 style="cursor:pointer"><span
                                                title="${sysUser.telephoneNo}">&nbsp;${sysUser.telephoneNo}</span></label>
                                        </td>
                                            <%--<td width="50" ><label >&nbsp;${sysUser.isstaff eq('Y')?'是':'否'}
                                            </label></td>--%>
                                            <%--<td width="95"><label  class="cont_num_en">&nbsp;${sysUser.effect_date}</label></td>--%>
                                        <td width="96px"><label class="cont_num_en"
                                                                style="cursor:pointer">&nbsp;${sysUser.stopDate}</label>
                                        </td>
                                        <td width="74px"><label
                                                style="cursor:pointer">&nbsp;${sysUser.userStatus}</label></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </c:when>
                    </c:choose>
                </table>
            </div>
        </div>

    </div>
    <div class="sub">
        <input type="button" class="btn" value='<spring:message code="button.common.back"/>' onclick="doBack()"/>
    </div>
</div>
</body>

</html>