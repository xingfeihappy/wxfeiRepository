<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成果库管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
	<a class="btn btn-primary addUser" href="AddResultProject" target="right">新增新成果</a>
 	<s:if test="#session.username==@com.projection.util.Constant@ADMINNAME && #session.userType==@com.projection.util.Constant@ADMIN">
	<form method="post" action="DataBackupSingle" enctype="multipart/form-data" style="display:inline-block">
      <input type="submit" class="btn btn-primary addUser" style="width:80px;" value="备  份" />
      <input type="hidden" name="check4" value="4" />
      </form>
  	</s:if>
  	<br /><br />
      <table class="table table-hover table-borderSelf3 datatable">
		<thead>
			<tr>
				<th width="9%">序号</th>
				<th width="11%">课题名称</th>
				<th width="11%">成果名称</th>
				<th width="11%">成果形式</th>
				<th width="11%">预计字数</th>
				<!-- <th width="9%">类别</th> -->
				<th width="11%">完成时间</th>
				<th width="9%">负责人</th>
				<th width="9%">类型</th>
				<th width="13%">管理操作</th>
			</tr>
		</thead>
		<tbody>
		 <s:iterator value="achievementList" status="index">
			<tr>
				<td><s:property value="#index.count" /></td>
				<td><a href="AdminProjectionView?projection.id=<s:property value="projection.id" />" target="right" title="查看课题基本信息"><s:property value="projection.title" /></a></td>
				<td><s:property value="title" /></td>
				<td><s:property value="achievementForm" /></td>
				<td><s:property value="achievementWords" /></td>
				<%-- <td><s:property value="achievementType" /></td> --%>
				<td><s:date name="finishTime" format="yyyy-MM-dd"/></td>
				<td><s:property value="participation.username" /></td>
				<td><s:property value="type" /></td>
				<td><a class="btn" href="ViewResult?achievement.id=<s:property value="id"/>" target="right" title="查看"><i
					   class="icon-exclamation"></i></a>
					 <s:if test="#session.username==@com.projection.util.Constant@ADMINNAME && #session.userType==@com.projection.util.Constant@ADMIN">
				 	  <a class="btn" href="EditResult?achievement.id=<s:property value="id" />" target="right" title="修改"><i
					   class="icon-inbox"></i></a> 
					  <a class="btn" href="javascript:void(0);" onclick="deleteOpe(this)" title="删除"><i
					   class="icon-trash"></i></a>
					   <input type="hidden" value="<s:property value="id" />">
				  	 </s:if>
			    </td>
				 
			</tr>
		   </s:iterator>
		</tbody>
	</table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script>
/* function deleteOpe(e){
	if(confirm('确定删除该条记录?')==true){
		var id = $(e).next().attr("value");
		$(e).attr("href","DeleteAchievementById?achievement.id="+id);
	}else{
		
	}
} */
function deleteOpe(e){
	Showbo.Msg.confirm('确定删除该条记录？',function(flag){
			if(flag=='yes'){
				var id = $(e).next().attr("value");
				location.href ="DeleteAchievementById?achievement.id="+id;
			}		
		}); 
};
</script>
</html>