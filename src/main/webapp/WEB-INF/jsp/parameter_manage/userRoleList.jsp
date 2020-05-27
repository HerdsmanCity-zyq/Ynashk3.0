<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sam" uri="WEB-INF/tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includestatic.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../menu.jsp" />

<div onclick="getOldMenu();" class="clrfix pa h_canvas">
    <div class="cont">
        <div class="clrfix pr" style="width:648px;">
            <div id="bodyDiv_id" class=" fl" style="width:648px;">
                <table class="base_table hbod child">
                    <thead>
                    <c:choose>
                        <c:when test="${ !empty systemUserRoleList}">
                            <tr>
                                <th width="96px" style="cursor:pointer;" onclick="TableSort('roleCode');">
                                    <label><spring:message code="userRoleList.number" /></label>
                                </th>
                                <th width="160px" style="cursor:pointer;" onclick="TableSort('roleName');">
                                    <label><spring:message code="userRoleList.job" /></label>
                                </th>
                                <th width="96px" style="cursor:pointer;" onclick="TableSort('effectDate');">
                                    <label><spring:message code="userRoleList.effect_date" /></label>
                                </th>
                                <th width="96px" style="cursor:pointer;" onclick="TableSort('stopDate');">
                                    <label><spring:message code="userRoleList.stop_date" /></label>
                                </th>
                                <th width="104px" style="cursor:pointer;" onclick="TableSort('lastUpdateUser');">
                                    <label><spring:message code="userRoleList.last_update_user" /></label>
                                </th>
                                <th width="96px" style="cursor:pointer;" onclick="">
                                    <label><spring:message code="userRoleList.status" /> </label>
                                </th>
                            </tr>
                        </c:when>
                    </c:choose>
                    </thead>
                </table>
            </div>
            <div id="bodyDiv_id" class=" fl" style="height: 608px; width:666px;overflow-y:auto;">
                <table width="648px" class="base_table hbod child" id="table_id">
                    <c:choose>
                        <c:when test="${ !empty systemUserRoleList}">
                            <tbody>
                            <c:if test="${systemUserRoleList!=null}">
                                <c:forEach items="${systemUserRoleList}" var="systemUserRoleVo"  varStatus="status">
                                    <tr>
                                        <td style="width:96px;cursor: pointer;"onclick="">
                                            <label>
                                                <a href="javascript:void(0);"  onclick="roleView('${systemUserRoleVo.roleCode}')">
                                                        ${systemUserRoleVo.roleCode}
                                                </a>
                                            </label>
                                        </td>
                                        <td style="width:160px">
                                            <label class=" cut_label"  title="${systemUserRoleVo.roleName}">&nbsp;${systemUserRoleVo.roleName}</label>
                                        </td>
                                        <td style="width:96px">
                                            <label>${systemUserRoleVo.effectDate}</label>
                                        </td>
                                        <td style="width:96px;">
                                            <label>${systemUserRoleVo.stopDate}</label>
                                        </td>
                                        <td style="width:104px;">
                                            <label >${systemUserRoleVo.lastUpdateUser}</label>
                                        </td>
                                        <td style="width:96px;">
                                            <label title="">${systemUserRoleVo.status}</label>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </c:when>
                    </c:choose>
                </table>
            </div>
        </div>

        <div class="sub">
            <input type="button" class="btn" value='<spring:message code="button.common.back"/>' onclick="doBack()" />
        </div>
        <form action="${basePath}/searchOneRole.do?action=checkOneRole" id="roleForm" method="post">
            <input type="hidden" name="roleCode" id="roleCode"/>
        </form>
    </div>
</div>

<script>
    //color of tr
    $(document).ready(
        function() {
            var TR = $("#systemUserRoleList tbody > tr");
            for ( var i = 0; i < TR.length; i++) {
                if (i % 2 == 0) {
                    $("#systemUserRoleList tbody tr:eq(" + i + ")").addClass("double");
                } else {
                    $("#systemUserRoleList tbody tr:eq(" + i + ")").addClass("single");
                }
            }
        });
    function roleView(code){
        $("#roleCode").val(code);
        $("#roleForm").submit();
    }
</script>
</body>
</html>
