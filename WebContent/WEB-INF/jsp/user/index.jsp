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
			   <li><span href="#" style="color: #000;margin-left: 30px;"><i class="logo1" style="margin-right: 8px;"></i>welcome：<s:property value="#session.user.username"/><%-- <%=session.getAttribute(Constant.USER_NAME) %> --%></span></li>
               <s:if test="user.userType.length <0"><li><span href="#" style="color: #000;margin-left: 30px;"><i class="logo5" style="margin-right: 8px;"></i>登录</span></li></s:if>
               <li><span href="#" style="color: #000;margin-left: 30px;"><i class="logo5" style="margin-right: 8px;"></i>注册</span></li>
               <li><span href="#" style="color: #000;margin-left: 30px;"><i class="logo5" style="margin-right: 8px;"></i>我的订单</span></li>
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
              <span class="logo-text-t1" style="font-size:25px; font-family: 微软雅黑, sans-serif;"></span><br />
              <span class="logo-text-t2">sea </span>
            </div>
          </a>
           <form class="search_box f-fr">
            <input type="text" class="search_input" placeholder="  输入检索内容" />
            <button class="btn-search">&nbsp;</button>
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
				<li class="mainlevel"><a href="filterDish" target="right">首页</a></li>
				<li class="mainlevel"><a href="filterDish" target="right">推荐菜</a></li>
				<li class="mainlevel"><a href="filterDish" target="right">新上新</a></li>
				<li class="mainlevel"><a href="filterDish" target="right">评分高</a></li>
				<li class="mainlevel"><a href="filterDish" target="right">大酬宾</a></li>
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
						<li class="top-nav-ul-li"><a href="filterDish" target="right">
								<i class="item1"></i> <span>全部</span>
						</a></li>
						<li class="top-nav-ul-li"><a href="filterDish" target="right">
								<i class="item2"></i> <span>主食</span>
						</a></li>
						<li class="top-nav-ul-li"><a href="filterDish" target="right">
								<i class="item3"></i> <span>荤菜</span>
						</a></li>
						<li class="top-nav-ul-li"><a href="filterDish" target="right">
								<i class="item4"></i> <span>蔬菜</span>
						</a></li>
						<li class="top-nav-ul-li"><a href="filterDish" target="right">
								<i class="item5"></i> <span>海鲜</span>
						</a></li>
						<li class="top-nav-ul-li"><a href="filterDish" target="right">
								<i class="item6"></i> <span>凉菜</span>
						</a></li>
						<li class="top-nav-ul-li"><a href="filterDish" target="right">
								<i class="item7"></i> <span>点心</span>
						</a></li>
						<li class="top-nav-ul-li"><a href="filterDish" target="right">
								<i class="item8"></i> <span>汤羹</span>
						</a></li>
						<li class="top-nav-ul-li"><a href="filterDish" target="right">
								<i class="item9"></i> <span>饮料</span>
						</a></li>
					</ul>
				</div>
				<iframe name="right" src="filterDish" id="iframe" scrolling="no"
					marginWidth="0" onLoad="" frameborder="0"
					style="width: 100%; height: 3000px; margin: 0px; padding: 0px;"></iframe>
				<!-- <div class="g-footer">
      <div class="container f-clearSpace">
       <div class="row">
          iopopopop
       </div>
      </div>
   </div> -->
				<script type="text/javascript"
					src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
				<script type="text/javascript"
					src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
				<script type="text/javascript"
					src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
				<script>
	   function login(){
		   location.href='LoginPage'
	   }
	   $(".navcontent table tr").mouseover(function(){
		   $(this).parent().css({"border-left":"2px solid #eee","border-right":"0px","border-bottom":"0px"})
		   $(".dishes-type").fadeIn("3000");
	   })
	   $(".navcontent table tr").mouseleave(function(){
		   $(this).parent().css({"border": "1px solid #eee",
				    "border-top": "2px solid #ff7200"})
		   $(".dishes-type").fadeOut("3000");
	   })
	   $(".dishes-type ul li a,.navmenu ul li a").click(function(){
		   $(".g-main1").css("display","none");
		   $(".g-main-content").css("display","");
	   })
	    /* 判断加入购物车 前判断数量*/
	   $(".addCar").click(function(){
		   if($(".dishcount").attr("value") == 0){
			   Showbo.Msg.confirm('请先添加数量',function(flag){
					if(flag=='yes'){}	
				}); 
		   }
	   })
   </script>
</body>
</html>