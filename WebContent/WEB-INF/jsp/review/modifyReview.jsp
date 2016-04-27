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
</head>

<body>

<form class="newApplication" method="post" action="ModifyReviewResult">
<input name="projectionId" value="<s:property value="projection.id" />" type="hidden"/>
<input name="userId" value="<s:property value="user.id" />" type="hidden"/>
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
   </table>
   <br />
   <input class="btn btn-primary f-fr" style="margin-left: 20px;" type="submit" value="提 交"></input>
   <input class="btn btn-primary f-fr" style="margin-left: 20px;" type="button" value="暂 存"></input>
   <input class="btn btn-primary f-fr" onclick="history.go(-1)" type="button" value="返 回"/>
</form>

</body>
</html>