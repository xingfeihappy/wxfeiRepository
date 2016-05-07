<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>过滤菜品</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body onselectstart="return false;">
	<div class="content-box">
		<ul>
		<s:iterator value="dishesList" id="dishes">
		<form action="addCar" method="post" id="form">
		<input type="hidden" name="dishes.id" value="<s:property value='#dishes.id'/>" />
	
		<li class="content-box-li">
				<div class="content-box-img f-fl">
					<a href="dishDetail" target="_top"> <img
						src="ShowDishesPhoto?dishes.id=<s:property value='#dishes.id'/>" />
					</a>
				</div>
				<div class="content-box-text f-fl">
					<div class="text-title">
						<a><s:property value="#dishes.name"/></a>
					</div>
					<br />
					<div class="text-grade">
						<span><a><s:property value="#dishes.description"/></a></span>
					</div>
					<br />
					<div class="text-type">
						<span><s:property value="#dishes.type.type"/></span>
					</div>
					<br />
				</div>
				<div class="content-box-price f-fl">
					<div class="text-price">
						<span>￥<s:property value="#dishes.price"/></span>
					</div>
				</div>
				<div class="content-box-count f-fl">
					<button class="denis" type="button"
						style="color: #fff; width: 20px; border: 0; background-color: #ff7200">
						-</button>
					<input type="text" readonly="true" name="amount" class="dishcount"
						style="width: 60px" value="0" />
					<button class="plus" type="button"
						style="color: #fff; width: 20px; border: 0; background-color: #ff7200">
						+</button>
				</div>
				<div class="content-box-join f-fl">
					<input type="button" class="btn addCar"
						style="background-color: #ff7200; color: #fff" value="加入餐车" />
				</div>
				<div class="content-box-see-car f-fl">
					<a class="btn seeCar" href="seeCar" target="_top"
						style="background-color: #ff7200; color: #fff">查看餐车(<s:property value="#session.car.size" />件)</a>
				</div>
			</li>
			</form>
		</s:iterator>
		</ul>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
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
	   /* 数量的加减 */
	   var dishcount;
	   var count = 0;
	   $(".denis").click(function(){
		   dishcount = $(".dishcount").attr("value");
		   if(dishcount <= 0){
			   count = 0;
			   $(this).next().attr("value",count);
		   }else{
			   count--;
			   $(this).next().attr("value",count);
		   }
	   })
	   $(".plus").click(function(){
		   dishcount = $(".dishcount").attr("value");
		   count++;
		   $(this).prev().attr("value",count);
	   })
	    /* 判断加入购物车 前判断数量*/
	   $(".addCar").click(function(){
		   if($(".dishcount").attr("value") == 0){
			   Showbo.Msg.confirm('请先添加数量',function(flag){
					if(flag=='yes'){
						
					}	
				}); 
		   }else{
			   $("#form").submit();
		   }
	   })
   </script>
</body>
</html>