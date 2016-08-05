<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜品的详细信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body onselectstart="return false;">
 	<div class="nav-content">
		<div class="content-box">
			<ul>
				<li class="content-box-li">
					<div class="content-box-img f-fl">
						<a>
							<img src="ShowDishesPhoto?dishes.id=${dishes.id }" id="fileInput" width="200" height="100" alt="" />
						</a>
					</div>
					<div class="content-box-text f-fl">
						<div class="text-title"><s:property value="dishes.name" /></div><br />
						<div class="text-grade">
							<span><s:property value="dishes.description" /></span>
						</div>
						<br />
						<div class="text-type">
							<span><s:property value="dishes.type.type" /></span>
						</div>
						<br />
					</div>
					<div class="content-box-price f-fl">
						<div class="text-price">
							<span>￥<s:property value="dishes.price" /></span>
						</div>
					</div>
				</li>
			</ul>
		</div>   		    	
 	</div>
   
   
   <!-- 评价的页面 -->
   <div class="appraise-box">
   		<div class="appraise-box-common">
   			<div class="appraise-box-avg">
   				<div class="avg-grade f-fl">
   					<span class="avg-grade-grade"><s:property value="dishes.recommended" />人推荐</span>
   				</div>
   				<div class="avg-people f-fl">
   					<div style="color:#999">大家喜欢吃</div>
   					<ul>
   						<li><s:property value="dishesList.get(0).name" /> <s:property value="dishesList.get(0).recommended" /></li>
   						<li><s:property value="dishesList.get(1).name" /> <s:property value="dishesList.get(1).recommended" /></li>
   						<li><s:property value="dishesList.get(2).name" /> <s:property value="dishesList.get(2).recommended" /></li>
   						<li><s:property value="dishesList.get(3).name" /> <s:property value="dishesList.get(3).recommended" /></li>
   					</ul>
   				</div>
   			</div>
   			<hr />
   			<s:if test="messageList.size() == 0">
   			<p>暂无评价</p>
   			</s:if>
   			<s:iterator value="messageList" status="index">
   			<div class="appraise-box-title"></div>
   			<ul class="appraise-box-ul">
   				<li>
   					<p><s:property value="user.username" /></p>
   					<p><img src="" /><s:property value="grade" /></p>
   					<p><s:property value="content" /></p>
   				</li>
   			</ul>
   			</s:iterator>
   		</div>
   	</div>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</body>
</html>