<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看订单的详细信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
  <a class="btn btn-default f-fl"  onclick="history.go(-1)" target="right" style="width:70px;">返 回</a>&nbsp;&nbsp;
  <br/>
  <span id="sp" style="display:none"></span><br /><br />
	   <table class="table table-bordered table-width">
	     <tr>
	       <td width="19%">订单编号</td>
	       <td width="31%" colspan="3"><s:property value="order.codes" /></td>
	     </tr>
	     <tr>
	       <td width="19%">菜量</td>
	       <td width="31%"><s:property value="order.foodNum" /></td>
	       <td width="19%">消费总计</td>
	       <td><s:property value="order.totalMoney" /></td>
	     </tr>
	     <tr>
	       <td  width="19%">下单时间</td>
	       <td  width="31%"><s:date name="order.dinnerTime" format="yyyy-MM-dd"/></td>
	       <td width="19%">状态</td>
	       <td><s:property value="order.state" /></td>
	     </tr>
	     <tr>
	       <td  width="19%">下单人</td>
		   <td><s:property value="order.user.username" /></td>	       
		   <td width="19%">餐位</td>
	       <td><s:property value="order.seat.id" /></td>
	     </tr>
	     <s:iterator value="order.dishesSet" status="indexs">
	     <tr>
	     	<td colspan="4">
				<ul>
					<li class="content-box-li" style="border:0;padding-left:0">
						<div class="content-box-img f-fl">
							<a> <img
								src="http://p1.meituan.net/208.126/deal/__15908739__2365685.jpg" />
							</a>
						</div>
						<div class="content-box-text f-fl">
							<div class="text-title">
								<a><s:property value="name" /></a>
							</div>
							<div class="text-type">
								<span><s:property value="type" /></span>
							</div>
							<br />
						</div>
						<div class="content-box-price f-fl">
							<div class="text-price">
								<span>￥<s:property value="price" /></span>
							</div>
						</div>
						<div class="content-box-count f-fl">
							<span>数量：<s:property value="dishesSet.size()" /></span>
						</div>
					</li>
				</ul>
			</td>
	     </tr>
	     </s:iterator>
	     <tr></tr>
	     <tr></tr>
	   </table>
	   <input type="hidden" name="dishes.id" value="<s:property value="dishes.id" />" />
	   <br />
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
</html>