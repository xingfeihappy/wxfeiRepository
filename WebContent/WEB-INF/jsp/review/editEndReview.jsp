<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>填写课题结题评审</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
<form id="form1" class="newApplication" method="post" action="EndProjectionReviewResult" onSubmit="return checkSelected()">

<input name="projectionId" value="<s:property value="projection.id" />" type="hidden"/>
<s:if test="review.isTemp==2">
     <span class="toReview" style="width:100px; text-align:center; display:block;margin:0 auto;height:20px; line-height:20px; "> 已暂存</span>
 </s:if>
   <table class="table table-bordered" >
     <tr>
       <td width="10%"><span>课题名称</span></td>
       <td colspan="10"><s:property value="projection.title" /></td>
     </tr>
     <tr>
       <td><span>评价指标</span></td>
       <td width="5%"><span>权重</span></td>
       <td width="26%"><span>指标说明</span></td>
       <td colspan="8"><span>专家评分</span></td>
     </tr>
      <tr>
       <td ><span>选题</span></td>
       <td ><span>3</span></td>
       <td ><span>主要考察选题的学术价值或应用价值，对国内外研究现状的总体把握程度</span></td>
      <td colspan="8"> 
       <s:if test="review.score_xt==null">
	     	<s:radio name="review.score_xt"  
	     		list="#{10:'10分',9:'9分',8:'8分',7:'7分',6:'6分',5:'5分',4:'4分',3:'3分'}"
		        value="review.score_xt" theme="simple">
		    </s:radio>
	    </s:if>
	    <s:else>
			<s:radio name="review.score_xt" list="#{10:'10分',9:'9分',8:'8分',7:'7分',6:'6分',5:'5分',4:'4分',3:'3分'}"
		        theme="simple"></s:radio> 
       </s:else>
	  </td>
     </tr>
      <tr>
       <td ><span>论证</span></td>
       <td ><span>5</span></td>
       <td ><span>主要考察研究内容、基本观点、研究思路、研究方法、创新之处</span></td>
       <td  colspan="8"> 
       <s:if test="review.score_lz==null">
	     	<s:radio name="review.score_lz"  
	     		list="#{10:'10分',9:'9分',8:'8分',7:'7分',6:'6分',5:'5分',4:'4分',3:'3分'}"
		        value="review.score_lz" theme="simple">
		    </s:radio>
	    </s:if>
       <s:else>
			<s:radio name="review.score_lz" list="#{10:'10分',9:'9分',8:'8分',7:'7分',6:'6分',5:'5分',4:'4分',3:'3分'}"
		        theme="simple"></s:radio> 
       </s:else>
	  </td>
	  </tr>
      <tr>
       <td ><span>研究基础</span></td>
       <td ><span>2</span></td>
       <td ><span>主要考察课题负责人的前期相关研究成果和主要参考文献</span></td>
       <td  colspan="8"> 
        <s:if test="review.score_yjjc==null">
	     	<s:radio name="review.score_yjjc"  
	     		list="#{10:'10分',9:'9分',8:'8分',7:'7分',6:'6分',5:'5分',4:'4分',3:'3分'}"
		        value="review.score_yjjc" theme="simple">
		    </s:radio>
	    </s:if>
      <s:else>
			<s:radio name="review.score_yjjc" list="#{10:'10分',9:'9分',8:'8分',7:'7分',6:'6分',5:'5分',4:'4分',3:'3分'}"
		        theme="simple"></s:radio> 
       </s:else>
	  </td>
	  </tr>
     <tr>
      <td>评审专家意见</td>
      <td colspan="10" ><textarea rows="6" style="width: 100%;border: 0px;" name="review.review"><s:property value="review.review" /></textarea></td>
     </tr>
     <tr>
       <td>综合评价</td>
       <td colspan="2" width="28%">是否同意结题</td>
       <td colspan="8" width="30%">
          <s:if test="review.state==null">
	     	<s:radio name="review.state"  
	     		list="#{1:'同意结题',2:'不同意结题'}"
		        value="review.state" theme="simple">
		    </s:radio>
	    </s:if>
	     <s:else>
			<s:radio name="review.state" list="#{1:'同意结题',2:'不同意结题'}"
		        theme="simple"></s:radio> 
        </s:else>
      </td>
   
     </tr>
     <tr>
       <td>备注</td>
       <td colspan="10" ><textarea rows="5" style="width: 100%;border: 0px;" name="review.remark"><s:property value="review.remark" /></textarea></td>
     </tr>
     <tr>
       <td colspan="11" ><div style="height:100px;position:relative;">
	       <span style="position:absolute;right:350px;bottom:45px;">评审专家（签名）：<s:property value="user.username" /></span><br/>
	       <span style="position:absolute;right:300px;bottom:15px;">
	       <%=new SimpleDateFormat( "yyyy 年 MM 月 dd 日 ").format(Calendar.getInstance().getTime())%>  
	       </span>
       	</div>
       </td>
     </tr>
   </table>
   <br />
   <input class="btn btn-primary f-fr" style="margin-left: 20px;width:60px;" type="button" value="提 交" onclick="changeSubmitAction()"></input>
   <input class="btn btn-primary f-fr" style="margin-left: 20px;width:60px;" type="submit" value="暂 存" onclick="changeAction()"></input>
   <a class="btn btn-primary f-fr"  href="ProjectEndReview" style="width:60px;">返 回</a>
    
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script>
function checkSelected(){
	  var xtcount=0;
	  var xt=document.getElementsByName('review.score_xt');
	  for(i = 0; i < xt.length; i++){
		  if(xt[i].checked == true){
			  xtcount++;
		  }
	  }
	  if(xtcount==0){
		  Showbo.Msg.alert("请给选题评分！");
		  return false;
	  }
	  var lzcount=0;
	  var lz=document.getElementsByName('review.score_lz');
	  for(i = 0; i < lz.length; i++){
		  if(lz[i].checked == true){
			  lzcount++;
		  }
	  }
	  if(lzcount==0){
		  Showbo.Msg.alert("请给论证评分！");
		  return false;
	  }
	  var yjjccount=0;
	  var yjjc=document.getElementsByName('review.score_yjjc');
	  for(i = 0; i < yjjc.length; i++){
		  if(yjjc[i].checked == true){
			  yjjccount++;
		  }
	  }
	  if(yjjccount==0){
		  Showbo.Msg.alert("请给研究基础评分！");
		  return false;
	  }
	  var scount=0;
	  var s=document.getElementsByName('review.state');
	  for(i = 0; i < s.length; i++){
		  if(s[i].checked == true){
			  scount++;
		  }
	  }
	  if(scount==0){
		  Showbo.Msg.alert("请选择是否同意结题！");
		  return false;
	  }	  
}
function changeAction(){
	//获取页面的第一个表单
	targetForm=document.forms[0];
	// 动态修改表单的Action属性
	targetForm.action="EndProjectionTemporaryStorage";
}
function changeSubmitAction(){
	Showbo.Msg.confirm('评审意见提交后不能修改，确认提交吗？',function(flag){
		if(flag=='yes'){
	 		//获取页面的第一个表单
			//targetForm=document.forms[0];
			// 动态修改表单的Action属性
			//targetForm.action="EndProjectionReviewResult"; 
			$("#form1").action="EndProjectionReviewResult";
			$("#form1").submit();
	}
});
	
}
</script>
</body>
</html>