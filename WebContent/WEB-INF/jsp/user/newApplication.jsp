<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建申报1</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body onselectstart="return false;" ng-app="" onload="IFrameResize()">
<form id="form" class="registerform" name="myForm" action="NewApplicationForm" method="post" enctype="multipart/form-data">
<input type="hidden" class="tempsave" name="tempsave" />
<div class="f-fl commonbtn">
   <a class="btn btn-primary showHelpDiv" style="width:80px;color:#fff">填表说明</a>
   <a class="btn btn-primary" onclick="backHelp(1)" style="width:60px;">返 回</a>
   <input type="submit" id="temp" class="btn btn-primary zc" value="暂 存"  style="width:60px;"/> 
   <input type="button" id="jy" class="btn btn-primary jy" style="width:60px;" value="保存">
   <s:if test="projection.isHaveDemonstrationFiles ==1 && projection.isHaveConditionAndSecurityFiles ==1">
   <%-- <a class="btn btn-primary down" title=""  href="download?projection.id=<s:property value="projection.id"/>&type=3">下载申报书</a> --%>
   <button class="btn btn-primary down" id="down" type="button" title="下载申报书">下载申报书</button>

   </s:if>

   <s:else>

   <input type="button" class="btn btn-primary down" title="" disabled="true" value="下载申报书"/>

   </s:else>

   <input type="button" id="save" class="btn btn-primary submit" title="" value="递 交" style="width:60px;"/>

   <%-- <span style="color:#f0ad4e;font-size:12px">先校验再提交</span> --%>

</div>

<br /><br /><br /> 

<div class="noValidate">

  您还有尚未完成的验证！

</div>

<div class="haveValidate">

 验证通过！

</div>

<ul id="myTab" class="nav nav-tabs">

  <li class="active"><a href="#tab1" data-toggle="tab">数据表</a></li>

  <li class=""><a href="#tab2" data-toggle="tab">课题论证</a></li>

  <li class=""><a href="#tab3" data-toggle="tab">研究条件和保障</a></li>

  <li class=""><a href="#tab4" data-toggle="tab">预期研究成果</a></li>

  <li class=""><a href="#tab5" data-toggle="tab">经费预算</a></li>

  <li class=""><a href="#tab6" data-toggle="tab">附件</a></li>

</ul>

