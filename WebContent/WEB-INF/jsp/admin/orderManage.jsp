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
			<th width="7.5%">内容</th>
			<th width="">评价星级</th>
			<th width="">评价用户</th>
			<th width="">评价菜品</th>
			<th width="18%">管理操作</th>
		</tr>
	</thead>
	<tbody>
	 <s:iterator value="userList" status="index">
		<tr>
			<td><s:property value="#index.index+1" /></td>
			<td><s:property value="content"/></td>
			<td><s:property value="grade"/></td>
			<td><s:property value="telephone"/></td>
			<td><s:property value="email"/></td>
			<td>
			    <a class="btn" href="EditUser?user.id=<s:property value="id" />" target="right" title="修改用户信息">修改</a> 
				<a class="btn" href="ViewUser?user.id=<s:property value="id" />" target="right" title="查看用户详细信息">查看</a>
				<a class="btn" href="javascript:void(0);"  onclick="deleteOpe(this)" title="删除此用户">删除</a> 
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