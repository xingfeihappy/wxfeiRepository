<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>查看评审意见</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<style type="text/css">
        #bg{ display: block;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;   z-index:1001; background:transparent;}
</style>
</head>

<body>

<form class="newApplication">
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
     	<s:radio name="a"  
     		list="#{10:'10分',9:'9分',8:'8分',7:'7分',6:'6分',5:'5分',4:'4分',3:'3分'}"
	        listKey="key" listValue="value" value="review.score_xt" theme="simple">
	    </s:radio>
	  </td>

     </tr>
      <tr>
       <td ><span>论证</span></td>
       <td ><span>5</span></td>
       <td ><span>主要考察研究内容、基本观点、研究思路、研究方法、创新之处</span></td>
     <td  colspan="8"> <span>
     		<s:radio name="b"  
     		list="#{10:'10分',9:'9分',8:'8分',7:'7分',6:'6分',5:'5分',4:'4分',3:'3分'}"
	        listKey="key" listValue="value" value="review.score_lz" theme="simple">
	        </s:radio></span>
	  </td>
     </tr>
      <tr>
       <td ><span>研究基础</span></td>
       <td ><span>2</span></td>
       <td ><span>主要考察课题负责人的前期相关研究成果和主要参考文献</span></td>
       <td  colspan="8"> 
     		<s:radio name="c"  
     		list="#{10:'10分',9:'9分',8:'8分',7:'7分',6:'6分',5:'5分',4:'4分',3:'3分'}"
	        listKey="key" listValue="value" value="review.score_yjjc" theme="simple">
	        </s:radio>
	  </td>
     </tr>
     <tr>
      <td>评审专家意见</td>
      <td colspan="10" ><textarea rows="6" style="width: 100%;border: 0px;z-index:9999;position:relative" readonly><s:property value="review.review" /></textarea></td>
     </tr>
     <tr>
       <td>综合评价</td>
       <td colspan="2" width="28%">是否同意立项</td>
       <td colspan="8" width="30%">
        <s:radio name="d"  
     		list="#{1:'同意立项',2:'不同意立项'}"
	        listKey="key" listValue="value" value="review.state" theme="simple">
	        </s:radio>
      </td>
   
     </tr>
     <tr>
       <td >备注</td>
       <td colspan="10" ><textarea rows="5" style="width: 100%;border: 0px;">  <s:property value="review.remark" /> </textarea></td>
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
   <div id="bg"></div>
   <s:if test="review.reviewFile != null">
   		<a class="btn btn-primary f-ib" id="sao" href="downloadReview?review.id=<s:property value="review.id" />" style="z-index:9999;position:relative">下载扫描件</a>
   </s:if>
   		<a class="btn btn-primary f-fr" onclick="history.go(-1)" target="right" style="width:60px;z-index:9999;position:relative">返 回</a>
</form>

</body>
</html>