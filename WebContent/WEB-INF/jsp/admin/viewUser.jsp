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
	   <table class="table table-hover table-borderSelf" style="margin:0 auto;min-width:600px;">
	     <tr>
	       <td width="12%" align="right">用户名：</td>
	       <td width="36%"><s:property value="user.username" /></td>
	       <td width="12%" align="right">真实姓名：</td>
	       <td width="36%"><s:property value="user.name" /></td>
	     </tr>
	     <tr>
	       <td style="width:12%;" align="right">出生日期：</td>
	       <td><s:date name="user.birthday" format="yyyy-MM-dd"/></td>
           <td width="12%" align="right">Email：</td>
	       <td><s:property value="user.email" /></td>
         </tr>
	     <tr>
	       <td width="12%"  align="right">性别：</td>
	       <td width="36%"><span><s:if test="user.sex ==0">男</s:if><s:else>女</s:else></span></td>
	       <td width="12%" align="right">通讯地址：</td>
	       <td ><s:property value="user.address" /></td>
	     </tr>
	     <tr>
	       <td width="12%" align="right">手机：</td>
	       <td><s:property value="user.telephone" /></td>
	       <td width="12%" align="right">用户类型：</td>
	       <td>
	          <span>
	             <s:if test="user.userType==0">普通用户</s:if>
	             <s:elseif test="user.userType==1">管理员</s:elseif>
	             <s:else>管理员</s:else>
	          </span>
	       </td>
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