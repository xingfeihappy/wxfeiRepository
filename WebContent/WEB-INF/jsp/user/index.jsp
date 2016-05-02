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
				<li class="mainlevel"><a href="" target="main">首页</a></li>
				<li class="mainlevel"><a>推荐菜</a></li>
				<li class="mainlevel"><a>新上新</a></li>
				<li class="mainlevel"><a>评分高</a></li>
				<li class="mainlevel"><a>大酬宾</a></li>
			</ul>
		</div>
		
       </div>
     </div>
   </div>
   
   <div class="g-main1" style="">
     <div class="container">
       <div class="row">
         <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 f-clearPadding">
           <div class="navcontent">
			<table>
			  <tr>
			  	<td>
			  		<span>美食</span>
			  		<div class="dishes-type">
			  		  <ul>
			  		     <li><a>主食系列</a></li>
			  		     <li><a>荤菜系列</a></li>
			  		     <li><a>蔬菜系列</a></li>
			  		     <li><a>海鲜系列</a></li>
			  		     <li><a>凉菜系列</a></li>
			  		     <li><a>点心系列</a></li>
			  		     <li><a>汤羹系列</a></li>
			  		     <li><a>饮料系列</a></li>
			  		  </ul>
			  		</div>
			  	</td>
			  </tr>
			</table>
		</div>
       </div>
       <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 kdLeft">
		     <div class="right_content_box" >
		        <div class="rightcontent">
		        	<div class="content-box1 f-fl">
		        		<div class="face-box-img">
							<img src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
		        		</div>
		        		<div class="face-box-text">
		        			<div class="facetext-name">酸辣土豆丝</div>
		        			<div class="facetext-price">￥20.9</div>
		        			<div class="facetext-grade">8分</div>
		        		</div>
		        	</div>
		        	<div class="content-box1 f-fl">
		        		<div class="face-box-img">
							<img src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
		        		</div>
		        		<div class="face-box-text">
		        			<div class="facetext-name">酸辣土豆丝</div>
		        			<div class="facetext-price">￥20.9</div>
		        			<div class="facetext-grade">8分</div>
		        		</div>
		        	</div>
		        	<div class="content-box1 f-fl">
		        		<div class="face-box-img">
							<img src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
		        		</div>
		        		<div class="face-box-text">
		        			<div class="facetext-name">酸辣土豆丝</div>
		        			<div class="facetext-price">￥20.9</div>
		        			<div class="facetext-grade">8分</div>
		        		</div>
		        	</div>
		        	<div class="content-box1 f-fl">
		        		<div class="face-box-img">
							<img src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
		        		</div>
		        		<div class="face-box-text">
		        			<div class="facetext-name">酸辣土豆丝</div>
		        			<div class="facetext-price">￥20.9</div>
		        			<div class="facetext-grade">8分</div>
		        		</div>
		        	</div>
		        </div>
		     </div>
	    </div> 
      </div>
     </div>
   </div>
   
   <div class="g-main-content" style="display:none">
   	<div class="container">
   		<div class="row">
   			<div class="top-nav">
   				<ul class="top-nav-ul">
   					<li class="top-nav-ul-li">
   						<a>
   							<i class="item1"></i>
   							<span>全部</span>
   						</a>
   					</li>
   					<li class="top-nav-ul-li">
   						<a>
	   						<i class="item2"></i>
	   						<span>主食</span>
   						</a>
   					</li>
   					<li class="top-nav-ul-li">
   						<a>
   							<i class="item3"></i>
   							<span>荤菜</span>
   						</a>
   						
   					</li>
   					<li class="top-nav-ul-li">
   						<a>
   							<i class="item4"></i>
   							<span>蔬菜</span>
   						</a>
   					</li>
   					<li class="top-nav-ul-li">
   						<a>
   							<i class="item5"></i>
   							<span>海鲜</span>
   						</a>
   						
   					</li>
   					<li class="top-nav-ul-li">
   						<a>
   							<i class="item6"></i>
   							<span>凉菜</span>
   						</a>
   					</li>
   					<li class="top-nav-ul-li">
   						<a>
   							<i class="item7"></i>
   							<span>点心</span>
   						</a>
   					</li>
   					<li class="top-nav-ul-li">
   						<a>
   							<i class="item8"></i>
   							<span>汤羹</span>
   						</a>
   					</li>
   					<li class="top-nav-ul-li">
   						<a>
   							<i class="item9"></i>
   							<span>饮料</span>
   						</a>
   					</li>
   				</ul>
   			</div>
   			
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
							<div class="content-box-count f-fl">
								<button class="denis" style="color:#fff;width:20px;border:0;background-color:#ff7200"> - </button>
								<input type="text" class="dishcount" style="width:60px" value="0"/>
								<button class="plus" style="color:#fff;width:20px;border:0;background-color:#ff7200"> + </button>
							</div>
							<div class="content-box-join f-fl">
								<input type="submit" class="btn" style="background-color:#ff7200;color:#fff" value="加入餐车" />
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
   </script>
</body>
</html>