<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>提交成功</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body style="font-family: "宋体","Arial";">
<form>
	<br>
	<div style="margin: 10px auto; text-align: center;">
		<img src="${pageContext.request.contextPath}/resource/image/success.png" align="absmiddle" style="border-width:0px;">&nbsp;
		<span style="font-size:16px;font-weight:bold;">操作成功！</span>
	</div>
	<div style="font-size: 12pt; line-height: 180%; width: 500px; margin: 10px auto;
		border: solid 1px #e0e0e0; padding: 20px; background-color: #f6f6f6;">
		&nbsp; &nbsp;
		密码已修改成功，请使用您的手机号和新密码重新登录。
		<p align="center" style="font-size: 9pt;">
			<!-- [<a href="LoginPage" targat="_blank">去登录?</a>]&nbsp; -->
			[ <s:if test="#session.userType==@com.projection.util.Constant@USER">
			<a href="UserFace">首页</a>
			</s:if>
			 <s:if test="#session.userType==@com.projection.util.Constant@REVIEWER">
			<a href="ReviewerFace">首页</a>
			</s:if>
			 <s:if test="#session.userType==@com.projection.util.Constant@ADMIN">
			      <s:if test="#session.username==@com.projection.util.Constant@ADMINNAME">
						<a href="AggregateQuery">首页</a>
			      </s:if>
			      <s:else>
			      <a href="AdminFace">首页</a>
			      </s:else>
		     </s:if>
			]&nbsp;&nbsp;[<a href="LoginPage">去登录</a>]
		</p>
	</div>

	</form>

</body>
</html>
