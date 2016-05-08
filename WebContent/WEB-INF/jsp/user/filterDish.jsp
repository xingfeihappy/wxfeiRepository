<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>过滤菜品</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body onselectstart="return false;">
	<div class="content-box">
		<ul>
		<s:iterator value="dishesList" id="dishes">
		<form action="addCar" method="post" id="form">
		<input type="hidden" name="dishes.id" value="<s:property value='#dishes.id'/>" />
	
		<li class="content-box-li">
				<div class="content-box-img f-fl">
					<a href="dishDetail?dishes.id=<s:property value='#dishes.id'/>" target="_self"> <img
						src="ShowDishesPhoto?dishes.id=<s:property value='#dishes.id'/>" />
					</a>
				</div>
				<div class="content-box-text f-fl">
					<div class="text-title">
						<a><s:property value="#dishes.name"/></a>
					</div>
					<br />
					<div class="text-grade">
						<span><a><s:property value="#dishes.description"/></a></span>
					</div>
					<br />
					<div class="text-type">
						<span><s:property value="#dishes.type.type"/></span>
					</div>
					<br />
				</div>
				<div class="content-box-price f-fl">
					<div class="text-price">
						<span>￥<s:property value="#dishes.price"/></span>
					</div>
				</div>
				<div class="content-box-count f-fl">
					<button type="button" onclick='window.location.href="minusCar?dishes.id=<s:property value='#dishes.id'/>&fromIndex=1"'
						style="color: #fff; width: 20px; border: 0; background-color: #ff7200">
						-</button>
					
					<s:if test="#session.car.get(#dishes)!=null">
					<input type="text" readonly="true" value="<s:property value='#session.car.get(#dishes)' />" class="dishcount" style="width: 60px" />
					</s:if>
					<s:else>
					<input type="text" readonly="true" value="0" class="dishcount" style="width: 60px" />
					</s:else>
					
					<button type="button" onclick='window.location.href="addCar?dishes.id=<s:property value='#dishes.id'/>&fromIndex=1"'
						style="color: #fff; width: 20px; border: 0; background-color: #ff7200">
						+</button>
				</div>

				<div class="content-box-see-car f-fl">
					<a class="btn seeCar" href="seeCar" target="_self"
						style="background-color: #ff7200; color: #fff">查看餐车(<s:property value="totalAmount" />件)</a>
				</div>
			</li>
			</form>
		</s:iterator>
		</ul>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</body>
</html>