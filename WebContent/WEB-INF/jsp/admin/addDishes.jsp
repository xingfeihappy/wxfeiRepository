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
  <form class="newApplication registerform" action="AddDishesForm" method="post" enctype="multipart/form-data">
	   <table class="table table-bordered">
	     <tr>
	       <td width="19%">名称</td>
	       <td width="31%" colspan="3"><input type='text' name="dishes.name" value="<s:property value="dishes.name" />"/></td>
	     </tr>
	     <tr>
	       <td width="19%">单价</td>
	       <td width="31%"><input type='text' name="dishes.price" value="<s:property value="dishes.price" />"/></td>
	       <td width="19%">菜品种类</td>
	       <td><input type='text' name="dishes.type" value="<s:property value="dishes.type" />"/></td>
	     </tr>
	     <tr>
	       <td rowspan="3" width="19%">菜品描述</td>
	       <td rowspan="3" width="31%"><input type='text' name="dishes.description" value="<s:property value="dishes.description" />"/></td>
	       <td rowspan="3" colspan="2">
	         <div class="fileUpload btn btn-warning fileUpload2" style="width:70px">
				<span>上传</span>
				<input id="" type="file" name="file" class="upload" />
			 </div>
		   </td>
	     </tr>
	     <tr></tr>
	     <tr></tr>
	   </table>
	   <input type="hidden" name="dishes.id" value="<s:property value="dishes.id" />" />
	   <br />
	   <input type="submit" class="btn btn-success f-fr" target="right" style="width:70px;margin-right:17%" value="保 存" />
	 </form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</html>