<div id="myTabContent" class="tab-content" >

  <div class="tab-pane fade in active" id="tab1" >

    <!-- <h3>一、数据表</h3> -->

	<div class="newApplication">

	   <table class="table table-bordered">

	     <tr>

	       <td width="10%"><span><font class="mustToWrite"> * </font>课题名称</span></td>

	       <td colspan="8" style="text-align: left">

	          <input type="text" class="title" name="projection.title"  value="<s:property value="projection.title" />"/>

	          <span class="validate"><i class="Validform_wrong"></i>不能为空</span>

	       </td>

	     </tr>

	     <tr>

	       <td><span><font class="mustToWrite"> * </font>主题词</span></td>

	       <td colspan="8" style="text-align: left">

	         <input type="text" class="tag" name="projection.tag" placeholder="多个词语中间用 ; 分隔" value="<s:property value="projection.tag" />"/>

	         <span class="validate"><i class="Validform_wrong"></i>不能为空</span>

	       </td>

	     </tr>

	     <tr>

	       <td><span><font class="mustToWrite"> * </font>学科分类</span></td>

	       <td colspan="8" style="text-align: left;">

	         <select name="projection.type" class="type" style="width:80%">

	           <option <s:if test='projection.type.contains("请选择")'>selected='true'</s:if>>请选择</option>

	           <option <s:if test='projection.type.contains("马列、科社")'>selected='true'</s:if>>马列、科社</option>

	           <option <s:if test='projection.type.contains("哲学")'>selected='true'</s:if>>哲学</option>

	           <option <s:if test='projection.type.contains("政法")'>selected='true'</s:if>>政法</option>

	           <option <s:if test='projection.type.contains("理论经济")'>selected='true'</s:if>>理论经济</option>

	           <option <s:if test='projection.type.contains("应用经济")'>selected='true'</s:if>>应用经济</option>

	           <option <s:if test='projection.type.contains("管理学")'>selected='true'</s:if>>管理学</option>

	           <option <s:if test='projection.type.contains("社会学")'>selected='true'</s:if>>社会学</option>

	           <option <s:if test='projection.type.contains("历史学")'>selected='true'</s:if>>历史学</option>

	           <option <s:if test='projection.type.contains("文学")'>selected='true'</s:if>>文学</option>

	           <option <s:if test='projection.type.contains("新闻学")'>selected='true'</s:if> >新闻学</option>

	           <option <s:if test='projection.type.contains("语言学")'>selected='true'</s:if>>语言学</option>

	           <option <s:if test='projection.type.contains("教育学")'>selected='true'</s:if>>教育学</option>

	           <option <s:if test='projection.type.contains("文化学")'>selected='true'</s:if> >文化学</option>

	           <option <s:if test='projection.type.contains("其他")'>selected='true'</s:if>>其他</option>	        

	          </select>

	         <span class="validate"><i class="Validform_wrong"></i>不能为空</span>
	         <input name="ptype" class="inputPtype" value="<s:property value="projection.type.split(',')[1]" />" style="width:18%;display:none" type="text" placeholder="输入学科分类" />
	       </td>

	     </tr>

	     <tr class="noeditfont">

	       <td>负责人</td>

	        <input type="hidden" name="user.id" value="<s:property value="user.id" />" />

	       <td><input type="text" name="" value="<s:property value="user.username" />" readOnly="true"></td>

	       <td style="width:7%">性别</td>

	       <td><span><s:property value="user.sex" /></span></td>

	       <td style="width:7%">民族</td>

	       <td><span><s:property value="user.nation" /></span></td>

	       <td style="width:11%">出生日期</td>

	       <td colspan="2" width="9%"><span><s:date name="user.birthday" format="yyyy-MM-dd"/></span></td>

	     </tr>

	     <tr class="noeditfont">

	       <td>行政职务</td>

	       <td><span><s:property value="user.duty" /></span></td>

	       <td colspan="2" >专业职称</td>

	       <td colspan="2"><span><s:property value="user.positionLevel" /></span></td>

	       <td>研究专长</td>

	       <td colspan="2"><span><s:property value="user.specialSkill" /></span></td>

	     </tr>

	     <tr class="noeditfont">

	       <td>身份证号</td>

	       <td colspan="8"><span><s:property value="user.postCardNumber" /></span></td>

	     </tr>

	     <tr class="noeditfont">

	       <td>最后学历</td>

	       <td><span><s:property value="user.education" /></span></td>

	       <td colspan="2" >最后学位</td>

	       <td colspan="2"><span><s:property value="user.degree" /></span></td>

	       <td>担任导师</td>

	       <td colspan="2"><span><s:property value="user.isTutor" /></span></td>

	     </tr>

	     <tr class="noeditfont">

	       <td>工作单位</td>

	       <td colspan="8"><span><s:property value="user.unit" /></span></td>

	     </tr>

	     <tr class="noeditfont">

	       <td>通讯地址</td>

	       <td colspan="5"><span><s:property value="user.address" /></span></td>

	       <td>邮政编码</td>

	       <td colspan="2"><span><s:property value="user.postCode" /></span></td>

	     </tr>

	     <tr class="noeditfont">

	       <td>联系电话</td>

	       <td colspan="3">办：<span><s:property value="user.officephone" /></span></td>

	       <td colspan="4">宅：<span><s:property value="user.homephone" /></span></td>

	     </tr>

	     <tr class="noeditfont">

	       <td>手机</td>

	       <td colspan="3"><span><s:property value="user.telephone" /></span></td>

	       <td>Email</td>

	       <td colspan="3"><span><s:property value="user.email" /></span></td>

	     </tr>

	     <tr>

	       <td>预期成果</td>

	       <td colspan="4" style="text-align:left">

	         <select name="projection.resultForm" class="resultForm" style="width:50%">

	           <option <s:if test='projection.resultForm.contains("专著")'>selected='true'</s:if>>专著</option>

	           <option <s:if test='projection.resultForm.contains("译著")'>selected='true'</s:if>>译著</option>

	           <option <s:if test='projection.resultForm.contains("论文集")'>selected='true'</s:if>>论文集</option>

	           <option <s:if test='projection.resultForm.contains("研究报告")'>selected='true'</s:if>>研究报告</option>

	           <option <s:if test='projection.resultForm.contains("工具书")'>selected='true'</s:if>>工具书</option>

	           <option <s:if test='projection.resultForm.contains("其他")'>selected='true'</s:if>>其他</option>

	         </select>

	         <input class="inputResultForm" name="pResultForm"  type="text" style="display:none;width:35%"  value="<s:property value="projection.resultForm.split(',')[1]" />" placeholder="填入预期成果" />

	       </td>

	       <td>字数(单位：千字)</td>

	       <td colspan="3"><input style='width:100%' type="text" name="projection.resultWord" value="<s:property value="projection.resultWord" />"/></td>

	     </tr>

	     <tr>

	       <td colspan="2"><!-- <font class="mustToWrite"> * </font> -->申请经费(单位：万元)</td>

	       <td colspan="2" style="text-align: left">

	         <input style="width:56%;height:100%;border:0;margin-left:0"  name="projection.money" class="money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();" value="<s:property value="projection.money" />" />

	         <span class="validate"><i class="Validform_wrong"></i>格式错误</span>

	         <%-- <span>{{item0+item1+item2+item3+item4+item5+item6+item7+item8+item9+item10}}</span> --%>

	       </td>

	       <td colspan="2"><span><font class="mustToWrite"> * </font>预计完成时间</td>

	       <td colspan="2" style="text-align: left">

	         <input readOnly='true' style="width:59%;margin-left:0" type="text" name="projection.deadline" id="TxtProduredDate" data-date-format="yyyy-mm-dd" class="datetimepicker datetime" value="<s:date name="projection.deadline"  format="yyyy-MM-dd" />" value="0">

	         <span id="tip" class="validate"><i class="Validform_wrong"></i>不能为空</span>

	       </td>

	     </tr>

	     <tr>

	       <td colspan="8" style="font-size:20px;letter-spacing: 1em"><span style="letter-spacing:0;margin-right:5%" class='validate1'><i class='Validform_wrong'></i>以下信息全部不能为空</span>主要参与者<a class="addParticipation" title="增加参与者" ><i class="icon-add" ></i><span>增加参与者</span></a></td>

	     </tr>

	     <tr>

	       <td width="7%">姓名</td>

	       <td width="11%">出生年月</td>

	       <td width="11%">学历</td>

	       <td width="14%">研究专长</td>

	       <td width="11%">学位</td>

	       <td width="14%">专业职称/行政职务</td>

	       <td colspan="2">工作单位</td>

	     </tr>

	     <s:iterator value="projection.participationList" status="index">

	      <tr>

	       <td><input type="text" style='text-align:center;width:100%' class="username" name="participationList[<s:property value="#index.index" />].name" value="<s:property value="name" />" /></td>

	       <td><input type="text" style='text-align:center;width:100%' data-date-format="yyyy-mm-dd" class="datetimepickerbir" name="participationList[<s:property value="#index.index" />].birthday" value="<s:date name="birthday" format="yyyy-MM-dd"/>" readOnly="true"/></td>

	       <td><select style='text-align:center;width:100%' class="education" name="participationList[<s:property value="#index.index" />].education" style="width:95%">

	             <option <s:if test="education.equals('请选择')" >selected</s:if>>请选择</option>

	             <option <s:if test="education.equals('大学专科')" >selected</s:if>>大学专科</option>

	             <option <s:if test="education.equals('大学本科')" >selected</s:if>>大学本科</option>

	               <option <s:if test="education.equals('硕士研究生')" >selected</s:if>>硕士研究生</option>

	             <option <s:if test="education.equals('博士研究生')" >selected</s:if>>博士研究生</option>

	           </select>

	       </td>

	       <td><input type="text" style='text-align:center;width:100%' class="specialSkill" name="participationList[<s:property value="#index.index" />].specialSkill" value="<s:property value="specialSkill" />" /></td>

	       <td>

	           <select style='text-align:center;width:100%' class="degree" name="participationList[<s:property value="#index.index" />].degree" value="<s:property value="degree" />" style="width:95%">

	              <option <s:if test="degree.equals('请选择')" >selected</s:if>>请选择</option>

	              <option <s:if test="degree.equals('学士')" >selected</s:if>>学士</option>

	              <option <s:if test="degree.equals('硕士')" >selected</s:if>>硕士</option>              

	              <option <s:if test="degree.equals('博士')" >selected</s:if>>博士</option>

	              <option <s:if test="degree.equals('博士后')" >selected</s:if>>博士后</option>

	           </select>

	       </td>

	       <td><input style='text-align:center;width:100%' class="positionLevel" type="text" name="participationList[<s:property value="#index.index" />].positionLevel" value="<s:property value="positionLevel" />" /></td>

	       <td><input style='text-align:center;' class="duty" type="text" name="participationList[<s:property value="#index.index" />].unit" value="<s:property value="unit" />" /><a href="javascript:void(0);" onclick='deletePar(<s:property value="id" />,0,1)' title='删除'><i class='deleteProfessor'></i></a></td>

	       <input type="hidden" name="participationList[<s:property value="#index.index" />].id" value="<s:property value="id" />" />

	      </tr>

	     </s:iterator>

		 

	   </table>

	</div>

  </div>

  <div class="tab-pane fade" id="tab2">

    <!-- <h3>二、课题论证</h3> -->

	<div class="newApplication" style="height:400px">

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

	          <s:if test="projection.isHaveDemonstrationFiles == 1">

	           <s:iterator value="projection.filesList" status="index">

	           <s:if test="fileType == 1"><input style="width:100%" type="text" readOnly="true" placeholder="文件名称" value="<s:property value="fileName" />" /></s:if>

	          </s:iterator>

	         </s:if>

	         <s:else>

	          <input type="text" readOnly="true" value="" placeholder="文件名称" />

	         </s:else>

	       </td>

	       <td>.pdf</td>

	       <td>

	          <span class="validate"><i class="Validform_right"></i>格式正确</span>

			  <span class="novalidate"><i class="Validform_wrong"></i>限pdf格式</span>

			  <span class="novalidate"><i class="Validform_wrong"></i>大小不能超过3M</span>

	          <%-- <s:iterator value="projection.filesList" status="index">

	           <s:if test="fileType == 1"><span>√</span></s:if>

	          </s:iterator> --%>

	          <s:if test="projection.isHaveDemonstrationFiles == 1">

	          √

	          </s:if>

	          <s:else>

	           <span class="">未选择任何上传文件</span>

	          </s:else>

		   </td>

	       <td>

	          <s:if test="projection.isHaveDemonstrationFiles == 1">

	          <s:iterator value="projection.filesList" status="index">

	           <s:if test="fileType == 1"><input type='text' readOnly='true' value='<s:date name="updateTime" format="yyyy-MM-dd" />' /></s:if>

	          </s:iterator>

	          </s:if>

	          <s:else>

	           <input type="text" class="timer" readOnly="true" value=""/>

	          </s:else>

	       </td>

	       <!-- <td><input type="text" name="fileoneReamrk"></td> --> 

	       <td>

	         <div class="fileUpload btn btn-primary fileUpload2">

				<span>上传</span>

				<input id="" type="file" name="fileone" class="upload uploadone" />

			 </div>

			 <s:iterator value="projection.filesList" status="index">

			  <s:if test="fileType == 1"><a class="btn btn-primary back" onclick='deleteFile(<s:property value="id" />,1,1,<s:property value="projection.id" />)' >删除</a></s:if>

			 </s:iterator>

			 

			 <s:if test="projection.isHaveDemonstrationFiles == 1">

	           <a class="btn btn-primary back" href="download?projection.id=${projection.id}&type=1" title="下载">下载文档</a>

	         </s:if>

	         <s:else>

	          <a class="btn btn-primary back" href="demonstration" title="下载模板">下载模板</a>

	         </s:else>

	       </td>

	     </tr>

	    </tbody>

	   </table>

	</div>

  </div>

  <div class="tab-pane fade" id="tab3">

    <!-- <h3>三、完成项目研究的条件和保障</h3> -->

	<div class="newApplication" style="height:400px">

	   <table class="table table-bordered table-borderSelf3 f-fl">

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

	         <s:if test="projection.isHaveConditionAndSecurityFiles == 1">

	            <s:iterator value="projection.filesList" status="index">

	             <s:if test="fileType == 2"><input style="width:100%" type="text" readOnly="true" placeholder="文件名称" value="<s:property value="fileName" />" /></s:if>

	            </s:iterator>

	          </s:if>

	          <s:else>

	          <input type="text" readOnly="true" value="" placeholder="文件名称" />

	         </s:else>

	       </td>

	       <td>.pdf</td>

	       <td>

	          <span class="validate"><i class="Validform_right"></i>格式正确</span>

			  <span class="novalidate"><i class="Validform_wrong"></i>限pdf格式</span>

			  <span class="novalidate"><i class="Validform_wrong"></i>大小不能超过3M</span>

			  

	          <s:if test="projection.isHaveConditionAndSecurityFiles == 1">

	          √

	          </s:if>

	          <s:else>

	           <span class="">未选择任何上传文件</span>

	          </s:else>

	       </td>

	       <td>

	        <s:if test="projection.isHaveConditionAndSecurityFiles == 1">

	          <s:iterator value="projection.filesList" status="index">

	           <s:if test="fileType == 2"><input type='text' readOnly='true' value='<s:date name="updateTime" format="yyyy-MM-dd" />' /></s:if>

	          </s:iterator>

	        </s:if>

	        <s:else>

	          <input type="text" class="timer" readOnly="true"/>

	        </s:else>

	       </td>

	       <td>

	         <div class="fileUpload btn btn-primary fileUpload3">

				<span>上传</span>

				<input id=""  type="file"  name="file" class="upload uploadtwo" />

			 </div>

			<s:iterator value="projection.filesList" status="index">

			  <s:if test="fileType == 2"><a class="btn btn-primary" onclick='deleteFile(<s:property value="id" />,2,1,<s:property value="projection.id" />)'>删除</a></s:if>

			</s:iterator>

			<s:if test="projection.isHaveConditionAndSecurityFiles == 1">

	          <a class="btn btn-primary back" href="download?projection.id=${projection.id}&type=2" title="下载">下载文档</a>

	         </s:if>

	         <s:else>

	          <a class="btn btn-primary back" href="conditionAndSecurity" title="下载模板">下载模板</a>

	         </s:else>

	       </td>

	     </tr>

	    </tbody>

	   </table>

	</div>

  </div>

  <div class="tab-pane fade" id="tab4">

    <!-- <h3>四、预期研究成果</h3> -->

	<div class="newApplication" style="height:500px;">

	<div class="validate2">

	<br />

	<center><span ><i class="Validform_wrong"></i>以下信息全部不能为空</span></center>

	<br />

	</div>

	   <table class="table table-bordered f-fl" style="width:96%;">

	     <tr>

	       <td width="16%">成果类别</td>

	       <td width="13%">完成时间</td>

	       <td width="22%">成果名称</td>

	       <td width="16%">成果形式</td>

	       <td width="17%">预计字数(单位：千字)</td>

	       <td>参加人</td>

	     </tr>

	     <s:iterator value="projection.achievementList" status="index">

	      <tr>

	       <td>

	           <select style='width:95%;text-align:center;width:100%' name='achievementList[<s:property value="#index.index" />].achievementType'>

	             <option <s:if test="achievementType.equals('阶段性研究成果')" >selected</s:if>>阶段性研究成果</option>

	             <option <s:if test="achievementType.equals('最终研究成果')" >selected</s:if>>最终研究成果</option>

	           </select>

	       </td>

	       <td><input type='text' style='text-align:center;width:100%' name='achievementList[<s:property value="#index.index" />].finishTime' data-date-format="yyyy-mm-dd" class="datetimepickerfis" readOnly='true' value="<s:date name="finishTime" format="yyyy-MM-dd" />"/></td>

	       <td><input type='text' style='text-align:center;width:100%' name='achievementList[<s:property value="#index.index" />].title' value="<s:property value="title"/>"/></td>

	       <%-- <td><input type='text'  name='achievementList[<s:property value="#index.index" />].achievementForm' value="<s:property value="achievementForm"/>"/></td> --%>

	       <td>

	         <%-- <select style='text-align:center;width:100%' name='achievementList[<s:property value="#index.index" />].achievementForm' style="width:100%">

	            <option <s:if test="achievementForm.equals('请选择')" >selected</s:if>>请选择</option>

	            <option <s:if test="achievementForm.equals('专著')" >selected</s:if>>专著</option>

	            <option <s:if test="achievementForm.equals('译著')" >selected</s:if>>译著</option>

	            <option <s:if test="achievementForm.equals('论文集')" >selected</s:if>>论文集</option>

	            <option <s:if test="achievementForm.equals('研究报告')" >selected</s:if>>研究报告</option>

	            <option <s:if test="achievementForm.equals('工具书')" >selected</s:if>>工具书</option>

	            <option <s:if test="achievementForm.equals('其他')" >selected</s:if>>其他</option>

	         </select> --%>

	         <input type="text" name='achievementList[<s:property value="#index.index" />].achievementForm' value="<s:property value="achievementForm" />" />

	       </td>

	       <td><input type='text' style="text-align:center;" name='achievementList[<s:property value="#index.index" />].achievementWords' value="<s:property value="achievementWords"/>" /></td>

	       <td><input type='text' style="text-align:center;" name='achievementList[<s:property value="#index.index" />].participation' value="<s:property value="participation"/>" />

	       <a class="del1"onclick='deleteResults(<s:property value="id"/>,3,1)' ><i class='deleteProfessor'></i></a><%-- <a onclick="editDel(<s:property value='id' />)" >删除</a> --%></td>

	      <input type="hidden" name="achievementList[<s:property value="#index.index" />].id" value="<s:property value="id" />" />

	      </tr>

	     </s:iterator>

	   </table>

	   <a class="addCols f-fl f-disn" title="增加列" style="border: 1px solid #ddd;padding-bottom: 2.2%;width: 4%;"><i class="icon-add" style="padding-left:2px"></i></a>

  </div>

  </div>

  <div class="tab-pane fade" id="tab5">

    <!-- <h3>五、经费预算</h3> -->

	<div class="newApplication" >

	   <table class="table table-bordered budget">

	     <tr>

	       <td width="15%">序号</td>

	       <td width="13%">经费开支科目</td>

	       <td width="12%">金额(单位：元)</td>

	       <td width="">计费依据</td>

	     </tr>

	     <s:if test="projection.budgetList.size() > 0">

	       <s:iterator value="projection.budgetList" status="index" >

	         <!--  如果是资助课题 -->

		    <%--  <s:if test="projection.projectionType == 12">

		     <tr class="noeditfont">

		       <td><s:property value="#index.index+1"/></td>

		       <td><input <s:if test='subject.equals("预计总额")'> style='color:#333 !important'</s:if> readOnly='true' placeholder="年度经费预算"  name='budgetList[<s:property value="#index.index" />].subject' value="<s:property value='subject'/>" /></td>

		       <td><input <s:if test='subject.equals("预计总额")'>style='color:#333' </s:if><s:else> readOnly='true'</s:else>name='budgetList[<s:property value="#index.index" />].money' value="<s:property value="money"/>" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

		       <td><input <s:if test='subject.equals("预计总额")'> style='color:#333;width:100%'</s:if><s:else>style='width:100%' readOnly='true'</s:else> name='budgetList[<s:property value="#index.index" />].remark' value="<s:property value="remark"/>" /></td>

		       <input type="hidden" name="budgetList[<s:property value="#index.index" />].id" value="<s:property value="id" />" />

		     </tr>

		     </s:if> --%>

		     <!--  如果是其他课题 -->

		     <tr>

		       <s:if test="#index.index > 10">

		        <s:if test="#index.index == 11 || #index.index == 16">

		         <td colspan="2"><input class="changered" name='budgetList[<s:property value="#index.index" />].subject' placeholder="合计（单位：万元）" readOnly='true' value="<s:property value='subject'/>" /></td>

		        </s:if>

		        <s:else>

		         <td>年度经费预算</td>

		         <td><input name='budgetList[<s:property value="#index.index" />].subject' class="datetimepickerYear"  placeholder="点击选择。例如：2015" readOnly='true' value="<s:property value='subject'/>" /></td>

		        </s:else>

		       </s:if>

		       <s:else>

		        <td><s:property value="#index.index+1"/></td>

		        <td><input name='budgetList[<s:property value="#index.index" />].subject' readOnly='true' value="<s:property value='subject'/>" /></td>

		       </s:else>

		       <td><input type="text" class="budgetNumber" name='budgetList[<s:property value="#index.index" />].money' onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();" value="<s:property value="money"/>"/></td>

		       <td><input name='budgetList[<s:property value="#index.index" />].remark' value="<s:property value="remark"/>" style="width:100%"/></td>

		       <input type="hidden" name="budgetList[<s:property value="#index.index" />].id" value="<s:property value="id" />" />

		     </tr>

		     </s:iterator>

	     </s:if>

	     <s:else> 

	     <tr class="changeGray">

	       <td>1</td>

	       <td><input name="budgetList[0].subject" value="资料费" readOnly="true" /></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber" name="budgetList[0].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();" /></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[0].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>2</td>

	       <td><input name="budgetList[2].subject" value="数据采集费" readOnly="true"/></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"name="budgetList[2].money" /></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[2].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>3</td>

	       <td><input name="budgetList[4].subject" value="差旅费" readOnly="true"/></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber" name="budgetList[4].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[4].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>4</td>

	       <td><input name="budgetList[6].subject" value="会议费" readOnly="true"/></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber"  name="budgetList[6].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[6].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>5</td>

	       <td><input name="budgetList[8].subject" value="国际合作与交流费" readOnly="true"/></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber" name="budgetList[8].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[8].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>6</td>

	       <td><input name="budgetList[9].subject" value="其他费" readOnly="true"/></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber"  name="budgetList[9].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[9].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>7</td>

	       <td><input name="budgetList[1].subject" value="专家咨询费" readOnly="true"/></td> 

	       <td style="text-align:left;"><input type="text" class="budgetNumber" name="budgetList[1].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[1].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>8</td>

	       <td><input name="budgetList[3].subject" value="劳务费" readOnly="true"/></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber"  name="budgetList[3].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[3].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>9</td>

	       <td><input name="budgetList[5].subject" value="印刷费" readOnly="true"/></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber" name="budgetList[5].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[5].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>10</td>

	       <td><input name="budgetList[7].subject" value="管理费" readOnly="true"/></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber"  name="budgetList[7].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[7].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>11</td>

	       <td><input name="budgetList[10].subject" value="设备费" readOnly="true"/></td>

	       <td style="text-align:left;"><input type="text" class="budgetNumber"  name="budgetList[10].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[10].remark" id="" ></textarea></td>

	     </tr>

	     <tr>

	       <td colspan="2" ><input class="total changered" readOnly="true" name="budgetList[11].subject" value="合计（单位：元）"/></td>

	       <td style="text-align:left;"><input style="width:99%" class="budgetNumber" type="text" value="" name="budgetList[11].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[11].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td width="15%">年度经费预算</td>

	       <td width="28.8%"><input type="text" name="budgetList[12].subject" class="datetimepickerYear" placeholder="点击选择。例如：2015" readOnly='true'>年</td>

	       <td width="30%"><input type="text" class="budgetNumber"  name="budgetList[12].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[12].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>年度经费预算</td>

	       <td><input type="text" name="budgetList[13].subject" class="datetimepickerYear"  placeholder="点击选择。例如：2015" readOnly='true'>年</td>

	       <td><input type="text" class="budgetNumber"  name="budgetList[13].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[13].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>年度经费预算</td>

	       <td><input type="text" name="budgetList[14].subject" class="datetimepickerYear"  placeholder="点击选择。例如：2015" readOnly='true'>年</td>

	       <td><input type="text" class="budgetNumber" name="budgetList[14].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[14].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td>年度经费预算</td>

	       <td><input type="text" name="budgetList[15].subject" class="datetimepickerYear"  placeholder="点击选择。例如：2015" readOnly='true'>年</td>

	       <td><input type="text" class="budgetNumber"  name="budgetList[15].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[15].remark" id="" ></textarea></td>

	     </tr>

	     <tr class="changeGray">

	       <td colspan="2" ><input class="totalYear changered"  readOnly="true" name="budgetList[16].subject" value="年度合计（单位：元）"/></td>

	       <td style="text-align:left;"><input style="width:99%" class="budgetNumber" type="text" value="" name="budgetList[16].money" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,'');}).call(this)" onblur="this.v();"/></td>

	       <td style="text-align:left"><textarea style="width:100%" name="budgetList[16].remark" id="" ></textarea></td>

	     </tr>

	    </s:else>

	   </table>

	</div>

  </div>

  <div class="tab-pane fade newApplication" id="tab6" >

    <table class="table table-bordered table-borderSelf3 f-fl">

	   	<thead>

	     <tr>

	       <td width="38%">附件标题</td>

	       <td width="11%">类型</td>

	       <td width="12%">状态</td>

	       <td width="16%">更新时间</td>

	       <td width="8%">操作 </td>

	     </tr>

	    </thead>

	    <tbody>

	        <s:iterator value="projection.filesList" status="index">

	          <s:if test="fileType == 7">

	          <tr>

				<td><input type='text'  placeholder='文件名称' class='fileName' readOnly="true" value="<s:property value="fileName" />"/></td>

				<td><input type='text' style="width:100%" readonly='true' value='.pdf,.doc,.docx' /></td>

				<td>√</td>

				<td><input style="width:100%" type='text' readOnly='true' value='<s:date name="updateTime" format="yyyy-MM-dd" />' />

				<td>

				  <a class="btn btn-primary back" href="downloadByFiles?files.id=<s:property value="id"/>" />下载</a>

				  <a class="btn btn-primary back tab6_del" onclick='deleteFile(<s:property value="id"/>,5,1,<s:property value="projection.id" />)' >删除</a>

				</td>

			</tr>

			</s:if>

	        </s:iterator>

			<tr>

				<td><input type='text' placeholder='文件名称' class='fileName' style='color:#fff' value="<s:property value="projection.filesList.size()" />"/></td>

				<td><input type='text' style="width:100%" readonly='true' value='.pdf,.doc,.docx' /></td>

				<td>

				   <span class="validate"><i class="Validform_right"></i>格式正确</span>

			       <span class="novalidate"><i class="Validform_wrong"></i>格式有误</span>

			       <span class="novalidate"><i class="Validform_wrong"></i>大小不能超过3M</span>

			       <span>未选择任何上传文件</span>

			    </td>

				<td><input type='text' style="width:100%" readOnly='true' value='' class='timer' /></td>

				<td>

				    <div class='fileUpload btn btn-primary back fileUpload6'>

						<span>上传</span><input type='file' name='otherFile' class='upload upload1'>

					</div>

				</td>

			</tr>

	   </tbody>

	   </table> 

  </div>

