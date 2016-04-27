
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结题申请</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/conclusion.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body>
<!-- 代码部分begin -->
<form method="post" action="ConclusionForm" id="form" class="registerform" enctype="multipart/form-data">
<div class="f-fl commonbtn">
   <input type="hidden" name="projection.id" value="<s:property value="projection.id" />" />
   <input type="submit" id="temp" class="btn btn-primary zc" style="width:60px;" value="暂  存" /> 
   <input type="button" id="jy" class="btn btn-primary jy1" style="width:60px;" value="保  存" />
   <%-- <s:if test="projection.projectionType!=@com.projection.util.Constant@PROJECTIONTYPE2"> --%>
   <s:if test="projection.isHaveConclusionFiles == 1">
   <button class="btn btn-primary down1" title="" id="down">下载结题书</button>
   </s:if>
   <s:else>
   <input type="button" class="btn btn-primary down" disabled="true" title="" value="下载结题书"/>
   </s:else>
   <%-- </s:if> --%>
   <input type="button" id="save" class="btn btn-primary submit1" title=""  style="width:60px;" value="递  交"/>
   <input type="hidden" class="tempsave" name="tempsave" />
</div>
<br /><br /><br />
<div class="noValidate">
  您还有尚未完成的验证！
</div>
<div class="haveValidate">
 验证通过！
