<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="includestatic.jsp"></jsp:include>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<style>
			label {left:50px;}
		</style>
	</head>
	<body>
		<sam:select id="multiple" name="multiple" dropdownName="${multiple}" where="${para}"
					style="display:none;"/>
		<div id="check" class="ml100 mt20 mb20 h400 of_y_auto"></div>
	</body>
</html>
<script type="text/javascript">
    $(function(){
        var options = $("#multiple option");
        for(var k = 0; k < options.length; k++){
            if(options.eq(k).attr("value")!="0")
                $("#check").append(
                    "<label for='_"+options.eq(k).attr("value") +"'>" +
						"<input"+ getCheckedAttr(options.eq(k).text()) +" id='_"+options.eq(k).attr("value") +"' value='"+options.eq(k).text()+"' type='checkbox' />" +
						"<span>"+options.eq(k).text()+"</span>" +
					"</label><br/>");
        }
        $("#check").append("<div ><input type='button' value='確認' onclick='window.close();' class='btn'/></div>");
    });
    function getCheckedAttr(value){
        var list = window.location.search.split("&");
        var map={};
        for(var K in list){
            var R = list[K].split("=");
            map[R[0]+""]= decodeURIComponent(R[1]+"");
        }
        var values = "<c:out value='${values}' />";
        return (values.indexOf(value)>-1 || map["values"].indexOf(value)> -1 ? "checked='checked'" : "" );
    }
    window.onbeforeunload = function(){
        var ua = navigator.userAgent.toLowerCase();
        //if(ua.match(/chrome\/([\d.]+)/)){
        var checks = $("#check input:checked");
        var checksArr = [];
        for(var k=0;k<checks.length;k++)
            checksArr.push(checks.eq(k).attr("value"));
        oDialog.sendMessage(checksArr.join(","));
        //}
    };
</script>