</div>

<input type="hidden" class="projectionType" name="projection.projectionType" value="<s:property value="projection.projectionType" />" />

<input type="hidden" class="" name="projection.id" value="<s:property value="projection.id" />" />

<s:if test="projection.participationList.size() > 0">

<input type="hidden" id="oldparSize" value="<s:property value="projection.participationList.size()"/>"/>

</s:if>

<s:else>

<input type="hidden" id="oldparSize" value="<s:property value="0"/>"/>

</s:else>

<s:if test="projection.achievementList.size() > 0">

<input type="hidden" id="oldresultSize" value="<s:property value="projection.achievementList.size()"/>"/>

</s:if>

<s:else>

<input type="hidden" id="oldresultSize" value="<s:property value="0"/>"/>

</s:else>

<s:if test="projection.filesList.size() > 0">

<input type="hidden" id="oldfileSize" value="<s:property value="projection.filesList.size()"/>"/>

</s:if>

<s:else>

<input type="hidden" id="oldfileSize" value="<s:property value="0"/>"/>

</s:else>

<input type="hidden" class="tab" name="tag" value="<s:property value="tag"/>">

<input type="hidden" class="isDownload" name="isDownload" value="<s:property value="isDownload"/>">

<!-- <input type="hidden" id="oldSize" value="0" />

