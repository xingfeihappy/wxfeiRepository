<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
	<div class="adminShow" >
		<form method="post" action="DataBackupSingle" style="display:inline-block">
	      <input type="submit" class="btn btn-primary btn-success" style="width:80px;" value="备  份" />
	      <input type="hidden" name="check4" value="4" />
	    </form>
		<br /><br />
	</div>

    <table class="table table-hover table-borderSelf3">
	<thead>
		<tr>
			<th width="7.5%">序号</th>
			<th width="7.5%">订单编码</th>
			<th width="">菜量</th>
			<th width="">总计消费</th>
			<th width="">下单时间</th>
			<th width="">状态</th>
			<th width="">下单人</th>
			<th width="">餐位</th>
			<th width="">管理操作</th>
		</tr>
	</thead>
	<tbody>
	 <s:iterator value="orderList" status="index">
		<tr>
			<td><s:property value="#index.index+1" /></td>
			<td><s:property value="codes"/></td>
			<td><s:property value="foodNum"/></td>
			<td><s:property value="totalMoney"/></td>
			<td><s:date name="dinnerTime" format="yyyy-MM-dd"/></td>
			<td>
				<s:if test="state==0">已下单</s:if>
				<s:if test="state==1">已完成</s:if>
				<s:if test="state==2">已评价</s:if>
			</td>
			<td><s:property value="user.username"/></td>
			<td><s:property value="seat.id"/></td>
			<td>
				<%-- <s:if test="state.equals('未处理')">
				    <a class="btn" href="EditOrder?order.id=<s:property value="id" />" target="right" title="修改信息">修改</a> 
				</s:if> --%>
				<s:if test="state==0">
					<a class="btn btn-success" href="FinishOrder?order.id=<s:property value="id" />" target="right" title="完成付款">完成付款</a>
				</s:if>
				<a class="btn btn-success" href="ViewOrder?order.id=<s:property value="id" />" target="right" title="查看详细信息">查看</a>
				<a class="btn btn-danger" href="javascript:void(0);"  onclick="deleteOpe(this)" title="删除">删除</a> 
				<input type="hidden" value="<s:property value="id" />">
		    </td>
		</tr>
	  </s:iterator>
	</table>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script>
function deleteOpe(e){
	Showbo.Msg.confirm('是否删除该条订单记录？',function(flag){
		if(flag=='yes'){
			var id = $(e).next().attr("value");
			location.href ="DeleteOrder?order.id="+id;		
		}				
	}); 
};
</script>
</html>