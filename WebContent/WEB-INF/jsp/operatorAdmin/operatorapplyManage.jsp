<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课题申报管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
<style>
.line{height:118px;}
</style>
</head>
<body>
  <ul id="myTab" class="nav nav-tabs"> 
  	  <li class="active "  value="tab1"><a href="#tab1" data-toggle="tab">一般类</a></li>
      <li class="" value="tab2"><a href="#tab2" data-toggle="tab" >资助类</a></li>
	  <li class="" value="tab3"><a href="#tab3" data-toggle="tab" >招标类</a></li>
  </ul>
  <div id="myTabContent" class="tab-content">
  	<div class="tab-pane fade in active" id="tab1">
      <br/>
      <div class="" style="position:relative;">
      	<div style=" margin-right:496px; magrin-top:5px;">
      		 <input class="form-control f-ib projectName"  placeholder="课题名称"/>
      	</div>
       
        <div style="position:absolute;top:0;right:0">
        	<input class="form-control f-ib projectNo" placeholder="课题编号" style="width:180px;"/>
	        <input class="form-control f-ib projectPerson" placeholder="负责人" style="width:120px;"/>
	        <select class="form-control f-ib projectType" style="width:120px; padding-top:5px;"/>
	           <option value='-1' selected style='color:grey'>状态</option>
	           <option value="0">申报待评审</option>
	           <option value="1">申报待修改</option>
	           <option value="2">申报评审中</option>
	           <option value="3">资格审查</option>
		     </select>
            <a class="btn btn-primary f-ib search" style="width:60px; margin-top:-3px;" value="tab1">搜 索</a></div>
      </div><br/>
      <div style="overflow-x: auto; overflow-y: scroll; width:100%;height:41px;">
       <table style="table-layout:fixed;" class="table table-hover table-bordered table-borderSelf1 topam" value="tab1">
          <tbody>
			<tr>
				<th  width="7%" style="text-align:center;">序号</th>
				<th  width="100px" style="text-align:center;">操作</th>
				<th  width="12.5%" style="text-align:center;">课题编号</th>
				<th  width="15%" style="text-align:center;">课题名称</th>
				<th  width="10%" style="text-align:center;">负责人</th>
				<th  width="10%" style="text-align:center;">学科分类</th>
				<th  width="10%" style="text-align:center;">申报时间</th>
				<th  width="12.5%" style="text-align:center;">状态</th>
			</tr>
			</tbody>
		</table>
		</div>
		<div style="overflow-x: auto; overflow-y: auto; height: 750px; width:100%;" class="dcontainer">
		<table class="table table-hover table-bordered table-borderSelf1 topam1">
		<thead>
			<s:iterator value="normalProjectionList" status="index">
			<tr class="line">
				<td width="7%"><s:property value="#index.index+1" /></td>
				<td width="100px">
			   		 <s:if  test="state.equals('申报待修改') ">
			   		    <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=0">查看课题</a><br>
					    <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载申请书</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载申请书</a><br />
						</s:else>
			   		 </s:if >
			   		 <s:elseif  test="state.equals('资格审查') ">
			   		    <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=0">查看课题</a><br>
					    <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载申请书</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载申请书</a><br />
						</s:else>
					  <a href="Qualification?projection.id=<s:property value="id" />&tag=0">资格审查</a><br>
			   		 </s:elseif >
			   		  <s:elseif  test="state.equals('申报评审中') ">
			   		     <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=0">查看课题</a><br>
			   		     <s:if test="#session.username!=@com.projection.util.Constant@HEADNAME && #session.userType==@com.projection.util.Constant@ADMIN">
						 <a href="OperatorExpertDispatch?projection.id=<s:property value="id" />&tag=0">专家分派</a><br>
					     </s:if>
						
				        <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载申请书</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载申请书</a><br />
						</s:else>
				        <a href="GetProjectionReviewById?projection.id=<s:property value="id"/>&type=apply&tag=0 ">查看评审意见</a><br>
				        
			   		 </s:elseif >
				     <s:elseif  test="state.equals('申报待评审') ">
				       <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=0">查看课题</a><br>
				       <s:if test="#session.username!=@com.projection.util.Constant@HEADNAME && #session.userType==@com.projection.util.Constant@ADMIN">
						<a href="OperatorExpertDispatch?projection.id=<s:property value="id" />&tag=0">专家分派</a><br>
					   </s:if>
						<s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载申请书</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载申请书</a><br />
						</s:else>
						<a href="javascript:fun('backToModify?projection.id=<s:property value="id"/>'), void(0);" >退回修改</a><br />
						
			         </s:elseif >
				</td>
				<td style="word-wrap:break-word "width="12.5%" ><s:property value="codes"></s:property></td>
				<td style="word-wrap:break-word " width="15%"><s:property value="title"></s:property></td>
				<td style="word-wrap:break-word " width="10%"><s:property value="user.username"></s:property></td>
				<td style="word-wrap:break-word "  width="10%"><s:property value="type.split(',')[0]"></s:property></td>
				<td style="word-wrap:break-word " width="10%"><s:date name="applyDate" format="yyyy-MM-dd" /></td>
			    <s:if  test="state.equals('申报待修改') ">
						<td width="12.5%"><span><s:property value="state" /></span> &nbsp;<i class="glyphicon glyphicon-menu-down"></i>
						<div class="open">
							<span>共分配专家  0</span><br>
					   		<span>已完成  0</span><br>
							<span>同意立项  0</span><br>
							<span>拒绝立项  0</span><br> 
					    </div>
						</td>
			    </s:if >
			    <s:elseif  test="state.equals('资格审查') ">
						<td width="12.5%"><span class="nopassReview"><s:property value="state" /></span>
						&nbsp;
						</td>
			    </s:elseif >
			    <s:elseif  test="state.equals('申报评审中') ">
						<td width="12.5%"><span class="toReview"><s:property value="state" /></span> &nbsp;<i class="glyphicon glyphicon-menu-down"></i>
						<div class="open">
							<span>共分配专家 <s:property value="scoreMap.get(id).get(0)" /></span><br>
					   		<span>已完成 <s:property value="scoreMap.get(id).get(1)" /></span><br>
							<span>同意立项 <s:property value="scoreMap.get(id).get(2)" /></span><br>
							<span>拒绝立项 <s:property value="scoreMap.get(id).get(3)" /></span><br> 
					    </div>
					    </td>
			    </s:elseif >
				 <s:elseif  test="state.equals('申报待评审') ">
						<td width="12.5%"><span class="nopassReview"><s:property value="state" /></span>
						&nbsp;<i class="glyphicon glyphicon-menu-down"></i>
						<div class="open">
							<span>共分配专家  0</span><br>
					   		<span>已完成  0</span><br>
							<span>同意立项  0</span><br>
							<span>拒绝立项  0</span><br> 
					    </div>
						</td>
			    </s:elseif >
			</tr>
		    </s:iterator>
		</thead>
      </table>
      </div>
    </div>
    <div class="tab-pane " id="tab2">
          <br/>
      <div class="" style="position:relative;">
      	<div style=" margin-right:496px; magrin-top:5px;">
      		 <input class="form-control f-ib projectName"  placeholder="课题名称"/>
      	</div>
       
        <div style="position:absolute;top:0;right:0">
        	<input class="form-control f-ib projectNo" placeholder="课题编号" style="width:180px;"/>
	        <input class="form-control f-ib projectPerson" placeholder="负责人" style="width:120px;"/>
	        <select class="form-control f-ib projectType" style="width:120px; padding-top:5px;"/>
	           <option value='-1' selected style='color:grey'>状态</option>
	           <option value="0">申报待评审</option>
	           <option value="1">申报待修改</option>
	           <option value="2">申报评审中</option>
	           <option value="3">资格审查</option>
		     </select>
            <a class="btn btn-primary f-ib search" style="width:60px; margin-top:-3px;" value="tab2">搜 索</a></div>
      </div><br/>
       <div style="overflow-x: auto; overflow-y: scroll; width:100%;">
       <table style="table-layout:fixed;" class="table table-hover table-bordered table-borderSelf1 topam" value="tab2">
		<tbody>
			<tr>
				<th  width="7%" style="text-align:center">序号</th>
				<th  width="100px" style="text-align:center">操作</th>
				<th  width="12.5%" style="text-align:center">课题编号</th>
				<th  width="15%" style="text-align:center">课题名称</th>
				<th  width="10%" style="text-align:center">负责人</th>
				<th  width="10%" style="text-align:center">学科分类</th>
				<th  width="10%" style="text-align:center">申报时间</th>
				<th  width="12.5%" style="text-align:center">状态</th>
			</tr>
		</tbody>
		</table>
		</div>
		<div style="overflow-x: auto; overflow-y: auto; height: 750px; width:100%;" class="dcontainer">
		<table class="table table-hover table-bordered table-borderSelf1 topam1 hehe">
		<thead>
		<s:iterator value="aidProjectionList" status="index">
			<tr class="line">
				<td width="7%"><s:property value="#index.index+1" /></td>
				<td width="100px">
			   		 <s:if  test="state.equals('申报待修改') ">
			   		    <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=1">查看课题</a><br>
					    <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载申请书</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载申请书</a><br />
						</s:else>
					    <a href="GetProjectionReviewById?projection.id=<s:property value="id"/>&type=apply&tag=1 ">查看评审意见</a><br>
			   		 </s:if >
			   		  <s:elseif  test="state.equals('资格审查') ">
			   		    <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=1">查看课题</a><br>
					    <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载申请书</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载申请书</a><br />
						</s:else>
					  <a href="Qualification?projection.id=<s:property value="id" />&tag=1">资格审查</a><br>
			   		 </s:elseif >
			   		 
			   		  <s:elseif  test="state.equals('申报评审中') ">
			   		    <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=1">查看课题</a><br>
			   		    <s:if test="#session.username!=@com.projection.util.Constant@HEADNAME && #session.userType==@com.projection.util.Constant@ADMIN">
					    <a href="OperatorExpertDispatch?projection.id=<s:property value="id" />&tag=1">专家分派</a><br>
					    </s:if>
				        <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载申请书</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载申请书</a><br />
						</s:else>
				        <a href="GetProjectionReviewById?projection.id=<s:property value="id"/>&type=apply&tag=1 ">查看评审意见</a><br>
				       
			   		 </s:elseif >
				     <s:elseif  test="state.equals('申报待评审') ">
				       <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=1">查看课题</a><br>
				       <s:if test="#session.username!=@com.projection.util.Constant@HEADNAME && #session.userType==@com.projection.util.Constant@ADMIN">
						<a href="OperatorExpertDispatch?projection.id=<s:property value="id" />&tag=1">专家分派</a><br>
					   </s:if>
						<s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载申请书</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载申请书</a><br />
						</s:else>
						<%-- <a href="javascript:fun('backToModify?projection.id=<s:property value="id"/>'), void(0);" >退回修改</a><br /> --%>
						
			         </s:elseif >
				</td>
				<td style="word-wrap:break-word " width="12.5%"><s:property value="codes"></s:property></td>
				<td style="word-wrap:break-word " width="15%"><s:property value="title"></s:property></td>
				<td style="word-wrap:break-word " width="10%"><s:property value="user.username"></s:property></td>
				<td style="word-wrap:break-word " width="10%"><s:property value="type.split(',')[0]"></s:property></td>
				<td style="word-wrap:break-word " width="10%"><s:date name="applyDate" format="yyyy-MM-dd" /></td>
			    <s:if  test="state.equals('申报待修改') ">
						<td width="12.5%"><span><s:property value="state" /></span> &nbsp;<i class="glyphicon glyphicon-menu-down"></i>
						<div class="open">
							<span>共分配专家 <s:property value="scoreMap.get(id).get(0)" /></span><br>
					   		<span>已完成 <s:property value="scoreMap.get(id).get(1)" /></span><br>
							<span>同意立项 <s:property value="scoreMap.get(id).get(2)" /></span><br>
							<span>拒绝立项 <s:property value="scoreMap.get(id).get(3)" /></span><br> 
					    </div>
						</td>
			    </s:if >
			     <s:elseif  test="state.equals('资格审查') ">
						<td width="12.5%"><span class="nopassReview"><s:property value="state" /></span>
						&nbsp;
						</td>
			    </s:elseif >
			    <s:elseif  test="state.equals('申报评审中') ">
						<td width="12.5%"><span class="toReview"><s:property value="state" /></span> &nbsp;<i class="glyphicon glyphicon-menu-down"></i>
						<div class="open">
							<span>共分配专家 <s:property value="scoreMap.get(id).get(0)" /></span><br>
					   		<span>已完成 <s:property value="scoreMap.get(id).get(1)" /></span><br>
							<span>同意立项 <s:property value="scoreMap.get(id).get(2)" /></span><br>
							<span>拒绝立项 <s:property value="scoreMap.get(id).get(3)" /></span><br> 
					    </div>
					    </td>
			    </s:elseif >
				 <s:elseif  test="state.equals('申报待评审') ">
						<td width="12.5%"><span class="nopassReview"><s:property value="state" /></span>
						&nbsp;<i class="glyphicon glyphicon-menu-down"></i>
						<div class="open">
							<span>共分配专家  0</span><br>
					   		<span>已完成  0</span><br>
							<span>同意立项  0</span><br>
							<span>拒绝立项  0</span><br> 
					    </div>
						</td>
			    </s:elseif >
			</tr>
		    </s:iterator>	
		</thead>
      </table>
    </div>
    </div>
    <div class="tab-pane" id="tab3">
          <br/>
      <div class="" style="position:relative;">
      	<div style=" margin-right:496px; magrin-top:5px;">
      		 <input class="form-control f-ib projectName"  placeholder="课题名称"/>
      	</div>
        <div style="position:absolute;top:0;right:0">
        	<input class="form-control f-ib projectNo" placeholder="课题编号" style="width:180px;"/>
	        <input class="form-control f-ib projectPerson" placeholder="负责人" style="width:120px;"/>
	        <select class="form-control f-ib projectType" style="width:120px; padding-top:5px;"/>
	           <option value='-1' selected style='color:grey'>状态</option>
	           <option value="0">申报待评审</option>
	           <option value="1">申报待修改</option>
	           <option value="2">申报评审中</option>
	           <option value="3">资格审查</option>
		     </select>
            <a class="btn btn-primary f-ib search" style="width:60px; margin-top:-3px;" value="tab3">搜 索</a></div>
      </div><br/>
       <div style="overflow-x: auto; overflow-y: scroll; width:100%;">
       <table style="table-layout:fixed;" class="table table-hover table-bordered table-borderSelf1 topam" value="tab3">
		<tbody>
			<tr>
				<th width="7%" style="text-align:center">序号</th>
				<th  width="100px" style="text-align:center">操作</th>
				<th  width="12.5%" style="text-align:center">课题编号</th>
				<th  width="15%" style="text-align:center">课题名称</th>
				<th width="10%" style="text-align:center">负责人</th>
				<th width="10%" style="text-align:center">学科分类</th>
				<th width="10%" style="text-align:center">申报时间</th>
				<th  width="12.5%" style="text-align:center">状态</th>
			</tr>
		</tbody>
		</table>
		</div>
		<div style="overflow-x: auto; overflow-y: auto; height: 750px; width:100%;" class="dcontainer">
		<table class="table table-hover table-bordered table-borderSelf1 topam1">
		<thead>
			<s:iterator value="tenderProjectionList" status="index">
			<tr class="line">
				<td style="word-wrap:break-word " width="7%"><s:property value="#index.index+1" /></td>
				<td style="word-wrap:break-word " width="100px">
			   		 <s:if  test="state.equals('申报待修改') ">
			   		    <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=2">查看课题</a><br>
					    <%-- <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载招标文件</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载招标文件</a><br />
						</s:else> --%>
					   
			   		 </s:if >
			   		  <s:elseif  test="state.equals('资格审查') ">
			   		    <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=2">查看课题</a><br>
					    <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载申请书</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载申请书</a><br />
						</s:else>
					  <a href="Qualification?projection.id=<s:property value="id" />&tag=2">资格审查</a><br>
			   		 </s:elseif >
			   		 
			   		  <s:elseif  test="state.equals('申报评审中') ">
			   		     <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=2">查看课题</a><br>
			   		     <s:if test="#session.username!=@com.projection.util.Constant@HEADNAME && #session.userType==@com.projection.util.Constant@ADMIN">
						 <a href="OperatorExpertDispatch?projection.id=<s:property value="id"/>&tag=2">专家分派</a><br>
					     </s:if>
						
				        <%-- <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载招标文件</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载招标文件</a><br />
						</s:else> --%>
				        <a href="GetProjectionReviewById?projection.id=<s:property value="id"/>&type=apply&tag=2 ">查看评审意见</a><br>
				       
			   		 </s:elseif >
				     <s:elseif  test="state.equals('申报待评审') ">
				       <a href="AdminProjectionView?projection.id=<s:property value="id" />&tag=2">查看课题</a><br>
				        <s:if test="#session.username!=@com.projection.util.Constant@HEADNAME && #session.userType==@com.projection.util.Constant@ADMIN">
						<a href="OperatorExpertDispatch?projection.id=<s:property value="id" />&tag=2">专家分派</a><br>
						 </s:if>
						<%-- <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1)">
						  <a href="download?projection.id=${id}&type=3" target="" title="">下载招标文件</a><br />
						 </s:if>
						 <s:else>
						  <a href="" target="" title="">下载招标文件</a><br />
						</s:else> --%>
						<a href="javascript:fun('backToModify?projection.id=<s:property value="id"/>'), void(0);" >退回修改</a><br />
						
			         </s:elseif >
				</td>
				<td style="word-wrap:break-word " width="12.5%"><s:property value="codes"></s:property></td>
				<td style="word-wrap:break-word " width="15%"><s:property value="title"></s:property></td>
				<td style="word-wrap:break-word " width="10%"><s:property value="user.username"></s:property></td>
				<td style="word-wrap:break-word " width="10%"><s:property value="type.split(',')[0]"></s:property></td>
				<td style="word-wrap:break-word " width="10%"><s:date name="applyDate" format="yyyy-MM-dd" /></td>
			    <s:if  test="state.equals('申报待修改') ">
						<td  width="12.5%" ><span ><s:property value="state" /></span> &nbsp;<i class="glyphicon glyphicon-menu-down"></i>
						<div class="open">
							<span>共分配专家  0</span><br>
					   		<span>已完成  0</span><br>
							<span>同意立项  0</span><br>
							<span>拒绝立项  0</span><br> 
					    </div>
						</td>
			    </s:if >
			     <s:elseif  test="state.equals('资格审查') ">
						<td width="12.5%"><span class="nopassReview"><s:property value="state" /></span>
						&nbsp;
						</td>
			          </s:elseif >
			    <s:elseif  test="state.equals('申报评审中') ">
						<td  width="12.5%" ><span class="toReview"><s:property value="state" /></span> &nbsp;<i class="glyphicon glyphicon-menu-down"></i>
						<div class="open">
							<span>共分配专家 <s:property value="scoreMap.get(id).get(0)" /></span><br>
					   		<span>已完成 <s:property value="scoreMap.get(id).get(1)" /></span><br>
							<span>同意立项 <s:property value="scoreMap.get(id).get(2)" /></span><br>
							<span>拒绝立项 <s:property value="scoreMap.get(id).get(3)" /></span><br> 
					    </div>
					    </td>
			    </s:elseif >
				 <s:elseif  test="state.equals('申报待评审') ">
						<td  width="12.5%" ><span class="nopassReview"><s:property value="state" /></span>
						&nbsp;<i class="glyphicon glyphicon-menu-down"></i>
						<div class="open">
							<span>共分配专家  0</span><br>
					   		<span>已完成  0</span><br>
							<span>同意立项  0</span><br>
							<span>拒绝立项  0</span><br> 
					    </div>
						</td>
			    </s:elseif >
			</tr>
		   </s:iterator>
		</thead>
      </table>
      </div>
    </div>
 </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/dataTables.bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/table2.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/manageSearch.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script>
