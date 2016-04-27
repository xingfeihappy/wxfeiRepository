<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课题管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
	<s:if test="#session.username==@com.projection.util.Constant@ADMINNAME && #session.userType==@com.projection.util.Constant@ADMIN">
      <a class="btn btn-primary addUser" onclick="opAddProjection(1)" target="right" >录入新课题</a>
      <form method="post" action="DataBackupSingle" enctype="multipart/form-data" style="display:inline-block">
      <input type="submit" class="btn btn-primary addUser" style="width:80px;" value="备  份" />
      <input type="hidden" name="check2" value="2" />
      </form>
      <br /><br />
    </s:if>
    <s:else>
      <a class="btn btn-primary addUser" onclick="opAddProjection(1)" target="right" >录入新课题</a>
	  <br /><br />
    </s:else>
      <table class="table table-hover table-borderSelf3 datatable">
		<thead>
			<tr>
				<th width="8%">序号</th>
				<th width="10%">状态</th>
				<th width="23%">标题</th>
				<th width="11.7%">课题类型</th>
				<th width="7.8%">分类</th>
				<th width="9%">负责人</th>
				<th width="15%">预计完成时间</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<tbody>
		  <s:iterator value="projectionListAdmin" status="index">
			<tr>
				<td><s:property value="#index.count" /></td>
				<td><s:property value="state" /></td>
				<td><a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=3" title="查看"><s:property value="title" /></a></td>
				<td><s:if test="projectionType.equals('11')">一般课题</s:if>
				<s:if test="projectionType.equals('12')">资助课题</s:if>
				<s:if test="projectionType.equals('13')">招标课题</s:if></td>
				<td><s:property value="type.split(',')[0]" /></td>
				<td><a href="ViewUser?user.id=<s:property value="user.id" />"><s:property value="user.username" /></td>
				<td><s:date name="deadline" format="yyyy-MM-dd"/></td>
				<td>
					<a class="btn" href="AdminProjectionView?projection.id=<s:property value="id" />&tag=3" target="right" title="查看"><i
					   class="icon-exclamation"></i></a>
					<s:if test="#session.userType==@com.projection.util.Constant@ADMIN && state.equals('草稿')">
					   <a class="btn" href="AdminProjectionEdit?projection.id=<s:property value="id" />" title="修改"><i
					   class="icon-inbox"></i></a> 
					</s:if>
					<s:if test="#session.username==@com.projection.util.Constant@ADMINNAME && #session.userType==@com.projection.util.Constant@ADMIN">  
						<a class="btn" href="javascript:void(0);" onclick="fun(this)" title="删除"><i
						   class="icon-trash"></i></a>
						<input type="hidden" value="<s:property value="id" />" />
				    </s:if>
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
	 window.location.href="operatorUserManage?from="+from;
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