<input type="hidden" id="participationInput" name="participationInput" value="0"/>

<input type="hidden" id="resultInput" name="resultInput" value="0"/>

<input type="hidden" id="oldparSize" value="0"/>

<input type="hidden" id="filesCount" name="filesCount" value="0"> -->

</form>

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

<div class="fillFormHelp" style="display:none;position: fixed;top: 4%;width:75%">

	<p>1．封面上“学科分类”、“成果形式”等栏目的填写应与数据表选择的内容一致。</p>

	<p>2．数据表中“学科分类”以及“预期成果形式”等栏目的填写，请直接在选中的分类编号上打√</p>

	<p>3. 本表提到的杭州西湖博物馆特指杭州西湖博物馆（西湖学研究院）。</p>

	<p>4. 申报人必须严格按照公告要求提交申报书和有关材料。</p>

	<p>5. 申报表一式3份，A4纸打印，左侧装订。</p>

</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap-datetimepicker.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/validate.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/angular.min.js"></script> 

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>


<script> 

var timeStr = new Date().toLocaleString();

$(".timer").attr("value",timeStr);

$(".showHelpDiv").mouseover(function(){

	$(".fillFormHelp").fadeIn("6000")

})

$(".showHelpDiv").mouseleave(function(){

	$(".fillFormHelp").fadeOut("6000")

})

 $('.datetimepickerbir,.datetimepickerfis').datetimepicker({

	   language : 'fr',weekStart : 1,todayBtn : 1,autoclose : 1,

	   todayHighlight : 1,startView : 2,minView : 2,forceParse : 0,

	   pickerPosition: 'top-right'

});

