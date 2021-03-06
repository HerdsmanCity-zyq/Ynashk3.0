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
        white-space: nowrap;
        display: inline-block;
        overflow: hidden;
        text-overflow: ellipsis;
        }
    </style>
</head>

<body>
<jsp:include page="../menu.jsp"/>
<div class="cont">
    <div id="bodyDiv_1" class=" fl">
        <table class="tc base_table hbod child" id="searchTableData2">
            <thead>
            <tr data-type="initTr">
                <th width="80px">
                    <label><spring:message code="paf.newPAF.pafVersionName"/></label>
                </th>
                <th width="80px">
                    <label><spring:message code="paf.newPAF.pafFramework"/></label>
                </th>
                <th width="80px">
                    <label><spring:message code="paf.newPAF.pafVersion"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.newPAF.pafBpwinNo"/></label>
                </th>
                <th width="80px">
                    <label><spring:message code="paf.newPAF.project"/></label>
                </th>
                <th width="400px" th-data="dynaWidth">
                    <label><spring:message code="paf.newPAF.pafName"/></label>
                </th>
                <th width="100px">
                    <label><spring:message code="paf.createdUser"/></label>
                </th>
                <th width="200px">
                    <label><spring:message code="paf.createdDate"/></label>
                </th>
            </tr>
            </thead>
        </table>
        <table class="tc base_table hbod child" id="searchTableData3">
            <tbody>
            <c:forEach var="list" items="${pafItemList}">
                <tr data-type="nursingItems">
                    <td width="79px" class="clickCss"><span
                            onclick="window.location.href='${basePath}/searchProjectPAF.do?action=viewProjectPaf&pafId=${list.pafId}&projectId=${list.getProjectVo().getProjectId()}'">${list.getPafId()}</span>
                    </td>
                    <td width="90px"><span>${list.getFrameworkName()}</span></td>
                    <td width="80px"><span>${list.getVersionsNo()}</span></td>
                    <td class="clickCss" width="100px" id="bpwinId"><span>${list.getBpwinNo()}</span></td>
                    <td class="clickCss" width="80px"  id="pojectId"><span>${list.getProjectVo().getProjectName()}</span></td>
                    <td class="clickCss" width="400px" id="pafNameId" title="${list.getPafName()}(${list.getPafNameChi()})" ><span style="width:400px" class="spans">${list.getPafName()}(${list.getPafNameChi()})</span>
                    </td>
                    <td width="100px"><span>${list.getSystemUserVo().getUserName()}</span></td>
                    <td width="200px"><span><fmt:formatDate value="${list.getLud()}" type="both" pattern="yyyy/MM/dd"/></span></td>
                    <td style="width:20px; border:0;">
                        <a href="javascript:void(0)" onclick="jumpToNewPafVesion('${list.getProjectVo().getProjectId()}','${list.pafId}','${list.frameworkId}')" id="newPafversion" class="icon49"></a>
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
        console.log('${pafItemList}')
        //初始化表格属性
        initTable();
        // 回显之前过滤的结果
        if ('${filterMap}' !== "") {
            filterMap = JSON.parse('${filterMap}');
            filterShowBack(filterMap);
        }
    });

    function jumpToNewPafVesion(projectId,pafId,frameworkId) {
        window.location.href ="newOnePAFEdition.do?projectId="+projectId+"&pafId="+pafId+"&frameworkId="+frameworkId;
    }


    //初始化表格属性
    function initTable() {
        //列最大长度，多出部分隐藏
        var spans = $("#searchTableData3 span[data-type='toWidth']");
        //获取表格某一个标题的宽度
        var wid = $("#searchTableData2 th[th-data='dynaWidth']").eq(2).attr("width");
        //跟随标题列的宽度

    }

    $("table").on("click", "td", function () {
        if ($(this).attr("id") === 'bpwinId') {
            var td = $(this);
            var pafNo = td.parent().find("td:eq(0)").text();
            var text = td.find("span").text();
            var input = td.find("input:text");
            if (!input.length) {
                td.find("span").text("");
                td.find("span").append("<input type='text' value='" + text + "' size='8'/>");
            }
            $("#bpwinId input").focus();
            $("#bpwinId input").blur(function () {
                var content = $(this).val();
                var data = {"content": content, "condition": "BPWIN_No", "pafNo": pafNo.substring(0, 7)};
                $.ajax({
                    url: "searchPAF.do?action=updatePafByCondition",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    success: function () {
                        console.log("success");
                    }
                });
                $(this).remove();
                td.find("span").text(content);
            });
        } else if ($(this).attr("id") === 'pafNameId') {
            var td = $(this);
            var pafNo = td.parent().find("td:eq(0)").text();
            var text = td.find("span").text();
            var input = td.find("input:text");
            if (!input.length) {
                td.find("span").text("");
                td.find("span").append("<input type='text' value='" + text + "' size='38'/>");
            }
            $("#pafNameId input").focus();
            $("#pafNameId input").blur(function () {
                var content = $(this).val();
                var data = {"content": content, "condition": "PAF_Name_Chi", "pafNo": pafNo.substring(0, 7)};
                $.ajax({
                    url: "searchPAF.do?action=updatePafByCondition",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    success: function () {
                        console.log("success");
                    }
                });
                $(this).remove();
                td.find("span").text(content);
            });
        } else if ($(this).attr("id") === 'statusId') {
            var td = $(this);
            var pafNo = td.parent().find("td:eq(0)").text();
            var text = td.find("span").text();
            var obj = td.find("select");
            if (!obj.length) {
                $.ajax({
                    url: "searchPAF.do?action=getStatus",
                    type: "post",
                    contentType: "application/json",
                    success: function (data) {
                        td.find("span").text("");
                        var html = "";
                        for (var key in data) {
                            html += "<option value='" + key + "'>" + data[key] + "</option>";
                        }
                        td.find("span").append("<select id='test'>" + html + "</select>");
                    }
                });

            }
            $("#statusId select").blur(function () {
                var id = $(this).find(':selected').val();
                var content = $(this).find(':selected').text();
                var data = {"content": id, "condition": "PAF_Status_id", "pafNo": pafNo.substring(0, 7)};
                $.ajax({
                    url: "searchPAF.do?action=updatePafByCondition",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    success: function () {
                        console.log("success");
                    }
                });
                $(this).remove();
                td.find("span").text(content);
            })
        } else if ($(this).attr("id") === 'remarkId') {
            var td = $(this);
            var pafNo = td.parent().find("td:eq(0)").text();
            var text = td.find("span").text();
            var obj = td.find("select");
            if (!obj.length) {
                $.ajax({
                    url: "searchPAF.do?action=getRemarks",
                    type: "post",
                    contentType: "application/json",
                    success: function (data) {
                        td.find("span").text("");
                        var html = "";
                        for (var key in data) {
                            html += "<option value='" + key + "'>" + data[key] + "</option>";
                        }
                        td.find("span").append("<select id='test'>" + html + "</select>");
                    }
                });

            }
            $("#remarkId select").blur(function () {
                var id = $(this).find(':selected').val();
                var content = $(this).find(':selected').text();
                var data = {"content": id, "condition": "PAF_Remarks_id", "pafNo": pafNo.substring(0, 7)};
                $.ajax({
                    url: "searchPAF.do?action=updatePafByCondition",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    success: function () {
                        console.log("success");
                    }
                });
                $(this).remove();
                td.find("span").text(content);
            })
        }
    })

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
                    alert(data.msg);
                }

            },
            error: function () {

            }
        });
    }
</script>