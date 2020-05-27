<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sam" uri="WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   <jsp:include page="includestatic.jsp"></jsp:include> 
   <script type="text/javascript">
      function UseJob(str){
        // $("#action").val(str);
         //$("#jobForm").submit();
         
         $.ajax({
           	type:"post",
           	url:"showImageDiaLog.do",
           	data:{"action":str},
           	dataType:"text",
           	async:false,
           	success:function(data){
           	     
           	  }
          });
      }
      
   </script> 
  </head>
  <body onclick="getOldMenu()">
      <jsp:include page="menu.jsp" />
      <%-- <form action="showImageDiaLog.do" method="post" id="jobForm">
          <input type="hidden" name="action" id="action"/>
          <input type="button" onclick="UseJob('statrJob')" value="statrJob"/>
          <input type="button" onclick="UseJob('pauseJob')" value="pauseJob"/>
          <input type="button" onclick="UseJob('resumeJob')" value="resumeJob"/>
          <input type="button" onclick="UseJob('deleteJob')" value="deleteJob"/>
          <input type="button" onclick="UseJob('getCurrentJob')" value="getCurrentJob"/>
      </form>--%>
  </body>
</html>
