<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页-用户角色</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body onselectstart="return false;">
 <!--  <fieldset class="fieldset">
     <legend class="legend">搜索</legend>
     <div class="fieldsetSearch"><a href="ProjectionSearch" target="right">搜索</a>|<a href="MyProjection" target="right">查看我的课题</a></div>
   </fieldset> -->
   <fieldset class="fieldset">
     <legend class="legend">提醒</legend>
     <ul class="userFiledset">
       <li><a onclick="face(1)">草稿( <s:property value="draftcount"/> )</a></li>
       <li><a class="nopassReview" onclick="face(10)">拒绝立项的课题( <s:property value="rejectApply"/> )</a></li>
       <li><a class="nopassReview" onclick="face(11)">拒绝结题的课题( <s:property value="rejectEnd"/> )</a></li>
       <li><a class="nopassReview" onclick="face(4)">申报待修改的课题( <s:property value="applyTomodify"/> )</a></li>
       <li><a class="nopassReview" onclick="face(8)">结题待修改的课题( <s:property value="endTomodify"/> )</a></li>
       <li><a class="nopassReview" onclick="face(2)">申报待评审的课题( <s:property value="applyToReview"/> )</a></li>
       <li><a class="nopassReview" onclick="face(6)">结题待评审的课题( <s:property value="endToReview"/> )</a></li>
       <li><a class="toReview" onclick="face(3)">申报评审中的课题( <s:property value="applying"/> )</a></li>
       <li><a class="toReview" onclick="face(7)">结题评审中的课题( <s:property value="ending"/> )</a></li>
       <li><a class="passReview" onclick="face(5)">已立项的课题( <s:property value="complete1"/> )</a></li>
       <li><a class="passReview" onclick="face(9)">已结题的课题( <s:property value="complete2"/> )</a></li>
       <li><a class="toReview" onclick="face(12)">资格审查中的课题( <s:property value="examCheck"/> )</a></li>
     </ul>
   </fieldset>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script>
  function face(id){
     window.location.href="MyProjection?id="+id;
  }
</script>
</html>