//滚动条
var normal = ${normalProjectionList.size()};
var aid = ${aidProjectionList.size()};
var tender = ${tenderProjectionList.size()}; 
/* var ll = $("#tab1").find(".line:eq(0)").height(); */
var ll = "118";
$(document).ready(function(){
		var hei= $(".dcontainer").height();
		if(normal*ll+2<=hei){
			$("#tab1").find(".topam").parent().css("overflow-y","auto");
		}
		else $("#tab1").find(".topam").parent().css("overflow-y","scroll");
		if(aid*ll+2<=hei){
			$("#tab2").find(".topam").parent().css("overflow-y","auto");
		}
		else $("#tab2").find(".topam").parent().css("overflow-y","scroll");
		if(tender*ll+2<=hei){
			$("#tab3").find(".topam").parent().css("overflow-y","auto");
		}
		else $("#tab3").find(".topam").parent().css("overflow-y","scroll");
	 	 window.onresize = function(){//当改变窗口大小时适应滚动条
			   if( $("#tab1").find(".topam").height()>41){
				   $("#tab1").find(".topam").parent().height($("#tab1").find(".topam").height()+2)
			   }
			   else 	 $("#tab1").find(".topam").parent().height(41);
			   if( $("#tab2").find(".topam").height()>41){
				   $("#tab2").find(".topam").parent().height($("#tab2").find(".topam").height()+2)
			   }
			   else 	 $("#tab2").find(".topam").parent().height(41);
			   if( $("#tab3").find(".topam").height()>41){
				   $("#tab3").find(".topam").parent().height($("#tab3").find(".topam").height()+2)
			   }
			   else 	 $("#tab3").find(".topam").parent().height(41);
			  
		   } 
})
function fun(x){
	Showbo.Msg.confirm('确定退回修改？',function(flag){
			if(flag=='yes')
				location.href =x;
		}); 
};

   $(".countTip").parent().click(function(){
	    $(".countTip").css("display","none"); 
   })
</script>
<script>
/*Tab切换  */

var tag=${tag};
  if(tag==null){
	tag =0;
   };
$('#myTab li:eq('+tag+') a').tab('show');



 /*   var id = location.search.split("=")[1];
   $('#myTab li:eq('+id+') a').tab('show');
 */
</script>
<script>
//箭头展开收缩
$(document).ready(function(){
	var aa = 1;
	$(".open").hide();
  $(".open").prev().click(function(){
	  bb = 1;
    $(this).next().slideToggle();
    if(aa==0){
    	$(this).attr("class","glyphicon glyphicon-menu-down");
    	aa = 1;
    }
    else{
    	 $(this).attr("class","glyphicon glyphicon-menu-up");
    	 aa = 0;
    }
  });
/*   $('a[data-toggle="tab"]').on( 'shown.bs.tab', function (e) {//tab格式自适应
      $.fn.dataTable.tables( {visible: true, api: true} ).columns.adjust();
  } ); */
  
});
</script>
</body>
</html>