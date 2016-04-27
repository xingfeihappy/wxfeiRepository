<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>搜索</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">
</head>
<body>
	<div class="clearfix" style="float:left;">
	  <a class="btn btn-primary back" href="ReviewerFace" target="right" style="width:80px;">返回首页</a> 		  
	</div>
	<br>
	<br>
  <div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="tab1">
      <table class="table table-hover table-borderSelf3 datatable" >
		<thead>
			<tr style="height:40px;line-height: 40px; ">
				<th width="8%">序号</th>
				<th width="10%">状态</th>
				<th width="13%">课题编号</th>
				<th width="22%">课题名称</th>
				<th width="11%">学科分类</th>
				<th width="13%">课题申请时间</th>
				<th width="13%">评审截止时间</th>
				<th width="8%" style="border-right: 1px solid #ddd;">操作</th>
			</tr>
		</thead>
		<tbody>			
			<s:iterator value="ApplyingProjectionList" status="index">
			<tr>
				<td><s:property value="#index.index+1" /></td>
				<td>
				   <s:if test="statuMap.get(id)==1">
						<span class="nopassReview">未评审</span>
					</s:if>
					 <s:if test="statuMap.get(id)==2">
						<span class="toReview">暂存</span>
					</s:if>
					<s:elseif test="statuMap.get(id)==0">  
						<span>已评审</span>
					</s:elseif> 
				</td>
				<td><s:property value="codes"></s:property></td>
				<td><s:property value="title"></s:property></td>
				<td><s:property value="type.split(',')[0]" /></td>
				<td><s:date name="applyDate" format="yyyy-MM-dd"></s:date></td>
				<td><s:property value="reviewdeadline" /></td>
				<td style="border-right: 1px solid #ddd;">
					 
					<s:if test="statuMap.get(id)==0">  
						<a href="GetReviewByProjectionId?projection.id=<s:property value="id" />" title=""><button class="btn btn-primary">查看</button></a>
					</s:if> 
					<s:else>
						<a href="GetReviewProjectionById?projection.id=<s:property value="id" />" title=""><button class="btn btn-primary">评审</button></a>
					</s:else>
			    </td>
			</tr>
		  </s:iterator>
		  <s:iterator value="EndingProjectionList" status="index">
			<tr>
				<td><s:property value="#index.index+1" /></td>
				<td>
				<s:if test="statuMap.get(id)==1">
						<span class="nopassReview">未评审</span>
					</s:if>
					 <s:if test="statuMap.get(id)==2">
						<span class="toReview">暂存</span>
					</s:if>
					<s:elseif test="statuMap.get(id)==0">  
						<span>已评审</span>
					</s:elseif> 
				</td>
				<td><s:property value="codes"></s:property></td>
				<td><s:property value="title"></s:property></td>
				<td><s:property value="type.split(',')[0]" /></td>
				<td><s:date name="applyDate" format="yyyy-MM-dd"></s:date></td>
				<td><s:property value="reviewdeadline" /></td>
				<td style="border-right: 1px solid #ddd;">
				    <s:if test="statuMap.get(id)==0">  
						<a href="GetEndReviewByProjectionId?projection.id=<s:property value="id" />" title=""><button class="btn btn-primary">查看</button></a>
					</s:if>
					 <s:else>
						<a href="GetEndReviewProjectionById?projection.id=<s:property value="id" />" title=""><button class="btn btn-primary">评审</button></a>
					</s:else>
					 					
			    </td>
			</tr>
		  </s:iterator>
		</tbody>
	</table>
  </div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/table.js"></script>
<script>
  $(".countTip").parent().click(function(){
	    $(".countTip").css("display","none"); 
   })  
</script>
</body>
</html>