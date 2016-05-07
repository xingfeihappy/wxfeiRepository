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
						<li class="content-box-li">
							<div class="content-box-img f-fl">
								<a href="dishDetail">
									<img src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
								</a>
							</div>
							<div class="content-box-text f-fl">
								<div class="text-title"><a>20134423434343(订单编号)</a></div><br />
								<div class="text-grade">
									<span>2014-05-12</span>
								</div>
								<br />
							</div>
							<div class="content-box-count f-fl">
								数量：<span>3</span>
							</div>
							<div class="content-box-join f-fl">
								总价：<span>￥250</span>
							</div>
							<div class="content-box-see-car f-fl">
								订单状态：<span>已付款</span>
							</div>
							<div class="content-box-see-car f-fl">
								评价：<a class="btn seeCar" style="background-color:#ff7200;color:#fff">去评价</a>
							</div>
							<div class="content-box-see-car f-fl">
								操作：<a class="btn seeCar" style="background-color:#ff7200;color:#fff">删除</a>
							</div>
						</li>
						<li class="content-box-li">
							<div class="content-box-img f-fl">
								<a href="dishDetail">
									<img src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
								</a>
							</div>
							<div class="content-box-text f-fl">
								<div class="text-title"><a>20134424343434343434343433434343(订单编号)</a></div><br />
								<div class="text-grade">
									<span>2014-05-12</span>
								</div>
								<br />
							</div>
							<div class="content-box-count f-fl">
								数量：<span>3</span>
							</div>
							<div class="content-box-join f-fl">
								总价：<span>￥250</span>
							</div>
							<div class="content-box-see-car f-fl">
								订单状态：<span>已付款</span>
							</div>
							<div class="content-box-see-car f-fl">
								评价：<a class="btn seeCar" href="goToAppraise" style="background-color:#ff7200;color:#fff">去评价</a>
							</div>
							<div class="content-box-see-car f-fl">
								操作：<a class="btn seeCar" style="background-color:#ff7200;color:#fff">删除</a>
							</div>
						</li>
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