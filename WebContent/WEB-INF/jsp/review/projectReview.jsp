<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>课题评审</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<style>
	a:hover{color:#636262;text-decoration:underline}
</style>
</head>
<body>
	<div class="clearfix" style="float:left;">
	   <!-- <a class="btn btn-primary back" href="reviewerFace.html" target="right">返回首页</a> -->			  
	   <span style="font-size:13px"><a href="PersonInformation" style="color:#f0ad4e;">请先完善个人信息再进行评审</a></span>
	</div>
	<br>
	<br>

  <ul id="myTab" class="nav nav-tabs">
      <li class="active"><a href="#tab1" data-toggle="tab">全部</a></li>
	  <li class=""><a href="#tab2" data-toggle="tab">未评审
	 			 <s:if test="counter!=0">
				  		<span class="countTip">&nbsp;<s:property value="counter" /></span>
				 </s:if>	
				  </a></li>
	  <li class=""><a href="#tab3" data-toggle="tab">已评审</a></li>
  </ul>
  <div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="tab1">
      <table class="table table-hover table-borderSelf2" >
		<thead>
			<tr style="height:40px;line-height: 40px; ">
				<th width="4%">序号</th>
				<th width="10%">状态</th>
				<th width="15%">课题编号</th>
				<th width="25%">课题名称</th>
				<th width="9%">学科分类</th>
				<th width="12%">课题申请时间</th>
				<!-- <th width="12%">截止时间</th> -->
				<th width="10%">下载文稿</th>
				<th width="10%">下载论证活页</th>
				<th style="border-right: 1px solid #ddd;">操作</th>
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
				<%-- <td><s:property value="reviewdeadline" /></td>--%>
				<td>
				  <s:if test="projectionType=11">
				   <s:iterator value="filesList" status="index">
				    <s:if test="fileType ==7">
				    <a class="btn" href="downloadByFiles?files.id=<s:property value="id"/>" target="" title="下载文稿"><i class="download"></i></a>
				   </s:if>
				  </s:iterator>
				  </s:if>
				  <s:else>
				  —
				  </s:else>
				</td>
				<td>
				  <%-- <s:if test="isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1"> --%>
				  <s:if test="isHaveDemonstrationFiles ==1">
				    <a class="btn" href="download?projection.id=${id}&type=5" target="" title="论证活页"><i class="download"></i></a>
				  </s:if>
				  <s:else>
				  —
				  </s:else>
				</td>
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
		</tbody>		
      </table>
    </div>
    <div class="tab-pane" id="tab2">
       <table class="table table-hover table-borderSelf2">
		<thead>
			<tr style="height:40px;line-height: 40px; ">
				<th width="4%">序号</th>
				<th width="10%">状态</th>
				<th width="15%">课题编号</th>
				<th width="25%">课题名称</th>
				<th width="9%">学科分类</th>
				<th width="12%">课题申请时间</th>
				<!-- <th width="12%">截止时间</th> -->
				<th width="10%">下载文稿</th>
				<th width="10%">下载论证活页</th>
				<th style="border-right: 1px solid #ddd;">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="NotReviewApplyingProjectionList" status="index">
			<tr>
				<td><s:property value="#index.index+1" /></td>
				<td>
				  <s:if test="statuMap.get(id)==1">
						<span class="nopassReview">未评审</span>
					</s:if>
					 <s:if test="statuMap.get(id)==2">
						<span class="toReview">暂存</span>
					</s:if>
				</td>
				<td><s:property value="codes"></s:property></td>
				<td><s:property value="title"></s:property></td>
				<td><s:property value="type.split(',')[0]" /></td>
				<td><s:date name="applyDate" format="yyyy-MM-dd"></s:date></td>
				<%-- <td><s:property value="reviewdeadline" /></td> --%>
				<td>
				  <s:if test="projectionType=11">
				   <s:iterator value="filesList" status="index">
				    <s:if test="fileType ==7">
				    <a class="btn" href="downloadByFiles?files.id=<s:property value="id"/>" target="" title="下载文稿"><i class="download"></i></a>
				   </s:if>
				  </s:iterator>
				  </s:if>
				  <s:else>
				  —
				  </s:else>
				</td>
				<td>
				  <%-- <s:if test="isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1"> --%>
				  <s:if test="isHaveDemonstrationFiles ==1">
				    <a class="btn" href="download?projection.id=${id}&type=5" target="" title="论证活页"><i class="download"></i></a>
				  </s:if>
				  <s:else>
				  —
				  </s:else>
				</td>
				<td style="border-right: 1px solid #ddd;">
						<a href="GetReviewProjectionById?projection.id=<s:property value="id" />" title="">
						<button class="btn btn-primary">评审</button>
						</a>
			    </td>
			</tr>
		  </s:iterator>
		  </tbody>
		</table>
    </div>
    <div class="tab-pane" id="tab3">
       <table class="table table-hover table-borderSelf2">
		<thead>
			<tr style="height:40px;line-height: 40px; ">
				<th width="4%">序号</th>
				<th width="10%">状态</th>
				<th width="15%">课题编号</th>
				<th width="25%">课题名称</th>
				<th width="9%">学科分类</th>
				<th width="12%">课题申请时间</th>
				<!-- <th width="12%">截止时间</th> -->
				<th width="10%">下载文稿</th>
				<th width="10%">下载论证活页</th>
				<th style="border-right: 1px solid #ddd;">操作</th>
			</tr>
		</thead>
		<tbody>
	   <s:iterator value="ReviewedApplyingProjectionList" status="index">
			<tr>
				<td><s:property value="#index.index+1" /></td>
				<td><span>已评审</span></td>
				<td><s:property value="codes"></s:property></td>
				<td><s:property value="title"></s:property></td>
				<td><s:property value="type.split(',')[0]"/></td>
				<td><s:date name="applyDate" format="yyyy-MM-dd"></s:date></td>
				<%-- <td><s:property value="reviewdeadline" /></td> --%>
				<td>
				  <s:if test="projectionType=11">
				   <s:iterator value="filesList" status="index">
				    <s:if test="fileType ==7">
				    <a class="btn" href="downloadByFiles?files.id=<s:property value="id"/>" target="" title="下载文稿"><i class="download"></i></a>
				   </s:if>
				  </s:iterator>
				  </s:if>
				  <s:else>
				  —
				  </s:else>
				</td>
				<td>
				  <%-- <s:if test="isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1"> --%>
				  <s:if test="isHaveDemonstrationFiles ==1">
				    <a class="btn" href="download?projection.id=${id}&type=5" target="" title="论证活页"><i class="download"></i></a>
				  </s:if>
				  <s:else>
				  —
				  </s:else>
				</td>
				<td style="border-right: 1px solid #ddd;">
				   <a href="GetReviewByProjectionId?projection.id=<s:property value="id" />" title=""><button class="btn btn-primary">查看</button></a>	
			    </td>
			</tr>
		  </s:iterator>
		</tbody>
	</table>
  </div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.js"></script>
<script>
  $(".countTip").parent().click(function(){
	    $(".countTip").css("display","none"); 
   })  
</script>
</body>
</html>