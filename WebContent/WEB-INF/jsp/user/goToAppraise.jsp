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
<form action="appraise" method="post">
	<div class="g-main1" style="">
		<div class="appraise-total">我的总体评价：</div>
		
		<input type="radio" name="message.grade" value="5" />强烈推荐
		<input type="radio" name="message.grade" value="4" />很满意
		<input type="radio" name="message.grade" value="3" />满意
		<input type="radio" name="message.grade" value="2" />一般
		<input type="radio" name="message.grade" value="1" />差
		<input type="radio" name="message.grade" value="0" />强烈不推荐
		<div>&nbsp;</div>
		<div style="padding: 10px 0 10px 0;">
			<div>菜品口味如何？服务周到吗？环境如何？（写够15字，才是好同志~）</div>
			<br />
			<table style="width: 60%;">
				<tr>
					<td><textarea name="message.content" style="border: 2px solid #eee" rows="10"></textarea></td>
				</tr>
			</table>
			<div>推荐的菜：</div>
			<s:iterator value="dishesSet" id="dish">
			<input type="checkbox" name="recommendation" value="<s:property value='#dish.id'/>" /><s:property value='#dish.name'/>
			</s:iterator>
			<input type="hidden" name="order.id" value="${order.id }" />
			<s:if test="order.state==1"><input type="submit" class="btn addCar"
				style="margin-top: 10px; background-color: #ff7200; color: #fff"
				value="提交评价" />
			<div style="color: #999; margin-top: 10px">* 提交后即不能修改</div>
			</s:if>
			<%-- <s:else>
				<div id="" style="background-color: transparent;width: 1024px;height: 474px;position: absolute; top: 0px;">
			</s:else> --%>
		</div>
	</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</body>
</html>
