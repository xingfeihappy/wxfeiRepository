<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看评审意见</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<style type="text/css">
.fillFormHelp{padding: 2% 3%;background: #fff;border:1px solid #ccc;margin:0 auto;}
</style>
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
			   		<td >
			   		    <span>共分配专家 <s:property value="total" /></span><br>
			   			<span>已完成 <s:property value="complete" /></span><br>
						<span>同意立项 <s:property value="agree" /></span><br>
						<span>拒绝立项 <s:property value="disagree" /></span><br>
					</td>
			   		<td><s:property value="score_xt" /></td>
			   		<td><s:property value="score_lz" /></td>
			   		<td><s:property value="score_yjjc" /></td>
		   	    </tr>
		   	</tbody>
		</table>
	</form>
	<br/>
	<form class="newApplication1" method="post" action ="SubmitToDirector">
	<input name="projectionId" value="<s:property value="projection.id" />" type="hidden"/>
	    <table class="table table-hover table-bordered">
			<thead>
				<tr>
				<s:if test="projection.projectionType == 12">
				    <th>次数</th>
				 </s:if>
					<th>评审专家</th>
					<th>评审意见</th>
					<th>评审意见表</th>
				</tr>
			</thead>
			<tbody>
			<s:iterator value="oldreviewList1" status="index">
				<tr style="height:34px">
				    <s:if test="projection.projectionType == 12"><td >第1次</td></s:if>
					<td ><s:property value="participation.username" /></td>
					<td>
						<s:if test="state==1&&isTemp==1">同意立项</s:if>
						<s:elseif test="isTemp==1&&state==2">不同意立项</s:elseif>
						<s:elseif test="state==0">未评审</s:elseif>
						<s:elseif test="isTemp==2">未评审</s:elseif>
					</td>
					<td><s:if test="state==0">录入</s:if>
					<s:elseif test="isTemp==2">重新录入&nbsp;&nbsp;
					</s:elseif>
					<s:elseif test="isTemp==1"><a style="z-index:9999;position:relative" href="GetReviewByUserId?user.id=<s:property value="participation.id" />&projection.id=<s:property value="projection.id" /> ">查看</a></s:elseif>
					</td>
				</tr>
			  </s:iterator>
			  <s:iterator value="oldreviewList2" status="index">
				<tr style="height:34px">
				    <s:if test="projection.projectionType == 12"><td >第2次</td></s:if>
					<td ><s:property value="participation.username" /></td>
					<td>
						<s:if test="state==1&&isTemp==1">同意立项</s:if>
						<s:elseif test="isTemp==1&&state==2">不同意立项</s:elseif>
						<s:elseif test="state==0">未评审</s:elseif>
						<s:elseif test="isTemp==2">未评审</s:elseif>
					</td>
					<td><s:if test="state==0">录入</s:if>
					<s:elseif test="isTemp==2">重新录入&nbsp;&nbsp;
					</s:elseif>
					<s:elseif test="isTemp==1"><a style="z-index:9999;position:relative" href="GetReviewByUserId?user.id=<s:property value="participation.id" />&projection.id=<s:property value="projection.id" /> ">查看</a></s:elseif>
					</td>
				</tr>
			  </s:iterator>
			  <s:iterator value="reviewList" status="index">
				<tr style="height:34px">
				    <s:if test="projection.projectionType == 12"><td >第<s:property value="first" />次</td></s:if>
					<td ><s:property value="participation.username" /></td>
					<td>
						<s:if test="state==1&&isTemp==1">同意立项</s:if>
						<s:elseif test="isTemp==1&&state==2">不同意立项</s:elseif>
						<s:elseif test="state==0">未评审</s:elseif>
						<s:elseif test="isTemp==2">未评审</s:elseif>
					</td>
					<td><s:if test="state==0"><a href="InputReview?user.id=<s:property value="participation.id" />&projection.id=<s:property value="projection.id" />&tag=<s:property value="tag" />">录入</a></s:if>
					<s:elseif test="isTemp==2"><a href="AgainInputReview?user.id=<s:property value="participation.id" />&projection.id=<s:property value="projection.id" />&tag=<s:property value="tag" /> ">重新录入</a>&nbsp;&nbsp;
					</s:elseif>
					<s:elseif test="isTemp==1"><a style="z-index:9999;position:relative" href="GetReviewByUserId?user.id=<s:property value="participation.id" />&projection.id=<s:property value="projection.id" /> ">查看</a></s:elseif>
					</td>
				</tr>
			  </s:iterator>
			</tbody>
		</table>
		<br/>
		 <table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>填写人</th>
					<th>评审意见</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="position: relative;" class="op" ><a><s:property value="currentUser.username" /></a>
						<s:if test="projection.projectionType.equals('12')">
						     <s:if test="opReview.equals('')"></s:if>
						     <s:else>
							<div class="opReview fillFormHelp" style="display:none;position: absolute;bottom:45px;overflow:hidden;left:50%;">
		                    <s:property value="opReview" /> 
	                    </div></s:else></s:if>
					</td>
					<td>
					<s:if test="isRepeat==1">
						<textarea id="text" rows="3" style="width: 100%;border: 0px;" name="review.review"><s:property value="review.review" /></textarea>
					</s:if>
					<s:if test="isRepeat==2">
						<textarea id="text" readonly rows="3" style="width: 100%;border: 0px;" name="review.review"><s:property value="review.review" /></textarea>
					</s:if>
					</td>
				</tr>
			</tbody>
		</table><br/>
		<s:if test="isRepeat==1">
			<input id="btn" class="btn btn-primary submit" target="right" style="float:right;width:70px;" type="submit" value="提 交" />
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
	if(state=="已立项"||state=="拒绝立项"){
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
<script type="text/javascript">
$(".op").mouseover(function(){
	$(".opReview").fadeIn("6000")
})

$(".op").mouseleave(function(){
	$(".opReview").fadeOut("6000")
})
$(".dir").mouseover(function(){
	$(".dirReview").fadeIn("6000")
})

$(".dir").mouseleave(function(){
	$(".dirReview").fadeOut("6000")
})
$(".head").mouseover(function(){
	$(".headReview").fadeIn("6000")
})

$(".head").mouseleave(function(){
	$(".headReview").fadeOut("6000")
})
</script>
</html>