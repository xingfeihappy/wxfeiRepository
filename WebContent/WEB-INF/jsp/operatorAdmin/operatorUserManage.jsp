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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
      <%-- <input type="hidden" class="uu" value="<%=session.getAttribute(Constant.USER_NAME) %>"> --%>
	
		<div class="adminShow" >
			<a class="btn btn-primary addUser" href="AddUSer" target="right" style="width:80px;">新增用户</a>
			<s:if test="#session.username==@com.projection.util.Constant@ADMINNAME && #session.userType==@com.projection.util.Constant@ADMIN">
			<!-- <a class="btn btn-primary addUser" href="" target="right">从外部导入</a> -->
			<form method="post" action="DataBackupSingle" enctype="multipart/form-data" style="display:inline-block">
		      <input type="submit" class="btn btn-primary addUser" style="width:80px;" value="备  份" />
		      <input type="hidden" name="check1" value="1" />
		    </form>
			</s:if>
			<br /><br />
		</div>

      <table class="table table-hover table-borderSelf3 datatable">
		<thead>
			<tr>
				<th width="7.5%">序号</th>
				<th width="7.5%">姓名</th>
				<th width="12%">出生年月</th>
				<th width="11%">行政职务</th>
				<th width="11%">研究专长</th>
				<th width="12%">类型</th>
				<th width="7.3%">学历</th>
				<th width="13%">工作单位</th>
				<th width="18%">管理操作</th>
			</tr>
		</thead>
		<tbody>
		 <s:iterator value="userList" status="index">
		  <s:if test="userType.length() > 0">
			<tr>
				<td><s:property value="#index.index+1" /></td>
				<td><s:property value="username"/></td>
				<td><s:date name="birthday" format="yyyy-MM-dd"/></td>
				<td><s:property value="duty"/></td>
				<td><s:property value="specialSkill"/></td>
				<td><s:property value="userType"/></td>
				<td><s:property value="education"/></td>
				<td><s:property value="unit"/></td>
				<td>
				    <a class="btn" href="EditUser?user.id=<s:property value="id" />" target="right" title="修改用户信息"><i
					   class="icon-inbox"></i></a> 
					<a class="btn" href="ViewUser?user.id=<s:property value="id" />" target="right" title="查看用户详细信息"><i
					   class="icon-exclamation"></i></a>
					<s:if test="userType.contains('项目负责人')">
					<a class="btn" href="HelpPage?user.id=<s:property value="id" />" target="right" title="录入新课题"><i
					   class="icon-plus" ></i></a>
					 </s:if>  
					<s:if test="#session.username==@com.projection.util.Constant@ADMINNAME && #session.userType==@com.projection.util.Constant@ADMIN">
					<a class="btn" href="javascript:void(0);"  onclick="deleteOpe(this)" title="删除此用户"><i
					   class="icon-trash"></i></a> 
				    <a class="btn" href="javascript:void(0);" onclick="fun(this)" title="重置密码"><i
					   class="icon-default"></i></a>
					<input type="hidden" value="<s:property value="id" />">
					<input type="hidden" value="<s:property value="userType" />">
			   		</s:if>
			    </td>
			</tr>
		   </s:if>
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
/* function fun(x){
	Showbo.Msg.confirm('确定删除专家？',function(flag){
			if(flag=='yes')
				location.href =x;
		}); 
}; */


function deleteOpe(e){
	var type = $(e).next().next().next().attr("value");
	if(type=="管理员"){
		Showbo.Msg.alert("不能删除管理员噢！");
	}else{
		Showbo.Msg.confirm('是否删除该条用户记录？',function(flag){
			if(flag=='yes'){
				Showbo.Msg.confirm('是否删除该用户负责的课题？',function(flag){
					if(flag=='yes'){
						Showbo.Msg.confirm('是否删除该课题的成果信息？',function(flag){
							if(flag=='yes'){
								var id = $(e).next().next().attr("value");
								location.href ="DeleteUser?user.id="+id;
							}
						});
					}
				});			
			}				
		}); 
	}
};

function fun(e){
	Showbo.Msg.confirm('确定重置密码吗？',function(flag){
			if(flag=='yes'){
				var id = $(e).next().attr("value");
				location.href ="ResetPassword?user.id="+id;
			}
				
		}); 
};
</script>
</html>