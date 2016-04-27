<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页-专家角色</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body>
  <fieldset class="fieldset">
     <legend class="legend">搜索</legend>
     <div class="fieldsetSearch"><a href="ReviewerResearch" target="right">搜索</a>|<a href="ProjectReview" target="right">课题评审</a>|<a href="ProjectEndReview" target="right">结题评审</a></div>
   </fieldset>
   <fieldset class="fieldset">
     <legend class="legend">提醒</legend>
     <ul class="userFiledset">
      <%--  <li><a class="passReview" onclick="face(1)">即将过期的评审( <s:property value="countToReview1"/> )</a></li> --%>
       <li><a class="nopassReview" onclick="face(1)">待评审的申报( <s:property value="countToReview1"/> )</a></li>
       <li><a class="nopassReview" onclick="face1(1)">待评审的结题( <s:property value="countToReview2"/> )</a></li>
     </ul>
   </fieldset>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script>
 function face(id){
    window.location.href="ProjectReview?id="+id;
 }
function face1(id){
    window.location.href="ProjectEndReview?id="+id;
 } 
</script>
</html>