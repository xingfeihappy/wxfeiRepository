<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理员登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/page/login.css">
<script language="JavaScript"> 
	if (window != top) 
	top.location.href = location.href; 
</script>
<style>
 .login-link1{color:#bfc9ca;display: block;margin-top: 15px;font-size: 13px;text-align: center;}
 .login-link1:hover{color:#31B0D5}
</style>
</head>
<body>
	<div class="container">
		<div class="login" style="margin-top: 10px">
			<div class="login-screen" style="height: 356px;">
				<div class="login-icon">
					<img
						src="${pageContext.request.contextPath}/resource/image/Pocket.png"
						alt="餐饮管理系统" />
					<h4>Welcome</h4>
				</div>
				<form class="login-form" action="LoginForm" method="post">
					<div class="form-group">
						<input type="text" class="form-control login-field"
							name="user.username" placeholder="输入您的账号" id="login-name" /> <label
							class="login-field-icon fui-user" for="login-name"></label>
					</div>
					<div class="form-group">
						<input type="password" class="form-control login-field"
							name="user.password" placeholder="输入您的密码" id="login-pass" /> <label
							class="login-field-icon fui-lock" for="login-pass"></label>
					</div>
					<input type="submit" class="btn btn-primary btn-lg btn-block">
					<a class="login-link1" href="registerPage" target="_blank">没有帐号，注册一个</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
