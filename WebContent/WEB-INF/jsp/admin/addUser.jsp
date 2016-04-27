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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
  <a class="btn btn-default f-fl"  onclick="history.go(-1)" target="right" style="width:70px;">返 回</a>&nbsp;&nbsp;
  <br/>
  <span id="sp" style="display:none"></span><br /><br />
  <form class="newApplication registerform" action="AddUserForm" method="post" onSubmit="return checkTelAndByname()">
	   <table style="margin:0 auto;min-width:600px;">
	     <tr>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>用户名：</td>
	       <td width="36%"><input class="form-control f-ib" style="width:65%"  id="alias" placeholder="登录账号" name="user.username" datatype="*" value="<s:property value="user.username" />" errormsg="不能为空！" /><span class="Validform_checktip"></span></td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>真实姓名：</td>
	       <td width="36%"><input class="form-control f-ib" style="width:65%"   placeholder="真实姓名" name="user.name" datatype="*" errormsg="不能为空！" value="<s:property value="user.name" />" /><span class="Validform_checktip"></span></td>
	     </tr>
	     <tr>
	       <td style="width:12%;" align="right"><font class="mustToWrite"> * </font>出生日期：</td>
	       <td><input style="width:65%" plugin='datepicker' id="TxtProduredDate" name="user.birthday"  data-date-format="yyyy-mm-dd" class="datetimepicker form-control f-ib" value="<s:date name="user.birthday" format="yyyy-MM-dd" />" readonly="readonly" datatype="*"><span id="tip" class="Validform_checktip"></span></td>
           <td width="12%" align="right">Email：</td>
	       <td><input class="form-control f-ib" style="width:65%"  name="user.email" datatype="e" value="<s:property value="user.email" />" ignore="ignore"><span class="Validform_checktip"></span></td>
         </tr>
	     <tr>
	       <td width="12%"  align="right">性别：</td>
	       <td width="36%">
	       <select name="user.sex" style="width:65%;border:1px solid #ccc;" class="form-control f-ib" >
	         <option>--请选择--</option>
             <option value="0" <s:if test="user.sex ==0">selected</s:if>>男</option>
             <option value="1" <s:if test="user.sex ==1">selected</s:if>>女</option>
           </select></td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>通讯地址：</td>
	       <td ><input class="form-control f-ib" style="width:65%"  name="user.address" value="<s:property value="user.address" />" datatype="*"><span class="Validform_checktip"></span></td>
	     </tr>
	     <tr>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>手机：</td>
	       <td><input class="form-control f-ib" style="width:65%" datatype="m"  value="<s:property value="user.telephone" />" name="user.telephone" id="tel"><span class="Validform_checktip"></span></td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>用户类型：</td>
	       <td>
	         <input type="checkbox" name="user.userType" id="check1" <s:if test="user.userType ==0">checked</s:if> value="0" datatype="*"/><label class="labelFont" for="check1">VIP用户</label>
	         <input type="checkbox" name="user.userType" id="check2" <s:if test="user.userType ==1">checked</s:if> value="1"/><label class="labelFont" for="check2">管理员</label>
	       </td>
	     </tr>
	     <tr></tr>
	   </table>
	   <input type="hidden" name="user.name" value="<s:property value="user.id" />" />
	   <input type="submit" class="btn btn-primary f-fr" target="right" style="width:70px;margin-right:17%" value="保 存" />
	 </form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
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