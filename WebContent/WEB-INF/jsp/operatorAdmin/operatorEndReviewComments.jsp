<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看评审意见</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body>
    <form class="addProfessor">
    	<a class="btn btn-default f-f1" onClick="back()" target="right" style="width:80px;z-index:9999;position:relative">返 回</a>
    </form>
    <br/>
	<form class="newApplication1"  method="post">
	<input name="projectionId" value="<s:property value="projection.id" />" type="hidden"/>
		<table class="table table-bordered">
		   	<thead>
		   		<tr>
		   			<th rowspan="2" style="width:15%">课题名称</th>
		   			<th rowspan="2" style="width:10%">评审状态</th>
		   			<th colspan="3" style="width:35%">平均分（10分制）</th>
					<th rowspan="2" style="width:10%">课程编号</th>
					<th rowspan="2" style="width:7%">负责人</th>
					<th rowspan="2" style="width:12%">起止年限</th>
					<th rowspan="2" style="width:5%">经费额度（万元）</th>
		   		</tr>
		   		<tr>
		   			<th style="width:5%">选题</th>
		   			<th style="width:5%">论证</th>
		   			<th style="width:5%">研究基础</th>
		   		</tr>
		   	</thead>
		   	<tbody>
		   		<tr>
			   		<td><span><s:property value="projection.title" /></span></td>
			   		<td>
			   		    <span>共分配专家 <s:property value="total" /></span><br>
			   			<span>已完成 <s:property value="complete" /></span><br>
						<span>同意结题 <s:property value="agree" /></span><br>
						<span>拒绝结题 <s:property value="disagree" /></span><br>
					</td>
			   		<td><s:property value="score_xt" /></td>
			   		<td><s:property value="score_lz" /></td>
			   		<td><s:property value="score_yjjc" /></td>
			   		<td><span><s:property value="projection.codes" /></span></td>
			   		<td><span><s:property value="projection.user.username" /></span></td>
			   		<td><span><s:date name="projection.applyDate" format="yyyy-MM-dd"/>至<s:date name="projection.deadline" format="yyyy-MM-dd"/></span></td>
		   	        <td><span><s:property value="projection.supportMoney" /></span></td>
		   	    </tr>
		   	</tbody>
		</table>
		<br/>
		<br/>
	</form>
	<br/>
	<form class="newApplication1" method="post" action ="SubmitToDirector">
	<input name="projectionId" value="<s:property value="projection.id" />" type="hidden"/>
	<s:if test="total!=0">
	    <table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>评审专家</th>
					<th>评审意见</th>
					<th>评审意见表</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="reviewList" status="index">
				<tr>
					<td ><s:property value="participation.username" /></td>
					<td>
						<s:if test="state==1&&isTemp==1">同意结题</s:if>
						<s:elseif test="isTemp==1&&state==2">不同意结题</s:elseif>
						<s:elseif test="state==0">未评审</s:elseif>
						<s:elseif test="isTemp==2">未评审</s:elseif>
					</td>
					<td><s:if test="state==0"><a href="InputEndReview?user.id=<s:property value="participation.id" />&projection.id=<s:property value="projection.id" />&tag=<s:property value="tag" /> ">录入</a></s:if>
					<s:elseif test="isTemp==2"><a href="AgainInputEndReview?user.id=<s:property value="participation.id" />&projection.id=<s:property value="projection.id" />&tag=<s:property value="tag" /> ">重新录入</a>&nbsp;&nbsp;
					</s:elseif>
					<s:elseif test="isTemp==1"><a style="z-index:9999;position:relative" href="GetReviewByUserId?user.id=<s:property value="participation.id" />&projection.id=<s:property value="projection.id" /> ">查看</a></s:elseif>
					</td>
				</tr>
			  </s:iterator>
			</tbody>
		</table>
		<br/><br/>
		</s:if>
		 <table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>填写人</th>
					<th>评审意见</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td ><span><s:property value="currentUser.username" /></span></td>
					<td>
					   <s:if test="isRepeat==1">
						<textarea rows="3" style="width: 100%;border: 0px;" name="review.review"><s:property value="review.review" /></textarea>
					  </s:if>
					  <s:if test="isRepeat==2">
					  <textarea rows="3"  readonly style="width: 100%;border: 0px;" name="review.review"><s:property value="review.review" /></textarea>
					  </s:if>
					</td>

				</tr>
			</tbody>
		</table><br/>
		<s:if test="isRepeat==1">
		<input id="btn" class="btn btn-primary submit" target="right" style="float:right;width:70px;" type="submit" value="提 交"></input>
	   </s:if>
	</form>
	<div id="bg" style="display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;   z-index:1001; background:transparent;"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script>
/* function func(){
	if(confirm('确定退回专家评审意见?')==true){
		$("#back").text("已退回");
		$("#back").removeAttr('onClick');
	}
	
} */
</script>
<script>
var state="${projection.state}";
(function func(){
	if(state=="已结题"||state=="拒绝结题"){
		 /* $("#text").css("cursor","not-allowed");
		 $("#text").attr("disabled","true");  */
		$("#bg").css("display","block");
		$("#btn").css("display","none");
	}
	
})();
</script>
<script type="text/javascript">
var tag="${tag}";
var state="${projection.state}";
function back(){
	if(state=="申报待评审"||state=="申报评审中"||state=="拒绝立项"||state=="申报待修改")
	 window.location.href="operatorApplyManage?tag="+tag;
	else{
		window.location.href="operatorApplyEndManage?tag="+tag;
	}
}
</script>
</html>