$('.datetime').datetimepicker({

	 language : 'fr',weekStart : 1,todayBtn : 1,autoclose : 1,

	 todayHighlight : 1,startView : 2,minView : 2,forceParse : 0,

	 pickerPosition: 'top-right'

}); 

$('.datetimepickerYear').datetimepicker({

	   language : 'fr',

	   format: 'yyyy',  

     weekStart: 1,  

     autoclose: true,  

     startView: 4,  

     minView: 4,  

     forceParse: false, 

     pickerPosition: "top-left"

});

//上传文件

function getFileName1(e){

	$(e).parent().parent().prev().prev().prev().prev().children(":eq(0)").attr("value",e.value.split('\\')[2])

  }

//上传文件

//已暂存提示框 


function toDown(){

	window.location.href="download?projection.id="+pid+"&type=3"

}


//判断显示哪一个tab框

var tag = ${tag};

if(tag==null){

	tag =0;

};


$('#myTab li:eq('+parseInt(tag)+') a').tab('show');

//下载申报书

//删除的提示框

function deleteFile(id,type,tag,pid){

	Showbo.Msg.confirm('是否删除该文件？',function(flag){

			if(flag=='yes'){

				location.href="DeleteFiles?files.id="+id+"&tag="+type+"&pageType="+tag+"&projection.id="+pid;		

			}				

	}); 

};

