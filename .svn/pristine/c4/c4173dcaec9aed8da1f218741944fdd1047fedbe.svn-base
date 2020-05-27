<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    request.setAttribute("basePath", basePath);
    /*禁止缓存*/
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title></title>
    <jsp:include page="../includestatic.jsp"/>
    <script type="text/javascript" src="<%=basePath %>js/mouseDownForTable.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/SearchFrame.css">

</head>
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
</style>
<body>
<jsp:include page="../menu.jsp"></jsp:include>
<div class="add_paf" onclick="getOldMenu()">
    <div id="bodyDiv_1" class=" fl" style="width:1520px;">
        <table class="tc base_table hbod child" id="searchTableData2">
            <thead>
            <tr data-type="initTr">
                <th width="80px">
                    <label><spring:message code="paf.PAFassign.pafIDName"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.PAFassign.pafFrameworkType"/></label>
                </th>
                <th width="80px">
                    <label><spring:message code="paf.PAFassign.pafVersionID"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.PAFassign.pafBpwinNo"/></label>
                </th>
                <th width="300px">
                    <label><spring:message code="paf.PAFassign.pafVersionName"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.PAFassign.developer"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.PAFassign.estimateCompleteTime"/></label>
                </th>
                <th width="200px">
                    <label><spring:message code="paf.PAFassign.assignTime"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.PAFassign.assignPeoson"/></label>
                </th>
                <th width="120px">
                    <label><spring:message code="paf.PAFassign.assignStatus"/></label>
                </th>
                <th width="400px">
                    <label><spring:message code="paf.PAFassign.remark"/></label>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.pafAssignList}" var="assignList">
                <tr data-type="nursingItems">
                    <td><span>${assignList.getPafId()}</span></td>
                    <td><span>${assignList.getFrameworkVo().getFrameworkName()}</span></td>
                    <td><span>${assignList.getVersionsVo().getVersionsNum()}</span></td>
                    <td><span>${assignList.getPafVo().getBpwinNo()}</span></td>
                    <td><span>${assignList.getPafVo().getPafName()}(${assignList.getPafVo().getPafNameChi()})</span>
                    </td>
                    <td><span>${assignList.getDeveloper()}</span></td>
                    <td><span>${assignList.getEstimateCompleteHour()}</span></td>
                    <td><span>${assignList.getAssignTimeStr()}</span></td>
                    <td><span>${assignList.getLuu()}</span></td>
                    <td><span>${assignList.getPafVo().getPafStatusVo().getStatusName()}</span></td>
                    <td><span>${assignList.getRemark()}</span></td>
                    <td style="width:120px; border:0;">
                        <div class="iconClass">
                            <a id="downloadVsdId" class='icon25'
                               href="${basePath}/newPAFAssign.do?action=assignPAF&pafId=${assignList.pafId}&frameworkId=${assignList.frameworkId}&versionsId=${assignList.versionsId}"></a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        //初始化表格属性
        initTable();
        // 回显之前过滤的结果
        if ('${filterMap}' !== "") {
            filterMap = JSON.parse('${filterMap}');
            filterShowBack(filterMap);
        }
    });

    //初始化表格属性
    function initTable() {
        //列最大长度，多出部分隐藏
        var spans = $("#searchTableData2 span[data-type='toWidth']");
        //获取表格某一个标题的宽度
        var wid = $("#searchTableData2 th[th-data='dynaWidth']").eq(2).attr("width");
        //跟随标题列的宽度
        spans.css({
            "white-space": "nowrap",
            "display": "inline-block",
            "width": wid,
            "overflow": "hidden",
            "text-overflow": "ellipsis"
        });
    }
</script>