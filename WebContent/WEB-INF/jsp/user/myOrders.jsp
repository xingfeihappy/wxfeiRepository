<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body onselectstart="return false;">
   <div class="g-main-content">
   		    <div class="nav-content">
				<div class="content-box">
					<ul>
					<s:iterator value="orders" id="order">
						<li class="content-box-li">
							<div class="content-box-img f-fl">
								<a>
									<img src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
								</a>
							</div>
							<div class="content-box-text f-fl" style="width:20%">
								<div class="text-title"><a>订单：<s:property value="#order.codes"/></a></div><br />
								<div class="text-grade">
									<span>下单时间:<s:date name="#order.dinnerTime" format="yyyy-MM-dd"/></span>
								</div>
								<br />
								<div class="text-grade">
									<span>餐桌号：<s:if test="#order.seat!=null"><s:property value="#order.seat.id"/></s:if><s:else><a href="chooseSeatPage?order.id=<s:property value="#order.id"/>">去选座</a></s:else></span>
								</div>
							</div>
							<div class="content-box-join f-fl" style="width:18%">
								总价：<span><s:property value="#order.totalMoney"/></span>
							</div>
							<div class="content-box-see-car f-fl" style="width:20%">
								订单状态：<span>
								<s:if test="#order.state==0">已下单</s:if>
								<s:if test="#order.state==1">已完成</s:if>
								<s:if test="#order.state==2">已评价</s:if>
								</span>
							</div>
							<s:if test="#order.state==1">
							<div class="content-box-see-car f-fl">
								评价：
									<a class="btn seeCar" href="goToAppraise?order.id=<s:property value='#order.id'/>" style="background-color:#ff7200;color:#fff">去评价</a>
							</div>
							 </s:if>
							<div class="content-box-see-car f-fl">
								操作：<a class="btn seeCar" href="deleteOrder?order.id=<s:property value='#order.id'/>" style="background-color:#ff7200;color:#fff">删除</a>
							</div>
						</li>
						</s:iterator>
					</ul>
				</div>   		    	
   			</div>
       	</div>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</body>
</html>