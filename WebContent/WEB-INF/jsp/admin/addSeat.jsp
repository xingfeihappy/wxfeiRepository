<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增餐位</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
  <a class="btn btn-default f-fl"  onclick="history.go(-1)" target="right" style="width:70px;">返 回</a>&nbsp;&nbsp;
  <br/>
  <span id="sp" style="display:none"></span><br /><br />
  <form class="newApplication registerform" action="AddSeatForm" method="post">
	   <table class="table table-bordered">
	     <tr>
	       <td width="19%">容纳人数</td>
	       <td width="31%"><input type='text' name="seat.containPeople" value="<s:property value="seat.containPeople" />"/></td>
	       <td width="19%">状态</td>
	       <td><input type='text' name="seat.state" value="<s:property value="seat.state" />"/></td>
	     </tr>
	     <tr>
	       <td width="19%">备注</td>
	       <td width="31%" colspan="3"><input type='text' name="seat.remark" value="<s:property value="seat.remark" />"/></td>
	     </tr>
	     <tr></tr>
	   </table>
	   <input type="hidden" name="seat.id" value="<s:property value="seat.id" />" />
	   <br />
	   <input type="submit" class="btn btn-success f-fr" target="right" style="width:70px;margin-right:17%" value="保 存" />
	 </form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap-datetimepicker.js"></script>
</html>