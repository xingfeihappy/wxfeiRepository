<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户首页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body style="min-width:800px" onselectstart="return false;">
   <div class="g-top">
     <div class="f-clearSpace container">
       <div class="row">
          <div class="top">
          <!-- 普通用户 -->
		    <ul class="nav clearfix">
			   <li><span style="color: #000;margin-left: 30px;"><i class="logo1" style="margin-right: 8px;"></i>welcome：<s:property value="#session.user.username"/><%-- <%=session.getAttribute(Constant.USER_NAME) %> --%></span></li>
               <s:if test="#session.user == null"><li><span style="color: #000;margin-left: 30px;"><i class="logo5" style="margin-right: 8px;"></i>登录</span></li></s:if>
               <li><a href="registerPage" style="cursor:pointer;color: #000;margin-left: 30px;padding:0"><i class="logo5" style="margin-right: 8px;"></i>注册</a></li>
               <li><a style="padding:0;cursor:pointer" href="myOrders" target="right"><span href="#" style="color: #000;margin-left: 30px;"><i class="logo5" style="margin-right: 8px;"></i>我的订单</span></a></li>
               <li><a style="padding:0;cursor:pointer" href="seeCar" target="right"><span href="#" style="color: #000;margin-left: 30px;"><i class="logo5" style="margin-right: 8px;"></i>我的餐车</span></a></li>
			   <li class="drop" style="height: 30px;"><span style="color: #000;margin-left: 30px;cursor: pointer;position: relative;">个人资料</span>
					<ul class="sub_menu">
						<li><a href="ModifyPassword"  target="right">密码修改</a></li>
					</ul>
				</li>
				<li class="topright"><span onclick="login()" style="color: #000;cursor:pointer"><i class="logo4" style="margin-right: 8px;"></i>退出</span></li>
				<li class="topright" ><span style="color: #000;"><i class="logo3" style="margin-right: 8px;"></i><span id="timer" style="color: #000;">2016-01-10</span></span></li>
			</ul>
	     </div>
       </div>
     </div>
   </div>
   <div class="g-banner">
     <div class="container">
       <div class="row">
          <div class="g-banner-content">
          <a class="logo">
            <div class="logo-img f-fl"></div>
            <div class="logo-text f-fl">
              <span class="logo-text-t1" style="font-size:25px; font-family: 微软雅黑, sans-serif;">美食广场</span>
            </div>
          </a>
          <form class="search_box f-fr" action="DishesSearch" method="post">
            <input type="text" value="<s:property value="dishes.name" />" name="dishes.name" class="search_input" placeholder="输入检索内容" />
            <button type="submit" class="btn-search">&nbsp;</button>
          </form>
         </div>
       </div>
     </div>
   </div>
   <!-- 管理员 -->
   <div class="g-main">
     <div class="container">
       <div class="row">
         <div class="navmenu">
			<ul>
				<li class="mainlevel"><a href="filterDish?type=-1" target="right">首页</a></li>
				<li class="mainlevel"><a href="anotherFilter?type=1" target="right">推荐菜</a></li>
				<li class="mainlevel"><a href="anotherFilter?type=2" target="right">新上新</a></li>
				<li class="mainlevel"><a href="anotherFilter?type=3" target="right">都说好</a></li>
				<li class="mainlevel"><a href="anotherFilter?type=4" target="right">大酬宾</a></li>
			</ul>
		</div>
		
       </div>
     </div>
   </div>
	<div class="g-main-content" style="">
		<div class="container">
			<div class="row">
				<div class="top-nav">
					<ul class="top-nav-ul">
						<li class="top-nav-ul-li"><a href="filterDish?type=-1" target="right">
								<i class="item1"></i> <span>全部</span>
						</a></li>
						<s:iterator value="#session.dishesTypes" status="index" >
						<li class="top-nav-ul-li"><a href="filterDish?type=<s:property value='id'/>" target="right">
								<i class="item<s:property value='#index.index+2'/>"></i> <span><s:property value="type" /></span></a></li>
						</s:iterator>
					</ul>
				</div>
				<iframe name="right" src="filterDish?type=-1" id="iframe" scrolling="no"
					marginWidth="0" onLoad="" frameborder="0"
					style="width: 100%; height: 2000px; margin: 0px; padding: 0px;"></iframe>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
	<script>
	   function login(){
		   location.href='LoginPage'
	   }
   </script>
</body>
</html>