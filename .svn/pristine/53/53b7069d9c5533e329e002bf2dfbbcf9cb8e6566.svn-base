<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("basePath", basePath);
    /*禁止缓存*/
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <jsp:include page="../includestatic.jsp"/>
    <script type="text/javascript" src="<%=basePath %>js/mouseDownForTable.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/SearchFrame.css">
    <script type="text/javascript" src="<%=basePath %>js/samPageHelper/pageHelper.js"></script>
    <style>
        .iconClass {
            width: 20px;
            height: 20px;
            float: left;
        }

        #bodyDiv_1 {
            width: 1520px;
            padding: 2px 8px;
            margin: auto;
        }

        th {
            cursor: pointer;
        }

        #bodyDiv_1 label {
            cursor: pointer;
        }

        .clickCss {
            cursor: pointer;
        }

        .spans {
            width: 336px;
            white-space: nowrap;
            display: inline-block;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head>

<body>
<jsp:include page="../menu.jsp"/>
<div class="cont" onclick="getOldMenu()">
    <div class="add_paf">
        <div id="bodyDiv_1" class="fl" style="overflow:auto">
            <div>
                <table class="tc base_table hbod child" id="searchPAFEditionTableData2" width="1982px">
                    <thead>
                    <tr data-type="initTr">
                        <th width="120px">
                            <label><spring:message code="searchPAFEditionList.pafIDName"/></label>
                        </th>
                        <th width="104px">
                            <label><spring:message code="searchPAFEditionList.pafFrameworkType"/></label>
                        </th>
                        <th width="80px">
                            <label><spring:message code="searchPAFEditionList.pafVersionID"/></label>
                        </th>
                        <th width="128px">
                            <label><spring:message code="searchPAFEditionList.pafBpwinNo"/></label>
                        </th>
                        <th width="104px">
                            <label><spring:message code="searchPAFEditionList.pafProject"/></label>
                        </th>
                        <th width="336px" th-data="dynaWidth">
                            <label><spring:message code="searchPAFEditionList.pafName"/></label>
                        </th>
                        <th width="116px">
                            <label><spring:message code="searchPAFEditionList.pafVisioVersion"/></label>
                        </th>
                        <th width="96px">
                            <label><spring:message code="searchPAFEditionList.status"/></label>
                        </th>
                        <th width="96px">
                            <label><spring:message code="searchPAFEditionList.assignBy"/></label>
                        </th>
                        <th width="120px">
                            <label><spring:message code="searchPAFEditionList.assignTime"/></label>
                        </th>
                        <th width="96px">
                            <label><spring:message code="searchPAFEditionList.estDuration"/></label>
                        </th>
                        <th width="96px">
                            <label><spring:message code="searchPAFEditionList.assignTo"/></label>
                        </th>
                        <th width="144px">
                            <label><spring:message code="searchPAFEditionList.submitStartDate"/></label>
                        </th>
                        <th width="144px">
                            <label><spring:message code="searchPAFEditionList.submitDate"/></label>
                        </th>
                        <th width="96px">
                            <label><spring:message code="searchPAFEditionList.actualDuration"/></label>
                        </th>
                        <th width="96px">
                            <label><spring:message code="searchPAFEditionList.difference"/></label>
                        </th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div style="overflow: hidden;overflow-y:auto;width:2082px;height: 552px">
                <table class="tc base_table hbod child" id="searchPAFEditionTableData3" width="2082px">
                    <tbody>
                    <c:forEach var="list" items="${PAFEditionList.list}">
                        <tr data-type="nursingItems">
                            <td width="120px" style="cursor: pointer"
                                onclick="jumpToSearchOnePafEdition('${list.projectId}','${list.pafId}','${list.pafVisioVersion}')">
                                <span>${list.pafId}</span>
                            </td>
                            <td width="104px">
                                <span>${list.frameworkName}</span>
                            </td>
                            <td width="80px">
                                <span>${list.versionsNo}</span>
                            </td>
                            <td width="128px" align="left">
                                <span>${list.bpwinNo}</span>
                            </td>
                            <td width="104px">
                                <span>${list.projectName}</span>
                            </td>
                            <c:choose>
                                <c:when test="${!''.equals(list.pafNameChi) && null != list.pafNameChi}">
                                    <td align="left">
                                        <span class="spans"
                                              title="${list.pafName}(${list.pafNameChi})">${list.pafName}(${list.pafNameChi})</span>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td align="left">
                                        <span class="spans" title="${list.pafName}">${list.pafName}</span>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                            <td width="116px">
                                <span>${list.pafVisioVersion}</span>
                            </td>
                            <td width="96px">
                                <span>${list.status}</span>
                            </td>
                            <td width="96px">
                                <span>${list.assignTo}</span>
                            </td>
                            <td width="120px">
                                <span><fmt:formatDate value="${list.assignDate}" pattern='yyyy/MM/dd'/></span>
                            </td>
                            <td width="96px">
                                <c:if test="${!''.equals(list.estDuration) && list.estDuration !=null}">
                                    <span>${list.estDuration}<spring:message code="searchPAFEditionList.hour"/></span>
                                </c:if>
                            </td>
                            <td width="96px">
                                <span>${list.codeTo}</span>
                            </td>
                            <td width="144px">
                                <span><fmt:formatDate value="${list.submitStartDate}" pattern='yyyy/MM/dd'/></span>
                            </td>
                            <td width="144px">
                                <span><fmt:formatDate value="${list.submitDate}" pattern='yyyy/MM/dd'/></span>
                            </td>
                            <td width="96px">
                                <c:if test="${!''.equals(list.actualDuration) && list.actualDuration !=null}">
                                    <span>${list.actualDuration}<spring:message
                                            code="searchPAFEditionList.hour"/></span>
                                </c:if>
                            </td>
                            <c:choose>
                                <c:when test="${''.equals(list.actualDuration) || list.actualDuration ==null}">
                                    <td width="96px">
                                        <span>0<spring:message code="searchPAFEditionList.hour"/></span>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${list.actualDuration-list.estDuration>0}">
                                            <td width="96px" style="color:red">
                                                <span>${list.actualDuration-list.estDuration}<spring:message
                                                        code="searchPAFEditionList.hour"/></span>
                                            </td>
                                        </c:when>
                                        <c:when test="${list.actualDuration-list.estDuration<0}">
                                            <td width="96px" style="color:green">
                                                <span>${list.estDuration-list.actualDuration}<spring:message
                                                        code="searchPAFEditionList.hour"/></span>
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td width="96px">
                                                <span>${list.estDuration-list.actualDuration}<spring:message
                                                        code="searchPAFEditionList.hour"/></span>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>


                                </c:otherwise>
                            </c:choose>
                            <td style="width:16px; border:0;">
                                <a title="下載Visio的最新版本" class="searchPAFEditionListIcon48" id="downloadVisio"
                                   paf_id="${list.pafId}"
                                   onclick="downloadVisio()"></a>
                            </td>
                            <td style="width:16px; border:0;">
                                    <%-- 添加跳转链接，跳转到 “ Y4.4复制PAF事项 ” --%>
                                <a title="複製PAF事項" href="javascript:void(0)" class="searchPAFEditionListIcon49"></a>
                            </td>
                            <c:choose>
                                <c:when test="${list.status=='確認設計' || list.status=='已分派' || list.status=='編碼中' || list.status=='已編碼' || list.status=='已提交'}">
                                    <td style="width:16px; border:0;">
                                            <%-- 添加跳转链接，跳转到 “ Y6.1.2新增PAF分派页面 ” --%>
                                        <a title="新增PAF分派頁面"
                                           href="<%=basePath %>newPAFAssign.do?pafId=${list.pafId}&projectId=${list.projectId}&pafVisioVersion=${list.pafVisioVersion}"
                                           class="searchPAFEditionListIcon17"></a>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td style="width:16px; border:0;">
                                        <span class="iconClass"></span>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${list.status=='已分派' || list.status=='編碼中' || list.status=='已編碼' || list.status=='已提交'}">
                                    <td style="width:16px; border:0;">
                                            <%-- 添加跳转链接，跳转到 “ Y6.2.2新增PAF提交页面 ” --%>
                                        <a title="新增PAF提交頁面"
                                           href="<%=basePath %>newPafSubmit.do?pafId=${list.pafId}&projectId=${list.projectId}&pafVisioVersion=${list.pafVisioVersion}"
                                           class="searchPAFEditionListIcon50"></a>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td style="width:16px; border:0;">
                                        <span class="iconClass"></span>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                            <td style="width:20px; border:0;">
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div id="sam-pagination"></div>
            </div>
        </div>
    </div>
</div>
<div>

</div>
</body>
</html>
<script type="text/javascript">

    function jumpToSearchOnePafEdition(projectId, pafId, visioVersion) {
        console.info(projectId + "," + pafId + "," + visioVersion);
        window.location.href = "${basePath}searchOnePAFEdition.do?projectId=" + projectId + "&pafId=" + pafId + "&visioVersion=" + visioVersion;
    }

    function downloadVisio() {
        window.location.href = "${basePath}newFRAPAF.do?action=downloadVisioFile&pafId=" + $("#downloadVisio").attr("paf_id");
    }

    pageHelper({
        basePath: "${basePath}/js",
        appId: "sam-pagination",
        link: "searchPAFEditionList.do",
        language: "zh_tw",
        total: "${total}",
        currPage: "${pageNo}",
        pageSize: "${pageSize}",
        requestType: "post",
        pageSizeArea:[10, 20, 30,40,50,60],
    });

</script>