<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资格审查意见填写</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
    <form class="addProfessor">
    	<a class="btn btn-default f-f1" onClick="back()" target="right" style="width:80px;z-index:9999;position:relative">返 回</a>
    </form>
    		<br/>
	<form class="newApplication1" method="post" id="form1" name="form1" action ="SubmitQualification">
	<input name="projection.id" value="<s:property value="projection.id" />" type="hidden"/>
		 <table class="table table-hover table-bordered" >
			<thead>
				<tr>
					<th>资格审查</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					<textarea  rows="6" style="width: 100%;border: 0px;" name="projection.qualificationExamination"><s:property value="projection.qualificationExamination" /></textarea>
					</td>
				</tr>
			</tbody>
		</table><br/>
		<s:if test="#session.username==@com.projection.util.Constant@OPERATERNAME && #session.userType==@com.projection.util.Constant@ADMIN">
	    <input id="btn" class="btn btn-primary submit" target="right" style="float:right;width:70px;" type="submit" value="提 交" />
		</s:if>
		<s:if test="#session.username!=@com.projection.util.Constant@OPERATERNAME && #session.userType==@com.projection.util.Constant@ADMIN">
		 <input class="btn btn-primary submit" target="right" style="float:right;width:70px;" type="button" value="同意报送" onclick="changeAction1()"/>
	    <input class="btn btn-primary submit" target="right" style="float:right;width:70px;margin-right:20px;" type="button" value="拒绝立项" onclick="changeAction2()"/>
	   
		</s:if>
	</form>
	<div id="bg" style="display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;   z-index:1001; background:transparent;"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script>
var isEdit="${projection.qualificationExamination}";
if(isEdit){
	$("#btn").css("display","none");
	$("textarea").attr("readonly","true");
}
</script>
<script>
	function changeAction1(){
		Showbo.Msg.confirm('同意报送吗?',function(flag){
			if(flag=='yes')	{	
				document.form1.attributes["action"].value  = "Approval"; 
				$("#form1").submit();}
		}); 
	/* 	//获取页面的第一个表单
		targetForm=document.forms[1];
		// 动态修改表单的Action属性
		targetForm.action="Approval"; */
	}
	function changeAction2(){
		Showbo.Msg.confirm('拒绝立项吗?',function(flag){
			if(flag=='yes')	{	
				document.form1.attributes["action"].value  = "DisApproval"; 
				$("#form1").submit();}
		}); 
	}
</script>
<script type="text/javascript">
var tag="${tag}";
var state="${projection.state}";
function back(){
	if(state=="申报待评审"||state=="申报评审中"||state=="资格审查"||state=="申报待修改")
	 window.location.href="operatorApplyManage?tag="+tag;
	else{
		window.location.href="operatorApplyEndManage?tag="+tag;
	}
}
</script>
</html>