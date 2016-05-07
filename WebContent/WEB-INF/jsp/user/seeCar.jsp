<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的购物车</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body  onselectstart="return false;">
   		  <form id="form">
   		    <div class="nav-content">
				<div class="content-box">
					<ul>
					<s:iterator value="#session.car" id="entry">
						<li class="content-box-li">
							<div class="content-box-img f-fl">
								<a href="dishDetail">
									<img src="ShowDishesPhoto?dishes.id=<s:property value='key.id'/>" />
								</a>
							</div>
							<div class="content-box-text f-fl">
								<div class="text-title"><a><s:property value="key.name"/></a></div><br />
								<div class="text-grade">
									<span><a><s:property value="#dishes.description"/></a></span>
								</div>
								<br />
								<div class="text-type">
									<span><s:property value='key.type.type'/></span>
								</div>
								<br />
							</div>
							<div class="content-box-price f-fl">
								<div class="text-price">
									单价：&nbsp;&nbsp;<span><s:property value='key.price'/></span>
								</div>
							</div>
							<div class="content-box-count f-fl">
								数量：&nbsp;&nbsp;<button type="button" class="denis" style="color:#fff;width:20px;border:0;background-color:#ff7200"> - </button>
								<input type="text" value="<s:property value='value' />" readonly="true" class="dishcount" style="width:60px" value="0"/>
								<button class="plus" type="button" style="color:#fff;width:20px;border:0;background-color:#ff7200"> + </button>
							</div>
							<div class="content-box-join f-fl">
								<div class="text-price" style="margin-top:0;padding-top:0">
									小计：&nbsp;&nbsp;<span><s:property value='key.price*value'/></span>
								</div>							</div>
							<div class="content-box-see-car f-fl">
								<a class="btn seeCar" href="deleteFromCar?dishes.id=<s:property value='key.id'/>" style="background-color:#ff7200;color:#fff">删除</a>
							</div>
						</li>
						</s:iterator>
						
						<li class="content-box-li1">
							<div>应付金额：<span class="">￥23</span></div>
						</li>
					</ul>
					<input type="button" class="btn submitCar f-fr" style="background-color:#ff7200;color:#fff;margin-right:6%" value="提交订单"/>
				</div>   		    	
   			</div>
   		  </form>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
   <script>
	  
	   /* 数量的加减 */
	   var dishcount;
	   var count = $(".dishcount").attr("value");;
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
	   $(".submitCar").click(function(){
		   if($(".dishcount").attr("value") == 0){
			   Showbo.Msg.confirm('餐车中有数量为0的菜',function(flag){
					if(flag=='yes'){}	
				}); 
		   }else{
			   $("#form").submit();
		   }
	   })
   </script>
</body>
</html>