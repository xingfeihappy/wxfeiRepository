<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/page/pageError_404.css">
<title>下载出错页面</title>
</head>
<body>
		<!--start-wrap--->
		<div class="wrap">
			<!--start-content------>
			<div class="content">
				<img src="${pageContext.request.contextPath}/resource/image/error-img.png" title="error" />
				<p><span><label>O</label>hh.....</span>抱歉，您所请求的文件已经不存在</p>
 				<s:if test="#session.userType==@com.projection.util.Constant@USER">
				<a href="UserFace">返回首页</a>
				</s:if>
				 <s:if test="#session.userType==@com.projection.util.Constant@REVIEWER">
				<a href="ReviewerFace">返回首页</a>
				</s:if>
				 <s:if test="#session.userType==@com.projection.util.Constant@ADMIN">
				      <s:if test="#session.username==@com.projection.util.Constant@ADMINNAME && #session.userType==@com.projection.util.Constant@ADMIN">
							<a href="AggregateQuery">返回首页</a>
				      </s:if>
				      <s:else>
				      <a href="AdminFace">返回首页</a>
				      </s:else>
			     </s:if>
				<div class="copy-right">
					<p>版权所有@ <a href="#">西湖博物馆</a></p>
				</div>
   			</div>
			<!--End-Cotent------>
		</div>
		<!--End-wrap--->
	</body>
</html>