<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
	<div class="adminShow" >
		<a class="btn btn-primary addUser" href="AddUserPage" target="right" style="width:80px;">新增用户</a>
		<form method="post" action="DataBackupSingle" enctype="multipart/form-data" style="display:inline-block">
	      <input type="submit" class="btn btn-primary addUser" style="width:80px;" value="备  份" />
	      <input type="hidden" name="check1" value="1" />
	    </form>
		<br /><br />
	</div>

    <table class="table table-hover table-borderSelf3">
	<thead>
		<tr>
			<th width="7.5%">序号</th>
			<th width="7.5%">姓名</th>
			<th width="">出生日期</th>
			<th width="">联系方式</th>
			<th width="">邮箱</th>
			<th width="">联系地址</th>
			<th width="18%">管理操作</th>
		</tr>
	</thead>
	<tbody>
	 <s:iterator value="userList" status="index">
		<tr>
			<td><s:property value="#index.index+1" /></td>
			<td><s:property value="username"/></td>
			<td><s:date name="birthday" format="yyyy-MM-dd"/></td>
			<td><s:property value="telephone"/></td>
			<td><s:property value="email"/></td>
			<td><s:property value="address"/></td>
			<td>
			    <a class="btn btn-warning" href="EditUserPage?user.id=<s:property value="id" />" target="right" title="修改用户信息">修改</a> 
				<a class="btn btn-success" href="ViewUserPage?user.id=<s:property value="id" />" target="right" title="查看用户详细信息">查看</a>
				<a class="btn btn-danger" href="javascript:void(0);"  onclick="deleteOpe(this)" title="删除此用户">删除</a> 
				<input type="hidden" value="<s:property value="user.id" />">
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
	Showbo.Msg.confirm('是否删除该条用户记录？',function(flag){
		if(flag=='yes'){
			var id = $(e).next().attr("value");
			location.href ="DeleteUser?user.id="+id;		
		}				
	}); 
};
</script>
</html>