function deletePar(id,type,tag){

	Showbo.Msg.confirm('是否删除该条参与者记录？',function(flag){

			if(flag=='yes'){

				location.href="DeletePar?participation.id="+id+"&tag="+type+"&pageType="+tag;		

			}				

	}); 

};

function deleteResults(id,type,tag){

	Showbo.Msg.confirm('是否删除该成果记录？',function(flag){

			if(flag=='yes'){

				location.href="DeleteAchievementById?achievement.id="+id+"&type=1"+"&tag="+type+"&pageType="+tag;		

			}				

	}); 

};

$('#TxtProduredDate').blur(function (){

	 $("#TxtProduredDate").change(function(){

		    $("#tip").css("display","none");

		    $(".noValidate").css("display","none");

		  });

})

var height =  $("#tab1").height()+153;

$($("#myTab li").click(function(){

	var aa=$(this).children().attr("href");

	 $("#myTabContent").height($(aa).height());

	 height = $("#myTabContent").height()+153;

	 IFrameResize();

}))

var jsq = 0;

$(".addParticipation").click(function(){

	jsq++;

	if(jsq<=7){

		height=height+40;

		 IFrameResize();

	}

})


/* $(".zc").click(function(){

	 height=height+153;

	 IFrameResize();

}) */


$(".jy").click(function(){

	height=height+150;

	 IFrameResize();

	 height=height-150;

})


