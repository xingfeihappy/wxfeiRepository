<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的课题</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body onselectstart="return false;">
<!-- <a class="btn btn-primary back" href="UserFace" target="right" style="width:80px;">返回首页</a><br /><br /> -->
<font>状态切换</font>
<select class="form-control f-ib myProjectionChange" style="width:30%;margin-bottom:10px;margin-left:2%">
  <option value="0">全部</option>
  <option value="1" <s:if test="id==1">selected</s:if>><%=Constant.STATE2%></option>
  <option value="2" <s:if test="id==2">selected</s:if>><%=Constant.STATE4%></option>
  <option value="3" <s:if test="id==3">selected</s:if>><%=Constant.STATE3%></option>
  <option value="4" <s:if test="id==4">selected</s:if>><%=Constant.STATE1%></option>
  <option value="5" <s:if test="id==5">selected</s:if>><%=Constant.STATE7%></option>
  <option value="6" <s:if test="id==6">selected</s:if>><%=Constant.STATE5%></option>
  <option value="7" <s:if test="id==7">selected</s:if>><%=Constant.STATE6%></option>
  <option value="8" <s:if test="id==8">selected</s:if>><%=Constant.STATE9%></option>
  <option value="9" <s:if test="id==9">selected</s:if>><%=Constant.STATE8%></option>
  <option value="10" <s:if test="id==10">selected</s:if>><%=Constant.STATE10%></option>
  <option value="11" <s:if test="id==11">selected</s:if>><%=Constant.STATE11%></option>
  <option value="12" <s:if test="id==12">selected</s:if>><%=Constant.STATE12%></option>
</select>
<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade in active" id="tab1">
    <table class="table  table-hover table-borderSelf3">
		<thead>
			<tr>
				<th width="5%">序号</th>
				<th width="8%">状态</th>
				<th width="10.7%">课题编号</th>
				<th width="10.7%">课题类型</th>
				<th width="14.5%">课题名称</th>
				<th width="7.3%">申请人</th>
				<th width="10.8%">申报时间</th>
				<th width="10.8%">预计完成时间</th>
				<th width="8%">课题申请书</th>
				<th width="8%">课题结题书</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		  <s:iterator value="projectionList" status="index">
			<tr class="line">
				<td><s:property value="#index.index+1" /></td> 
				<td>
				   <s:if test="state.equals('申报待修改')">
				      <span class="nopassReview" id="4"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('草稿')">
				      <span class="nopassReview" id="1"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('申报评审中')">
				      <span class="toReview" id="3"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('申报待评审')">
				      <span class="nopassReview" id="2"><s:property value="state" /></span>
				   </s:if>
				   <s:if test='state.equals("结题待评审")'>
				      <span class="nopassReview" id="6"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('结题评审中')">
				      <span class="toReview" id="7"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('已立项')">
				      <span class="passReview" id="5"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('已结题')">
				      <span class="passReview" id="9"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('结题待修改')">
				      <span class="nopassReview" id="8"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('拒绝结题')">
				      <span class="nopassReview" id="11"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('拒绝立项')">
				      <span class="nopassReview" id="10"><s:property value="state" /></span>
				   </s:if>
				   <s:if test="state.equals('资格审查')">
				      <span class="toReview" id="12"><s:property value="state" /></span>
				   </s:if>
				   
				</td>
				<td><s:property value="codes" /></td>
				<td><s:if test="projectionType.equals('11')">一般课题</s:if>
				<s:if test="projectionType.equals('12')">资助课题</s:if>
				<s:if test="projectionType.equals('13')">招标课题</s:if></td>
				<td><a href="GetProjectionById?projection.id=<s:property value="id" />" title="查看课题申报信息"><s:property value="title" /></a></td>
				<td><s:property value="user.username" /></td>
				<td><s:date name="applyDate" format="yyyy-MM-dd" /></td>
				<td><s:date name="deadline" format="yyy-MM-dd"/></td>
				<td>
				 <s:if test="projectionType != 13">
			     <s:if test="(isHaveDemonstrationFiles ==1 && isHaveConditionAndSecurityFiles ==1) || get(i).filesList.size() > 3 ">
				  <a class="btn" href="download?projection.id=${id}&type=3" target="" title=""><i class="download"></i></a>
				 </s:if>
				 <s:else>
				  -
				 </s:else>
				 </s:if>
				 <s:else>
				 -
				 </s:else>
				</td>
				<td> 
				 <s:if test=" isHaveConclusionFiles ==1 ">
				  <a class="btn" href="download?projection.id=${id}&type=4" target="" title=""><i class="download"></i></a>
				 </s:if>
				 <s:else>
				  -
				 </s:else>
				</td>
				<td>
			       <s:if test="state.equals('申报待修改')">
				      <a class="btn btn-primary back back1" href="GetProjectionById?projection.id=<s:property value="id" />&pageType=1" target="right" title="修改">修改</a>
				   </s:if>
				    <s:if test="state.equals('结题待修改')">
				      <a class="btn btn-primary back back1" href="GetProjectionById?projection.id=<s:property value="id" />&pageType=2" target="right" title="修改">修改</a>
				   </s:if>
				   <s:if test="state.equals('草稿')">
				     <s:if test="identify !=null"><!-- 说明是结题的草稿 -->
                      <a class="btn btn-primary back back1" href="GetProjectionById?projection.id=<s:property value="id" />&pageType=2" target="right" title="修改">修改</a>				     </s:if>
				     <s:else><!-- 说明是申报的的草稿 -->
				      <a class="btn btn-primary back back1" href="GetProjectionById?projection.id=<s:property value="id" />&pageType=1" target="right" title="修改">修改</a> 
				     </s:else>
				      <a class="btn btn-primary back back1" href="javascript:fun('DeleteProjectionById?projection.id=<s:property value="id" />'),void(0);"  target="right" title="删除">删除</a>
				   </s:if>
				   <s:if test="state.equals('申报评审中')">
				      <a class="btn btn-primary back back1" target="right" title="查看" href="GetProjectionById?projection.id=<s:property value="id" />">查看</a>
				   </s:if>
				   <s:if test="state.equals('申报待评审')">
				      <a class="btn btn-primary back back1" target="right" title="查看" href="GetProjectionById?projection.id=<s:property value="id" />">查看</a>
				   </s:if>
				   <s:if test='state.equals("结题待评审")'>
				      <a class="btn btn-primary back back1" target="right" title="查看" href="GetProjectionById?projection.id=<s:property value="id" />">查看</a>
				   </s:if>
				   <s:if test="state.equals('结题评审中')">
				      <a class="btn btn-primary back back1" target="right" title="查看" href="GetProjectionById?projection.id=<s:property value="id" />">查看</a>
				   </s:if>
				   <s:if test="state.equals('已立项')">
				      <a class="btn btn-primary back back1" target="right" title="查看" href="GetProjectionById?projection.id=<s:property value="id" />">查看</a>
				   </s:if>
				   <s:if test="state.equals('已结题')">
				      <a class="btn btn-primary back back1" target="right" title="查看" href="GetProjectionById?projection.id=<s:property value="id" />">查看</a>
				   </s:if>
				   <s:if test="state.equals('拒绝结题')">
				      <a class="btn btn-primary back back1" target="right" title="查看" href="GetProjectionById?projection.id=<s:property value="id" />">查看</a>
				   </s:if>
				   <s:if test="state.equals('拒绝立项')">
				      <a class="btn btn-primary back back1" target="right" title="查看" href="GetProjectionById?projection.id=<s:property value="id" />">查看</a>
				   </s:if>
				   <s:if test="state.equals('资格审查')">
				      <a class="btn btn-primary back back1" target="right" title="查看" href="GetProjectionById?projection.id=<s:property value="id" />">查看</a>
				   </s:if>
			    </td>
			</tr>
		  </s:iterator>
		 </tbody>
	  </table>
  </div>
