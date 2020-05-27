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
    <jsp:include page="../../includestatic.jsp"/>
    <script type="text/javascript" src="<%=basePath %>js/mouseDownForTable.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/SearchFrame.css">
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

        .spans{
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            display: inline-block;
        }
        .project-tip {
            width: 70px;
            height: 25px;
            position: absolute;
            font-size: 12px;
            color: grey;
            border-radius: 5%;
            margin-top: -50px;
            margin-left: -10px;
            border: 1px solid #f7f7f7;
            padding: 0px 5px;
            background: #f1f2f4;
        }
        .hidden{
            display: none;
        }
    </style>
</head>

<body>
<jsp:include page="../../menu.jsp"/>
<div class="add_paf" onclick="getOldMenu()">
    <div id="bodyDiv_1" class=" fl">
        <table class="tc base_table hbod child" id="searchTableData2">
            <thead>
            <tr data-type="initTr">
                <th width="80px">
                    <label><spring:message code="paf.newPAF.pafVersionName"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.newPAF.pafFramework"/></label>
                </th>
                <th width="80px">
                    <label><spring:message code="paf.newPAF.pafVersion"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.newPAF.pafBpwinNo"/></label>
                </th>
                <th width="80px">
                    <label><spring:message code="paf.newPAF.pafStatus"/></label>
                </th>
                <th width="400px" th-data="dynaWidth">
                    <label><spring:message code="paf.newPAF.pafName"/></label>
                </th>
                <th width="300px" th-data="dynaWidth">
                    <label><spring:message code="paf.newPAF.pafRemarks"/></label>
                </th>
                <th width="200px">
                    <label><spring:message code="paf.updatedDate"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.updatedUser"/></label>
                </th>
            </tr>
            </thead>
        </table>
        <table class="tc base_table hbod child" id="searchTableData3">
            <tbody>
            <c:forEach var="list" items="${pafItemList}">
                <tr data-type="nursingItems">
                    <td class="clickCss" width="80px"><span style="width:80px" class="spans"
                            onclick="window.location.href='${basePath}newFRAPAF.do?action=viewFRAPAF&pafId=${list.pafId}'">${list.pafId}</span>
                    </td>
                    <td width="100px"><span style="width:100px" class="spans">${list.framework.frameworkName}</span></td>
                    <td width="80px"><span style="width:80px" class="spans">${list.versionsNo}</span></td>
                    <td class="clickCss" width="100px" id="bpwinId"><span style="width:100px" class="spans">${list.bpwinNo}</span></td>
                    <td class="clickCss" width="80px" id="statusId"><span  style="width:80px" class="spans">${list.status}</span></td>
                    <td class="clickCss" id="pafNameId" width="400px"><span style="width:400px" class="spans">${list.pafName}(${list.pafNameChi})</span>
                    </td>
                    <td class="clickCss" width="300px">
                        <span style="width:300px" class="spans">${list.pafRemarks.pafRemarkDesc}</span>
                    </td>
                    <td width="200px"><span style="width:200px" class="spans"><fmt:formatDate value="${list.lud}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span></td>
                    <td width="100px"><span style="width:100px" class="spans">${list.luu}</span></td>
                    <td style="width:120px; border:0;">
                        <a href="javascript:void(0)" id="showTip" class="icon5" title="新增項目 PAF"
                           onclick="window.location.href='${basePath}/newProjectPAF.do?action=viewFRAPAF&pafId=${list.pafId}'"></a>
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
        // 回显之前过滤的结果
        if ('${filterMap}' !== "") {
            filterMap = JSON.parse('${filterMap}');
            filterShowBack(filterMap);
        }
    });

    //监听vsd下载按钮事件
    function checkdown(pafId, frameworkId, versionId) {


        var jsondata = {
            "pafId": pafId,
            "frameworkId": frameworkId,
            "versionsId": versionId
        }
        var downUrl = '${basePath}newPAF.do?action=downloadFile&pafId=' + pafId
            + '&frameworkId=' + frameworkId + '&versionsId=' + versionId;
        $.ajax({
            url: "${basePath}newPAF.do?action=checkDownload",
            dataType: "json",//预期服务器返回的类型c
            type: 'post',
            contentType: "application/json",
            data: JSON.stringify(jsondata),
            success: function (data) {
                if (data.code == 200) {


                    $('#downVsd2').attr('href', downUrl);
                    $('#downVsd2')[0].click();
                } else {
                    Showbo.Msg.alert(data.msg);
                }

            },
            error: function () {

            }
        });
    }

</script>