<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>未结题列表</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body>
      <!-- <a class="btn btn-primary back" href="UserFace" target="right" style="width:80px;">返回首页</a><br /><br /> -->
      <table class="table table-hover table-borderSelf3">
		<thead>
			<tr>
				<th width="6%">序号</th>
				<th width="10%">编号</th>
				<th width="8%">状态</th>
				<th width="20%">标题</th>
				<th width="8%">学科分类</th>
				<th width="9.6%">负责人</th>
				<th width="8%">经费</th>
				<th width="14.3%">预计完成时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		  <s:iterator value="projectionListWJT" status="index">
			<tr>
				<td><s:property value="#index.index+1" /></td>
				<td><s:property value="codes" /></td>
				<td>
				  <s:if test="state.equals('申报待修改')">
				      <span class="toReview"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('草稿')">
				      <span class="nopassReview"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('申报评审中')">
				      <span class="passReview"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('申报待评审')">
				      <span class="toReview"><s:property value="state" /></span>
				   </s:if>
				   <s:if test='state.equals("结题待评审")'>
				      <span class="nopassReview"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('结题评审中')">
				      <span class="passReview"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('已立项')">
				      <span class="toReview"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('已结题')">
				      <span class="nopassReview"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('结题待修改')">
				      <span class="passReview"><s:property value="state" /></span>
				   </s:if>
				</td>
				<td><a href="GetProjectionById?projection.id=<s:property value="id" />" title="查看项目申报信息"><s:property value="title" /></a></td>
				<td><s:property value="type.split(',')[0]" /></td>
				<td><s:property value="user.username" /></td>
				<td>
				  <s:if test="money > 0">
				      <s:property value="money" />万元
				  </s:if>
				  <s:else>
				      0 万元
				  </s:else>
				</td>
				<td><s:date name="deadline" format="yyyy-MM-dd" /></td>
				<td>
				  <a class="btn btn-primary back" href="GetProjectionById?projection.id=<s:property value="id" />&pageType=2" target="right" title="申请结题">申请结题</a>
			    </td>
			</tr>
		   </s:iterator>
	</table>
</body>
</html>