</div>
<div class="bigone" style="position:relative;">
	<div style="position:relative;">
	<ul id="myTab" class="nav nav-tabs">
	  <li class="active"><a href="#tab1" data-toggle="tab">课题基本情况</a></li>
	  <li class=""><a href="#tab3" data-toggle="tab">成果列表</a></li>
	  <li class=""><a href="#tab4" data-toggle="tab">附件</a></li>
	</ul>
	<div class="tab-content" id="myTabContent" >
		<div class="tab-pane fade in active" id="tab1">
		  <div>
			   <table class="table table-bordered table-borderSelf2">
			     <tr>
			       <th style="width:15%">课题编号</th>
			       <td><s:property value="projection.codes" /></td>
			       <th style="width:15%">课题负责人</th>
			       <td><s:property value="projection.user.username" /></td>
			     </tr>
			     <tr>
			       <th>课题名称</th>
			       <td><s:property value="projection.title" /></td>
			       <th>总结时间</th>
			       <td><s:property value="projection.deadline" /></td>
			     </tr>
			     <tr>
			       <th>学科分类</th>
			       <td><s:property value="projection.type" /></td>
			       <th>起止时间</th>
			       <td><s:property value="projection.applyTime" />至<s:property value="projection.deadline" /></td>
			     </tr>
			     <tr>
			       <th>资助金额</th>
			       <td><s:property value="projection.budget.money" /></td>
			       <th>工作单位</th>
			       <td><s:property value="projection.user.unit" /></td>
			     </tr>
			     <tr>
			       <th>联系电话</th>
			       <td><s:property value="projection.user.telephone" /></td>
			       <th>通讯地址</th>
			       <td><s:property value="projection.user.address" /></td>  
			     </tr>
			     <tr>
			       <th>电子邮箱</th>
			       <td><s:property value="projection.user.email" /></td>
			       <th>邮编</th>
			       <td><s:property value="projection.user.postCode" /></td>
			     </tr>
			     <tr>
			       <th>主题词</th>
			       <td colspan="3"><s:property value="projection.tag" />（多个用；隔开）</td>
			     </tr>
				<tr>
					<th colspan="4">研究工作总结摘要（500字以内）</th>
				</tr>
				<tr>
					<td colspan="4"><textarea style="width:100%" name="projection.finishProjectionDescribe" rows="15"><s:property value="projection.finishProjectionDescribe" /></textarea></td>
				</tr>
			   </table>   
			</div>
		</div>
		<!-- 第三个内容 -->
		<div  class="tab-pane fade newApplication" id="tab3">
		<s:if test="projection.projectionType!=@com.projection.util.Constant@PROJECTIONTYPE2">
		<!-- 显示原先的 -->
		<table class="table table-bordered table-borderSelf3 f-fl" style="width:100%">
		   	<thead>
		   	<tr><th colspan="6" style="text-align:center">预期成果</th></tr>
		     <tr>
		       <td width="18%">成果类别</td>
		       <td width="15%">完成时间</td>
		       <td width="22%">成果名称</td>
		       <td width="15%">成果形式</td>
		       <td width="17%">预计字数(单位:千字)</td>
		       <td>类型</td>
		     </tr>
		    </thead>
		    <tbody>
		       <s:iterator value="projection.achievementList" status="index">
		       <s:if test="type.equals('预期成果')">
			      <tr>
			       <td>
			           <input type="text" readOnly="true" value="<s:property value="achievementType"/>">
			       </td>
			       <td><input readOnly="true" type='text'  name='achievementList[<s:property value="#index.index" />].finishTime' readOnly='true' value="<s:date name="finishTime" format="yyyy-MM-dd" />"/></td>
			       <td><input readOnly="true" type='text'  name='achievementList[<s:property value="#index.index" />].title' value="<s:property value="title"/>"/></td>
			       <td>
			         <input type="text" readOnly="true" value="<s:property value="achievementForm"/>">
			       </td>
			       <td><input readOnly="true" type='text'  name='achievementList[<s:property value="#index.index" />].achievementWords' value="<s:property value="achievementWords"/>"/>
			       <td><input type="text" readOnly="true" name='achievementList[<s:property value="#index.index" />].type' value="<s:property value="type.split(',')[0]"/>"></td>
			       <input type="hidden" name="achievementList[<s:property value="#index.index" />].id" value="<s:property value="id" />" />
			      </tr>
			      </s:if>
	    	 </s:iterator>
	     	 <tr style="height:20px"></tr>
		 </tbody>
		</table>
		 <!-- 新增现在的 -->
		<table class="table table-bordered table-borderSelf3 f-fl"
			style="width: 95%">
			<thead>
				<tr>
					<th colspan="6" style="text-align: center">实际成果</th>
				</tr>
				<tr>
					<td width="15%">成果类别</td>
					<td width="15%">完成时间</td>
					<td width="22%">成果名称</td>
					<td width="15%">成果形式</td>
					<td width="18%">预计字数(单位:千字)</td>
					<td>参加人</td>
				</tr>
				<s:iterator value="projection.achievementList" status="index">
		         <s:if test="type.equals('实际成果')">
		          <tr>
			       <td>
			           <input type="text" readOnly="true" name='achievementList[<s:property value="#index.index" />].achievementType' value="<s:property value="achievementType"/>">
			       </td>
			       <td><input type='text' readOnly="true" style="height:150%;width:100%" name='achievementList[<s:property value="#index.index" />].finishTime' value="<s:date name="finishTime" format="yyyy-MM-dd" />"/></td>
			       <td><input type='text' readOnly="true" style="height:150%;width:100%" name='achievementList[<s:property value="#index.index" />].title' value="<s:property value="title"/>"/></td>
			       <td>
			         <input type="text" readOnly="true" style="height:150%;width:100%" name='achievementList[<s:property value="#index.index" />].achievementForm' value="<s:property value="achievementForm"/>">
			       </td>
			       <td><input type='text' readOnly="true" style="height:150%;width:100%" name='achievementList[<s:property value="#index.index" />].achievementWords' value="<s:property value="achievementWords"/>"/></td>
			       <%-- <td><input type="text" readOnly="true" name='achievementList[<s:property value="#index.index" />].type' value="<s:property value="type"/>"></td> --%>
		           <td><input type="text" readOnly="true" style="height:150%" value="<s:property value="participation"/>"><a href="DeleteAchievementById?achievement.id=<s:property value='id' />&type=1&projection.id=${projection.id}&tag=1&pageType=2"><i class='icon-del'></i></a></td>
		           <input type="hidden" name="achievementList[<s:property value="#index.index" />].id" value="<s:property value="id" />" />
		         </s:if>
		        </s:iterator>
			</thead>
			<tbody>

			</tbody>
		</table>
		<a class="conrel f-fl f-disn plus" title="增加列" style="border:1px solid #ddd;border-right: 2px solid #ddd;border-bottom: 2px solid #ddd;width:4.9%;padding-bottom:1.3%"><i class="icon-add" style="margin-left:13px;margin-top:13px"></i></a>
		 </s:if>
		 
		 <s:if test="projection.projectionType==@com.projection.util.Constant@PROJECTIONTYPE2">
		 <!-- 显示原先的 -->
		<table class="table table-bordered table-borderSelf3 f-fl" style="width:100%">
		   	<thead>
		   	<tr><th colspan="6" style="text-align:center">预期成果</th></tr>
		     <tr>
		       <td width="18%">成果类别</td>
		       <td width="15%">完成时间</td>
		       <td width="22%">成果名称</td>
		       <td width="15%">成果形式</td>
		       <td width="17%">预计字数(单位:千字)</td>
		       <td>类型</td>
		     </tr>
		    </thead>
		    <tbody>
		      <s:iterator value="projection.achievementList" status="index">
		       <s:if test="type.equals('预期成果')">
			      <tr>
			       <td>
			           <input type="text" readOnly="true" value="<s:property value="achievementType"/>">
			       </td>
			       <td><input readOnly="true" type='text'  name='achievementList[<s:property value="#index.index" />].finishTime' readOnly='true' value="<s:date name="finishTime" format="yyyy-MM-dd" />"/></td>
			       <td><input readOnly="true" type='text'  name='achievementList[<s:property value="#index.index" />].title' value="<s:property value="title"/>"/></td>
			       <td>
			         <input type="text" readOnly="true" value="<s:property value="achievementForm"/>">
			       </td>
			       <td><input readOnly="true" type='text'  name='achievementList[<s:property value="#index.index" />].achievementWords' value="<s:property value="achievementWords"/>"/>
			       <td><input type="text" readOnly="true" name='achievementList[<s:property value="#index.index" />].type' value="<s:property value="type.split(',')[0]"/>"></td>
			       <input type="hidden" name="achievementList[<s:property value="#index.index" />].id" value="<s:property value="id" />" />
			      </tr>
			      </s:if>
	           </s:iterator>
	           <tr style="height:20px"></tr>
		   </tbody>
		</table>
		<table class="table table-bordered f-fl" style="width:95%">
		<tr><th colspan="6" style="text-align:center">实际成果</th></tr>
	     <tr>
	       <td width="15%">书名</td>
	       <td width="18%">出版社</td>
	       <td width="17%">出版费</td>
	       <td width="15%">ISBN</td>
	       <td width="15%">定价</td>
	       <td>印数</td>
	     </tr>
	     <!-- 新增现在的 -->
		<s:iterator value="projection.achievementList" status="index">
         <s:if test="type.equals('实际成果')">
          <tr>
	       <td><input type='text' name="achievementList[<s:property value="#index.index" />].bookName" value="<s:property value="bookName" />"></td>
	       <td><input type='text' name="achievementList[<s:property value="#index.index" />].publisher" value="<s:property value="publisher" />" ></td>
	       <td><input type='text' name="achievementList[<s:property value="#index.index" />].publishPrice" value="<s:property value="publishPrice" />" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>
	       <td><input type='text' name="achievementList[<s:property value="#index.index" />].ISBN"  value="<s:property value="ISBN" />" /></td>
	       <td><input type='text' name="achievementList[<s:property value="#index.index" />].price"  value="<s:property value="price" />" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>
	       <td><input type='text' name="achievementList[<s:property value="#index.index" />].count" value="<s:property value="count" />" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/>
	       <a href="DeleteAchievementById?achievement.id=<s:property value='id' />&projection.id=${projection.id}&type=1&tag=1&pageType=2"><i class='icon-del'></i></a>
	       </td>
	       <input type="hidden" name="achievementList[<s:property value="#index.index" />].id" value="<s:property value="id" />" />
         </tr>
         </s:if>
        </s:iterator>
	   </table>
	   <a class="con f-fl f-disn plus" title="增加列" le="border:1px solid #ddd;border-right: 2px solid #ddd;border-bottom: 2px solid #ddd;width:4.9%;padding-bottom:1.3%"><i class="icon-add" style="margin-left:13px;margin-top:13px"></i></a>
	   </s:if>
	 </div>
		<!-- 第四个内容 -->
		<div  class="tab-pane fade" id="tab4" >
		<table class="table table-bordered">
	    <thead>
	     <tr>
	       <td width="28%">附件标题</td>
	       <td width="8%">类型</td>
	       <td width="20%">状态</td>
	       <td width="22%">更新时间</td>
	       <td>操作</td>
	     </tr>
	    </thead>
	    <tbody>
	      <tr>
	       <td>
	          <s:if test="projection.isHaveConclusionFiles == 1">
	           <s:iterator value="projection.filesList" status="index">
	           <s:if test="fileType == 6"><input type="text" readOnly="true" style="text-align:center" placeholder="文件名称" value="<s:property value="fileName" />" /></s:if>
	          </s:iterator>
	         </s:if>
	         <s:else>
	          <input type="text" readOnly="true" style="text-align:center" placeholder="文件名称" />
	         </s:else>
	       </td>
	       <td>.pdf</td>
	       <td>
	          <span class="validate"><i class="Validform_right"></i>格式正确</span>
			  <span class="novalidate"><i class="Validform_wrong"></i>格式错误,限pdf格式</span>
			  <span class="novalidate"><i class="Validform_wrong"></i>大小不能超过3M</span>
	          <s:if test="projection.isHaveConclusionFiles == 1">
	          √
	          </s:if>
	          <s:else>
	           <span class="">未选择任何上传文件</span>
	          </s:else>
		   </td>
	       <td>
	          <s:if test="projection.isHaveConclusionFiles == 1">
	          <s:iterator value="projection.filesList" status="index">
	           <s:if test="fileType == 6"><input type='text' readOnly='true' style="text-align:center" value='<s:date name="updateTime" format="yyyy-MM-dd" />' /></s:if>
	          </s:iterator>
	          </s:if>
	          <s:else>
	           <input readOnly="true" type="text" style="text-align:center" class="timer" />
	          </s:else>
	       </td>
	       <td>
	         <div class="fileUpload btn btn-primary">
				<span>上传</span>
				<input id="" type="file" name="file" value="" class="upload uploadC" />
			 </div>
			 <s:if test="projection.isHaveConclusionFiles == 1">
	           <a class="btn btn-primary back" href="download?projection.id=${projection.id}&type=6" title="下载">下载文档</a>
	         </s:if>
	         <s:iterator value="projection.filesList" status="index">
			  <s:if test="fileType == 6"><a class="btn btn-primary del" onclick='deleteFile(<s:property value="id" />,2,2,<s:property value="projection.id" />)'>删除</a></s:if>
			 </s:iterator>
	       </td>
	     </tr>
	    </tbody>
	   </table>
		</div>
	</div>
