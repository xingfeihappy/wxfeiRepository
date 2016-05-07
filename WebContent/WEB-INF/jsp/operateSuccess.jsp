<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>操作成功提示</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body style="font-family: "宋体","Arial";">
    <a class="btn btn-primary back f-fl" onclick="history.go(-1)" target="right">返 回</a><br /><br /><br />
	<br>
	<div style="margin: 10px auto; text-align: center;">
		<img src="${pageContext.request.contextPath}/resource/image/success.png" align="absmiddle" style="border-width:0px;">&nbsp;
		<span style="font-size:16px;font-weight:bold;">操作成功！</span>
	</div>
</body>
</html>
