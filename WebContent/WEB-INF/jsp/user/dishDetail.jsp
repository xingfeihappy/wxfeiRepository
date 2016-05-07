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
									<img src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
								</a>
							</div>
							<div class="content-box-text f-fl">
								<div class="text-title"><a>包心菜</a></div><br />
								<div class="text-grade">
									<span>333</span>
									<span><a>406条评价</a></span>
								</div>
								<br />
								<div class="text-type">
									<span>zhushi</span>
								</div>
								<br />
							</div>
							<div class="content-box-price f-fl">
								<div class="text-price">
									<span>￥2.0</span>
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
   					<span class="avg-grade-grade">3.7分</span>
   					<div class="avg-grade-countPeople">共<span style="color:#f76120">123</span>人评价</div>
   				</div>
   				<div class="avg-people f-fl">
   					<div style="color:#999">大家都在说</div>
   					<ul>
   						<li>味道好 2</li>
   						<li>量大 3</li>
   						<li>环境好 3</li>
   					</ul>
   				</div>
   			</div>
   			<div class="appraise-box-title"></div>
   			<ul class="appraise-box-ul">
   				<li>
   					<p><s:property value="user.username" />wxf</p>
   					<p><img src="" />8分</p>
   					<p><s:property value="content" />真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃</p>
   				</li>
   			</ul>
   			<div class="appraise-box-title"></div>
   			<ul class="appraise-box-ul">
   				<li>
   					<p><s:property value="user.username" />wxf</p>
   					<p><img src="" />8分</p>
   					<p><s:property value="content" />真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃真他妈难吃</p>
   				</li>
   			</ul>
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