</div>
<!-- <input type="hidden" value="" name="stateTemp" id="stateTemp"/> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script>
function fun(x){
	Showbo.Msg.confirm('确定删除该条草稿?',function(flag){
			if(flag=='yes')
				location.href =x;
		}); 
};
  var id = location.search.split("=")[1];
  $('#myTab li:eq('+id+') a').tab('show');
  if(id != 0){
	  $(".myProjectionChange").change();
  }
  //首页上提醒点击进入的状态切换
  var l=0;
  var spans = $("span");
  $(function(){
	  var id='${id}';
	  if(id==null){
		  id=0;
	  }
	  for(var i=1;i<=12;i++){
		  if(id==i){
			  $(".line").hide();
				spans.each(function(){
					  if($(this).attr("id") == i){
						  $(this).parent().parent().show();
					  }
				  })
			}
	  } 
	  // l 为满足条件的数量 重新设定序号
		$(".line").each(function(){
			if($(this).css("display")!="none")
				l++;
			$(this).children(":first").html(l);
		})
	  
  })

  
 //我的课题切换状态
$(".myProjectionChange").change(function(){
			l=0;
		  $(".line").hide();
		  var val = $(this).val();
		  var that = $(this).children(":checked").text();
		  if(val == 0){
			  $(".line").show();
		  }else{
			  spans.each(function(){
				  if($(this).html() == that){
					  $(this).parent().parent().show();
				  }
			  })
		  }
		   // l 为满足条件的数量 重新设定序号
			$(".line").each(function(){
				if($(this).css("display")!="none")
					l++;
				$(this).children(":first").html(l);
			})
})
  
</script>
</body>
</html>