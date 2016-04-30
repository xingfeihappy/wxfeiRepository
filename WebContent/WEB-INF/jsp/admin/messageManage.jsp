<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
	<div class="adminShow" >
		<form method="post" action="DataBackupSingle" enctype="multipart/form-data" style="display:inline-block">
	      <input type="submit" class="btn btn-success" style="width:80px;" value="备  份" />
	      <input type="hidden" name="check1" value="1" />
	    </form>
		<br /><br />
	</div>

    <table class="table table-hover table-borderSelf3">
	<thead>
		<tr>
			<th width="7.5%">序号</th>
			<th width="7.5%">内容</th>
			<th width="">评价星级</th>
			<th width="">评价用户</th>
			<th width="">评价菜品</th>
			<th width="18%">管理操作</th>
		</tr>
	</thead>
	<tbody>
	 <s:iterator value="messageList" status="index">
		<tr>
			<td><s:property value="#index.index+1" /></td>
			<td><s:property value="content"/></td>
			<td><s:property value="grade"/></td>
			<td><s:property value="user.username"/></td>
			<td><s:property value="dishes.name"/></td>
			<td>
				<a class="btn btn-danger" href="javascript:void(0);"  onclick="deleteOpe(this)" title="删除此信息">删除</a> 
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
	Showbo.Msg.confirm('是否删除该条留言记录？',function(flag){
		if(flag=='yes'){
			var id = $(e).next().attr("value");
			location.href ="DeleteMessage?message.id="+id;		
		}				
	}); 
};
</script>
</html>