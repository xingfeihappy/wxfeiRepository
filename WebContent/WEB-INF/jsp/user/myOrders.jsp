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
								<a href="dishDetail">
									<img src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
								</a>
							</div>
							<div class="content-box-text f-fl">
								<div class="text-title"><a><s:property value="#order.codes"/>(订单编号)</a></div><br />
								<div class="text-grade">
									<span><s:property value="#order.dinnerTime"/></span>
								</div>
								<br />
							</div>
							<div class="content-box-join f-fl">
								总价：<span><s:property value="#order.totalMoney"/></span>
							</div>
							<div class="content-box-see-car f-fl">
								订单状态：<span><s:property value="#order.state"/></span>
							</div>
							<div class="content-box-see-car f-fl">
								评价：<a class="btn seeCar" href="goToAppraise?order.id=<s:property value='#order.id'/>" style="background-color:#ff7200;color:#fff">去评价</a>
							</div>
							<div class="content-box-see-car f-fl">
								操作：<a class="btn seeCar" href="deleteOrder?order.id=<s:property value='#order.id'/>" style="background-color:#ff7200;color:#fff">删除</a>
							</div>
						</li>
						</s:iterator>
					</ul>
				</div>   		    	
   			</div>
       	</div>
   <!-- <div class="g-footer">
      <div class="container f-clearSpace">
       <div class="row">
          iopopopop
       </div>
      </div>
   </div> -->
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</body>
</html>