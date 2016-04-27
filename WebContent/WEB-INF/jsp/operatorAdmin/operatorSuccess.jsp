<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>个人基本信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body style="font-family: "宋体","Arial";">
<form>
	<br>
	<div style="margin: 10px auto; text-align: center;">
		<img src="${pageContext.request.contextPath}/resource/image/messok.gif" align="absmiddle" style="border-width:0px;">&nbsp;
		<span style="font-size:16px;font-weight:bold;">操作成功！</span>
	</div>
	<div align="center" style="font-size: 12pt; line-height: 180%; width: 500px; margin: 10px auto;
		border: solid 1px #e0e0e0; padding: 20px; background-color: #f6f6f6;">
		&nbsp; &nbsp;

		操作成功，您可以在课题库中查看！
		<p align="center" style="font-size: 9pt;">
			[<s:if test="#session.userType==@com.projection.util.Constant@USER">
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
		     </s:if>]
		</p>
	</div>

	</form>

</body>
</html>
