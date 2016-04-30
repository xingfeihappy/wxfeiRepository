<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日志管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">
</head>
<body>
      <form method="post" action="DataBackupSingle" enctype="multipart/form-data" style="display:inline-block">
        <input type="submit" class="btn btn-success" style="width:80px;" value="备  份" />
        <input type="hidden" name="check5" value="5" />
      </form><br /><br />
      <table class="table table-hover table-borderSelf3">
		<thead>
			<tr>
				<th width="8%">序号</th>
				<th width="8%">用户名</th>
				<th width="12%">操作日期</th>
				<th width="28%">操作内容</th>
				<th width="15%">日志类型</th>
				<th width="12%">操作类型</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<tbody>
		 <s:iterator value="logList" status="index">
			<tr style="height:30px">
				<td><s:property value="#index.index+1" /></td>
				<td><s:property value="user.username"/></td>
				<td><s:date name="date" format="yyyy-MM-dd"></s:date></td>
				<td>
					<s:if test="content.length()>30">  
		    			<s:property value="content.substring(0,30)+'...'" />    
			    	</s:if>
			    	<s:else>
						<s:property value="content" />
					</s:else>
			    </td>
				<td><s:property value="type"/></td>
				<td><s:property value="operationType"/></td>
				<td>
					<a class="btn btn-danger" href="DeleteLog?log.id=<s:property value="id" />" title="删除">删除</a> 
		        </td>
			</tr>
		  </s:iterator>
	</table>
</body>
</html>