</div>
</div>
<div id="dvMsgBox1" style="width: 165px; top: 120px; left: 308px;">
	<div class="title1">
		<div class="right1">
			<div id="dvMsgTitle1">提示</div>
		</div>
	</div>
	<div class="body1">
		<div class="right1">
			<div class="ct1" id="dvMsgCT1"><font class="font-tip1">请稍后…</font>
				<div class="clear1"></div>
			</div>
		</div>
	</div>
</div> 
<s:if test="projection.projectionType!=@com.projection.util.Constant@PROJECTIONTYPE2">
<input type="hidden" id="resultInput" name="resultInput" value="0"/>
</s:if>
<s:if test="projection.projectionType==@com.projection.util.Constant@PROJECTIONTYPE2">
<input type="hidden" id="resultInput" name="resultInput" value="2"/>
</s:if>
<s:if test="projection.achievementList.size() > 0">
<input type="hidden" id="oldresultSize" value="<s:property value="projection.achievementList.size()"/>"/>
</s:if>
<s:else>
<input type="hidden" id="oldresultSize" value="<s:property value="0"/>"/>
</s:else>
<input type="hidden" class="tab" name="tag" value="<s:property value="tag"/>">
<input type="hidden" class="isDownload" name="isDownload" value="<s:property value="isDownload"/>">
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<!-- 代码部分end -->
<script>
var timeStr = new Date().toLocaleString();
$(".timer").attr("value",timeStr);

