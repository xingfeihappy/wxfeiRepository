<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课题查询</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body>
  <form method="post" action="PojectionSearchForm">
      <div class="projectionSearch" >
        <input class="form-control f-ib" placeholder="项目名称" name="searchCondition['title']"/>
        <input class="form-control f-ib" placeholder="主题词" name="searchCondition['tag']"/>
        <input class="form-control f-ib" placeholder="学科分类" name="searchCondition['type']"/>
        <input type="submit" class="btn btn-primary f-ib" value="搜索" />
      </div><br />
   </form>
      <table class="table table-hover table-borderSelf3">
		<thead>
			<tr>
				<th width="5%">ID</th>
				<th width="10%">编号</th>
				<th width="7.8%">状态</th>
				<th width="28%">标题</th>
				<th width="7.8%">分类</th>
				<th width="9.6%">负责人</th>
				<th width="6.7%">成果</th>
				<th width="15%">截止日期</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<tbody>
		  <s:iterator value="projectionList" status="index">
			<tr>
				<td><s:property value="#index.count" /></td>
				<td><s:property value="codes" /></td>
				<td><s:property value="state" /></td>
				<td><a href="AdminProjectionView?projection.id=<s:property value="id" />" title="查看"><s:property value="title" /></a></td>
				<td><s:property value="type.split(',')[0]" /></td>
				<td><a href="ViewUser?user.id=<s:property value="user.id" />"><s:property value="user.username" /></td>
				<td><a href="ViewResult?projection.id=<s:property value="id" />" target="right">查看</a></td>
				<td><s:property value="deadline" /></td>
				<td><a class="btn" href="AdminProjectionView?projection.id=<s:property value="id" />" target="right" title="查看"><i
					   class="icon-exclamation"></i></a>
			    </td>
			</tr>
		   </s:iterator>
	</table>
</body>
</html>