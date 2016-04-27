<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帮助</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body>
   <div class="fillFormHelp">
	<p>1．封面上“学科分类”、“成果形式”等栏目的填写应与数据表选择的内容一致。</p>
	<p>2．数据表中“学科分类”以及“预期成果形式”等栏目的填写，请直接在选中的分类编号上打√</p>
	<p>3. 本表提到的杭州西湖博物馆特指杭州西湖博物馆（西湖学研究院）。</p>
	<p>4. 申报人必须严格按照公告要求提交申报书和有关材料。</p>
	<p>5. 申报表一式3份，A4纸打印，左侧装订。</p>
	<div class="acceptFill"><input id="acceptFillCheck" type="checkbox" /><span>我已阅读填表说明</span></div>
	<button type="button" class="btn btn-primary btn-fillApplication" style="width:80px;">填写申报</button>
   </div>
   <center>
     <div style="height:100px;">
     <div class="helpButton">
     <p class="toReview">请先选择要申报的项目类型!</p>
     <button type="button" class="btn btn-primary" onclick="chooseType(11)" style="width:80px;">一般课题</button>
     <button type="button" class="btn btn-primary" onclick="chooseType(12)" style="width:80px;">资助课题</button>
     <button type="button" class="btn btn-primary" onclick="chooseType(13)" style="width:80px;">招标课题</button>
     </div>
     </div>
   </center>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script>
  var accept = $("#acceptFillCheck"),btn = $(".btn-fillApplication"),back = $(".btn-back");
  btn.prop("disabled", true);
  $(".helpButton").css("display","none");
  accept.click(function(){
  	if(accept.is(":checked")) {
  		btn.prop("disabled", false);
  }else{
  		btn.prop("disabled", true);
  }
  })
  btn.click(function(){
	  $(".helpButton").css({"display":"inline-block","margin-top":"3%","margin-left":"-17%"});
  }); 
 
  //判断是显示已阅读还是返回新1,0;还是返回编辑1,课题ID
  /* var url = location.search;
  var Request = new Object();
  if(url.indexOf("?"!=-1)){
	  var str = url.substr(1);
	  strs = str.split("&");
	  for(var i = 0;i<strs.length;i++){
		  Request[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
	  }
	  if(Request["argue"]==1){
		  $(".acceptFill,.btn-fillApplication").css("display","none");
		  $(".btn-back").css("display","block");
	  }
  } */
  function chooseType(type){
	  window.location.href="NewApplicationPage?projection.projectionType="+type+"&user.id="+${user.id};
  }
  
  //这个是判断课题类型的
  var from = location.search.split("=")[1];
  if(from == 1){
	  accept.prop("checked", true);
	  btn.prop("disabled", false);
	  btn.prop("disabled", true);
	  $(".helpButton").css({"display":"inline-block","margin-top":"3%","margin-left":"-17%"});
  }
</script>
</html>