$('.datetimepicker').datetimepicker({
	   language : 'fr',weekStart : 1,todayBtn : 1,autoclose : 1,
	   todayHighlight : 1,startView : 2,minView : 2,forceParse : 0
});
$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
	
	$(".registerform").Validform({
		tiptype:2
	});
})

var tag = ${tag};
$('#myTab li:eq('+parseInt(tag)+') a').tab('show');
function deleteFile(id,type,tag,pid){
	Showbo.Msg.confirm('是否删除该文件？',function(flag){
			if(flag=='yes'){
				location.href="DeleteFiles?files.id="+id+"&tag="+type+"&pageType="+tag+"&projection.id="+pid;		
			}				
	}); 
};
//判断显示是保存还是下载
var isDownload = ${isDownload};
var pid = ${projection.id};
if(isDownload == 1){
	location.href="download?projection.id="+pid+"&type=4";
}
//自适应高度
var jsq = 0;
$(".plus").click(function(){
	jsq++;
	if(jsq==1){
		height=height+360;
	}
	else if(jsq<=5){
		height=height+40;	
	}
	 IFrameResize();
})

$(".del").click(function(){
	height=height+320;
	 IFrameResize();
})

$(".jy1").click(function(){
	height=height+30;
	 IFrameResize();
	 height=height-30;
})

$(".submit1").click(function(){
	if(height<500)
		height=500;
	 IFrameResize();
})

var height =  $("#tab1").height()+153;
IFrameResize();
$($("#myTab li").click(function(){
	var aa=$(this).children().attr("href");
	 $("#myTabContent").height($(aa).height());
	 height = $("#myTabContent").height()+153;
	 IFrameResize();
}))
function IFrameResize(){ 
 //alert(this.document.body.scrollHeight); //弹出当前页面的高度 
var obj = parent.document.getElementById("iframe"); //取得父页面IFrame对象 
//alert(obj.height); //弹出父页面中IFrame中设置的高度 
//obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度 
obj.height = height; 
} 
</script>
</body>
</html>