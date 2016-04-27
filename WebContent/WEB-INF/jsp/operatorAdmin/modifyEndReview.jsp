<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>修改评审意见</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>

<body>
<form id="form1" class="newApplication" method="post" action="SubmitModifyReviewResult"  enctype="multipart/form-data">
<!-- <form class="newApplication" method="post" action="javascript:fun('SubmitModifyReviewResult'),void(0);"  enctype="multipart/form-data"> -->
<div class="fileUpload btn btn-primary">
	<span>上传扫描件</span>
	<input type="file" onchange="getReviewFileName(this)" style="width:100%" name="file" class="upload reviewFile" />
</div>&nbsp;&nbsp;
<input type="text" style="height:30px;border:0px solid #ccc;width:30%" placeholder="文件名称" readOnly="true "/>
<span class="validate"><i class="Validform_right"></i>格式正确</span>
<span class="novalidate"><i class="Validform_wrong"></i>格式错误,限pdf格式</span>
<span class="novalidate"><i class="Validform_wrong"></i>大小不超过3M</span>
<%-- <span style="color:#f0ad4e;font-size:13px">注：扫描件格式要求pdf格式,大小不超过3M。</span> --%>
<br/><br/>
<input name="projectionId" value="<s:property value="projection.id" />" type="hidden"/>
<input name="userId" value="<s:property value="user.id" />" type="hidden"/>
<input name="tag" value="<s:property value="tag" />" type="hidden"/>
   <table class="table table-bordered" >
     <tr>
       <td width="10%"><span>课题名称</span></td>
       <td colspan="10"><span><s:property value="projection.title" /></span></td>
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
       <td colspan="2" width="28%">是否同意立项</td>
       <td colspan="8" width="30%">
       <s:if test="review.state==null">
	     	<s:radio name="review.state"  
	     		list="#{1:'同意立项',2:'不同意立项'}"
		        value="review.state" theme="simple">
		    </s:radio>
	    </s:if>
	     <s:else>
			<s:radio name="review.state" list="#{1:'同意立项',2:'不同意立项'}"
		        theme="simple"></s:radio> 
        </s:else>
      </td>
   
     </tr>
     <tr>
       <td >备注</td>
       <td colspan="10" ><textarea rows="5" style="width: 100%;border: 0px;" name="review.remark">  <s:property value="review.remark" /> </textarea></td>
     </tr>
      <tr>
       <td colspan="11" ><div style="height:100px;position:relative;">
	       <span style="position:absolute;right:350px;bottom:45px;">评审专家（签名）：<s:property value="user.username" /></span><br/>
	       <span style="position:absolute;right:300px;bottom:15px;"> <s:property value="review.reviewDate" />
	       </span>
       	</div>
       </td>
     </tr>
   </table>
   <br />
   <input class="btn btn-primary f-fr" style="margin-left: 20px;width:70px;" type="button" value="提 交" onclick="conf()"></input>
   <input class="btn btn-primary f-fr" onclick="history.go(-1)" style="width:70px;" type="button" value="返 回"/>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script>
function conf(){
	if(isSize == false || isRight == false){
		  Showbo.Msg.alert("请选检查扫描件格式是否正确");
		  return false;
	  }
	if(isEmpty == false){
		  Showbo.Msg.alert("请选择上传扫描件");
		  return false;
	 }
	Showbo.Msg.confirm('评审意见提交后不能修改，确认提交吗?',function(flag){
			if(flag=='yes')	{	
				$("#form1").action="SubmitModifyReviewResult";
				$("#form1").submit();}
		}); 
};
/* function conf(){
	if(confirm('评审意见提交后不能修改，确认提交吗?')==true){
		return true;
	}
	else{
		return false;
	}
} */
var isSize = true;
var isRight = true;
var isEmpty = false;
//上传扫描件格式验证
$(".reviewFile").change(function(){
	isEmpty = true;
	var val = $(this).val(),t;
	var docs = val.split(".");
	var doc = docs[docs.length-1];
	var ary = ["png","jpg","pdf","jpeg"]; 
	t = $.inArray(doc,ary);
	if(t != -1){
		//格式正确
		isRight=true;
		try{
			var fileSize = 0;
			//for IE
			if($.support.msie){
				var objFSO = new ActiveXObject("Scripting.FileSystemObject"); 
				var filePath = $(this)[0].value;
				var objFile = objFSO.getFile(filePath);
				var fileSize = objFile.size;//size in kb
				fileSize = fileSize / 1048576;//size in mb
			}
			//for FF safari  Opera and onther
			else{
				fileSize = $(this)[0].files[0].size;//size in kb
				fileSize = fileSize / 1048576;//size in mb
			}
			if(fileSize >3){//格式正确大小不对
				isSize = false;
				$(this).parent().next().next().css("display","none");
				$(this).parent().next().next().next().css("display","none");
				$(this).parent().next().next().next().next().css("display","inline-block");
				$(this).val("");
			}else{
				isSize=true;
				$(this).parent().next().next().css("display","inline-block");
				$(this).parent().next().next().next().css("display","none");
				$(this).parent().next().next().next().next().css("display","none");
			}
		}catch(e){
			
		}
	}else{
		//格式错误
		isRight = false;
		$(this).parent().next().next().css("display","none");
		$(this).parent().next().next().next().css("display","inline-block");
		$(this).parent().next().next().next().next().css("display","none");
	}
})
//文件pdf格式验证--结束
</script>
</body>
</html>