<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body>
  <a class="btn btn-default f-fl"  onclick="history.go(-1)" target="right" style="width:70px;">返 回</a>&nbsp;&nbsp;
  <br/>
  <span id="sp" style="display:none"></span><br /><br />
	   <table style="margin:0 auto;min-width:600px;">
	     <tr>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>用户名：</td>
	       <td width="36%"><input class="form-control f-ib" style="width:65%"  readOnly="true" id="alias" placeholder="登录账号" name="user.username" datatype="*" value="<s:property value="user.username" />" errormsg="不能为空！" /><span class="Validform_checktip"></span></td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>真实姓名：</td>
	       <td width="36%"><input class="form-control f-ib" style="width:65%"   readOnly="true" placeholder="真实姓名" name="user.name" datatype="*" errormsg="不能为空！" value="<s:property value="user.name" />" /><span class="Validform_checktip"></span></td>
	     </tr>
	     <tr>
	       <td style="width:12%;" align="right"><font class="mustToWrite"> * </font>出生日期：</td>
	       <td><input style="width:65%" plugin='datepicker' id="TxtProduredDate" readOnly="true" name="user.birthday"  data-date-format="yyyy-mm-dd" class="datetimepicker form-control f-ib" value="<s:date name="user.birthday" format="yyyy-MM-dd" />" readonly="readonly" datatype="*"><span id="tip" class="Validform_checktip"></span></td>
           <td width="12%" align="right">Email：</td>
	       <td><input class="form-control f-ib" style="width:65%"  name="user.email" readOnly="true" datatype="e" value="<s:property value="user.email" />" ignore="ignore"><span class="Validform_checktip"></span></td>
         </tr>
	     <tr>
	       <td width="12%"  align="right">性别：</td>
	       <td width="36%"><span><s:property value="user.sex" /></span></td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>通讯地址：</td>
	       <td ><input class="form-control f-ib" style="width:65%"  readOnly="true" name="user.address" value="<s:property value="user.address" />" datatype="*"><span class="Validform_checktip"></span></td>
	     </tr>
	     <tr>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>手机：</td>
	       <td><input class="form-control f-ib" style="width:65%" datatype="m"  readOnly="true" value="<s:property value="user.telephone" />" name="user.telephone" id="tel"><span class="Validform_checktip"></span></td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>用户类型：</td>
	       <td><span><s:property value="user.userType" /></span></td>
	     </tr>
	     <tr></tr>
	   </table>
</body>
<script>
$(function(){
	$(".registerform").Validform({
		tiptype:2
	});
})
$('.datetimepicker').datetimepicker({
    language : 'fr',weekStart : 1,todayBtn : 1,autoclose : 1,
    todayHighlight : 1,startView : 2,minView : 2,forceParse : 0
});

$('#TxtProduredDate').blur(function (){
	 $("#TxtProduredDate").change(function(){
		    $("#tip").css("display","none");
		  });
})


</script>
</html>