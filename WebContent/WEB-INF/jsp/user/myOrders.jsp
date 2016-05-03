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
<body style="min-width:800px" onselectstart="return false;">
   <div class="g-top">
     <div class="f-clearSpace container">
       <div class="row">
          <div class="top">
          <!-- 普通用户 -->
		    <ul class="nav clearfix">
			   <li><span href="#" style="color: #000;margin-left: 30px;"><i class="logo1" style="margin-right: 8px;"></i>welcome：yihao</span></li>
               <li><span href="#" style="color: #000;margin-left: 30px;"><i class="logo5" style="margin-right: 8px;"></i>登录</span></li>
               <li><span href="#" style="color: #000;margin-left: 30px;"><i class="logo5" style="margin-right: 8px;"></i>注册</span></li>
               <li><span href="#" style="color: #000;margin-left: 30px;"><i class="logo5" style="margin-right: 8px;"></i>我的订单</span></li>
			   <li class="drop" style="height: 30px;"><span style="color: #000;margin-left: 30px;cursor: pointer;position: relative;">个人资料</span>
					<ul class="sub_menu">
						<li><a href="modifyPassword.html"  target="right">修改密码</a></li>
						<li><a href="personinformation.html"  target="right">修改资料</a></li>
					</ul>
				</li>
				<li class="topright"><span onclick="login()" style="color: #000;cursor:pointer"><i class="logo4" style="margin-right: 8px;"></i>退出</span></li>
				<li class="topright" ><span style="color: #000;"><i class="logo3" style="margin-right: 8px;"></i><span id="timer" style="color: #000;">2016-01-10</span></span></li>
			</ul>
	     </div>
       </div>
     </div>
   </div>
   
   <div class="g-main-content">
   	<div class="container">
   		<div class="row">
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
								评价：<a class="btn seeCar" style="background-color:#ff7200;color:#fff">去评价</a>
							</div>
							<div class="content-box-see-car f-fl">
								操作：<a class="btn seeCar" style="background-color:#ff7200;color:#fff">删除</a>
							</div>
						</li>
					</ul>
				</div>   		    	
   			</div>
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
   <script>
	   function login(){
		   location.href='login.html'
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
	   /* 数量的加减 */
	   var dishcount;
	   var count = 0;
	   $(".denis").click(function(){
		   dishcount = $(".dishcount").attr("value");
		   if(dishcount <= 0){
			   count = 0;
			   $(".dishcount").attr("value",count);
		   }else{
			   count--;
			   $(".dishcount").attr("value",count);
		   }
	   })
	   $(".plus").click(function(){
		   dishcount = $(".dishcount").attr("value");
		   count++;
		   $(".dishcount").attr("value",count);
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