/* $(".del1").click(function(){

	height=height-40;

	 IFrameResize();

	 jsq--;

}) */

 $(".fileUpload3").click(function(){

	height=height+50;

	 IFrameResize();

}) 


$(".fileUpload6").click(function(){

	if(parseInt($("#oldfileSize").val())+1>=8){
	
		height=500+(parseInt($("#oldfileSize").val())+1)*40;

	}

	 IFrameResize();

})

$(".tab6_del").click(function(){
	if(height<500)
		height=500;
	 IFrameResize();
})


function IFrameResize(){ 

 //alert(this.document.body.scrollHeight); //弹出当前页面的高度 

var obj = parent.document.getElementById("iframe"); //取得父页面IFrame对象 

//alert(obj.height); //弹出父页面中IFrame中设置的高度 

//obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度 

obj.height = height; 

} 

//判断显示是保存还是下载

</script>

<s:if test="projection != null">

<script>

var isDownload = ${isDownload};
var pid = ${projection.id};
if(isDownload == 1){

	location.href="download?projection.id="+pid+"&type=3";

}
//学科分类读出是其他的时候，可以编辑
var ptype = "${projection.type}".split(",")[0];
if(ptype.split(",")[0] == "其他"){
	$(".inputPtype").css("display","");
}

//预期成果读出是其他的时候，可以编辑
var pForm = "${projection.resultForm}".split(",")[0];
if(pForm.split(",")[0] == "其他"){
	$(".inputResultForm").css("display","");
}
</script>

</s:if>

</body>

</html>