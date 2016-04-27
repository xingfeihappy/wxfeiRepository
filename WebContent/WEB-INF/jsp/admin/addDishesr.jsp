<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增菜品</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
  <a class="btn btn-default f-fl"  onclick="history.go(-1)" target="right" style="width:70px;">返 回</a>&nbsp;&nbsp;
  <br/>
  <span id="sp" style="display:none"></span><br /><br />
  <form class="newApplication registerform" action="AddDishesForm" method="post">
	   <table class="table table-bordered">
	     <tr>
	       <td width="19%">名称</td>
	       <td width="21%">单价</td>
	       <td width="12%">种类</td>
	       <td width="12%">描述</td>
	     </tr>
	     <tr>
	       <td><input type='text' name="dishes.name" value="<s:property value="dishes.anem" />"/></td>
	       <td><input type='text' /></td>
	       <td><input type='text' /></td>
	       <td><input type='text' /></td>
	     </tr>
	   </table>
	   <input type="hidden" name="dishes.id" value="<s:property value="dishes.id" />" />
	   <input type="submit" class="btn btn-primary f-fr" target="right" style="width:70px;margin-right:17%" value="保 存" />
	 </form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</html>