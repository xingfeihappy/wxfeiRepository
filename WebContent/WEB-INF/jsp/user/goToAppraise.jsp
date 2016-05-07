<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>评价页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body onselectstart="return false;">
	<div class="g-main1" style="">
		<div class="appraise-total">我的总体评价：</div>
		<ul class="appraise-ul" style="padding: 10px 0 10px 10%;">
			<li>强烈推荐</li>
			<li>很满意</li>
			<li>满意</li>
			<li>一般</li>
			<li>差</li>
		</ul>
		<div>&nbsp;</div>
		<div style="padding: 10px 0 10px 10%;">
			<div>菜品口味如何？服务周到吗？环境如何？（写够15字，才是好同志~）</div>
			<br />
			<table style="width: 60%;">
				<tr>
					<td><textarea style="border: 2px solid #eee" rows="10">232</textarea></td>
				</tr>
			</table>
			<input type="submit" class="btn addCar"
				style="margin-top: 10px; background-color: #ff7200; color: #fff"
				value="提交评价" />
			<div style="color: #999; margin-top: 10px">* 提交后即不能修改</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</body>
</html>