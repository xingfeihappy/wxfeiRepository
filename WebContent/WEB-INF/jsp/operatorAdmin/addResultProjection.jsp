<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加成果之前选择课题</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
<form class="addProfessor">
    	<a class="btn btn-default f-f1" onclick="history.go(-1)" target="right" style="z-index:9999;width:70px;position:relative">返 回</a>
    </form>
    <br/>
      <table class="table table-hover table-borderSelf3 datatable">
		<thead>
			<tr>
				<th width="14%">序号</th>
				<th width="8%">状态</th>
				<th width="23%">标题</th>
				<th width="7.8%">分类</th>
				<th width="10%">负责人</th>
				<th width="8%">成果</th>
				<th width="11%">截止日期</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<tbody>
		  <s:iterator value="projectionListAdmin" status="index">
			<tr>
				<td><s:property value="codes" /></td>
				<td><s:property value="state" /></td>
				<td><a href="AdminProjectionView?projection.id=<s:property value="id" />" title="查看"><s:property value="title" /></a></td>
				<td><s:property value="type" /></td>
				<td><a href="ViewUser?user.id=<s:property value="user.id" />"><s:property value="user.username" /></td>
				<td><a href="ViewProjectionResult?projection.id=<s:property value="id" />" target="right">查看</a></td>
				<td><s:property value="deadline" /></td>
				<td>
					<a class="btn" href="AdminProjectionView?projection.id=<s:property value="id" />" target="right" title="查看">查看</a>
					<a class="btn" href="AddResultProjection?projection.id=<s:property value="id" />&projection.projectionType=<s:property value="projectionType" />" target="right" title="新增成果">新增成果</a>
					<input type="hidden" value="<s:property value="id" />" />
			    </td>
			</tr>
		   </s:iterator>
	</table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script>
//传递参数表示是管理员录入课题
 function opAddProjection(from){
	 window.location.href="AddUSer?from="+from;
 }

 function fun(e){
		Showbo.Msg.confirm('确定删除该条记录？',function(flag){
				if(flag=='yes'){
					var id = $(e).next().attr("value");
			 		location.href ="DeleteProjectionById?projection.id="+id+"&from=1";
				}
					
			}); 
	};
</script>
</html>