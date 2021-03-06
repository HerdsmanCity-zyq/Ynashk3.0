<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
    /*禁止缓存*/
    response.setHeader("Pragma","No-cache");
    response.setHeader("Cache-Control","no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>YNA</title>
    <jsp:include page="includestatic.jsp"></jsp:include>


    <script type="text/javascript">
        //进入登录页面，光标定位到用户名输入框
        $(function () {
            $("#userId").focus();
        });

        //回车时，默认是登陆
        function on_return(){
            var keyCode = event.keyCode?event.keyCode:event.which?event.which :event.charCode;
            if(keyCode == 13){
                AjaxSubmit();
                //document.getElementById('login').submit();
            }

        }
        function changeLanguage(){
            $("#login").submit();
        }
        function AjaxSubmit(){
            var message = "";
            message+=validate("userId",$("#userId_text").text(),true);
            message+=validate("loginPsw",$("#loginPsw_text").text(),true);
            //message+=validate("nursingHome",$("#nursingHome_text").text(),true);
            //message+=validate("operatingPost",$("#operatingPost_text").text(),true);
            //console.info(message);
            var data=$("#login").serialize();   //获取页面输入的用户名，密码，语言类型
            if(message!=""){
                alert(message);
            }else{
                $.post("${basePath}login.do",data,function(message){
                    //验证成功message的值即为：successfully
                    if(message=="successfully"){
                        window.location = "${basePath}getMenu.do";
                    }else{
                        alert(message);
                    }
                },"text");
            }
        }
        $(function(){
            var language = $("#language").val();
            if(language=="TC"){
                $("#TC").addClass("current");
                $("#EN").removeClass("current");
            }
            if(language=="EN"){
                $("#EN").addClass("current");
                $("#TC").removeClass("current");
            }

        })

        function changeLanguage(language){
            $("#language").val(language);
            $("#login").submit();
        }

    </script>
</head>
<body onkeydown="on_return();">
<div style="background-color: #034c50;height: 30px;font-size: 18pt;color: white; position: relative">YNA PAF</div>
<div style="background-color: #a0c850;height: 35px;"></div>
<img src="static/img/yna_logo.png" style="width: 55px;height: 55px;position: absolute;top: 5px;right: 5px;"/>
<div class="login_box clrfix">
    <div class="logo">
        <img src="static/img/yna_logo.png" style="width: 100px;height: 100px;padding-right: 30px"/>
        <spring:message code="com.login.newhead" />     <%-- 医院·养老 --%>
    </div>
    <form id="login" method="post" action="${basePath}changeLanguage.do">
        <ul>
            <li><label id="userId_text"><spring:message code="com.login.username" /></label> <spring:message code="com.login.colon" /><input class="cont_num_en tr" type="text" name="userId" id="userId" value='<c:out value="${searchTable.userId }"/>' size="10" />
                <%--<span class="bg w100 fr mt5"> <a class="current w50"  id="TC" onclick="changeLanguage('TC');" title="中文">中文</a><a id="EN" onclick="changeLanguage('EN');" class="w50" title="ENG">ENG</a>--%>
						 <%--<input type="hidden" id="language" name="language" value="${ empty language ? 'TC' : language }"/>--%>
					<%--</span>--%>
            </li>
            <li><label id="loginPsw_text"><spring:message code="com.login.pwd" /> </label> <spring:message code="com.login.colon" /><input class="tr" type="password" name="loginPsw" id="loginPsw" value='<c:out value="${searchTable.loginPsw }"/>' size="10" /></li>
            <li>&nbsp;</li>
            <!-- 工作岗位 -->
            <li class="tc"><input class="btn1" type="button" name="" value='<spring:message code="com.login.loginbutton"/>' onclick="AjaxSubmit()" /></li>
            <li class="mt30"><label style="width: 130px"><spring:message code="com.login.versionText" /> </label><spring:message code="com.login.colon" /><spring:message code="com.login.version" /></li>
            <%--<li class="w500">
                <a class="bg f6" href="" title='<spring:message code="com.login.firstNeedToKnow"/>'><spring:message code="com.login.firstNeedToKnow" /></a>
                <a class="bg f6" href="" title='<spring:message code="com.login.userCode"/>'><spring:message code="com.login.userCode" /></a>
                <a class="bg f6" href="" title='<spring:message code="com.login.retrievePassword"/>'><spring:message code="com.login.retrievePassword" /></a>
            </li>--%>
        </ul>
    </form>
</div>
</body>
</html>
