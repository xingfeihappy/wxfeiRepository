<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在线选座</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body onselectstart="return false;">
   <div class="g-main-content">
   		    <div class="nav-content">
				<div class="content-box">
					<ul class="content-box-li-hover">
					  <s:iterator value="seatList" id="entry">
						<li class="content-box-li " style="width:20%">
							<span>容纳人数：<s:property value="containPeople" /></span><br />
							<span>状态：<s:if test="state==0">可用</s:if><s:else>不可用</s:else></span><br />
							<span>备注：<s:property value="remark" /></span><br />
							<a href="" style="margin-top:15px" class="btn btn-default">选定该座位</a>
						</li>
					  </s:iterator>
					</ul>
				</div>   		    	
   			</div>
       	</div>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</body>
</html>