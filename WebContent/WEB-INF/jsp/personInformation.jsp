<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息修改</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body>
  <form class="newApplication registerform" action="SuccessModifyImfo" method="post" >
	   <table  style="margin:0 auto;min-width:600px;" >
	   <tr><th colspan="4" style="font-size:16px; ">个人信息修改</th></tr>
	     <tr>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>真实姓名：</td>
	       <td width="36%"><input class="form-control f-ib" style="width:65%" value="<s:property value="user.username" />"  name="user.username" readonly  />
	       <input type="hidden" name="user.id" value="<s:property value="user.id" />"/>
	       </td>
	      <td style="width:12%;" align="right"><font class="mustToWrite"> * </font>出生日期：</td>
	       <td width="36%"><input style="width:65%" plugin='datepicker' id="TxtProduredDate" name="user.birthday" value="<s:date name="user.birthday" format="yyyy-MM-dd"/>" data-date-format="yyyy-mm-dd" class="datetimepicker form-control f-ib" readonly="readonly" ><span id="tip" class="Validform_checktip"></span></td>
           </tr>
	       <tr>
	       <td width="12%"  align="right">性别：</td>
	       <td width="36%">
	       <select name="user.sex" style="width:65%;border:1px solid #ccc;" class="form-control f-ib" >
             <option value=""  <s:if test="user.sex.equals('')">selected</s:if>>--请选择性别--</option>
             <option value="男"  <s:if test='user.sex.equals("男")'>selected</s:if>>男</option>
             <option value="女"  <s:if test='user.sex.equals("女")'>selected</s:if>>女</option>
           </select></td>
	       <td style="width:12%;" align="right">民族：</td>
	       <td width="36%"><select name="user.nation" class="form-control f-ib nation" style="width:65%;border:1px solid #ccc;">
             <option value=""  <s:if test="user.nation.equals('')">selected</s:if>>--请选择民族--</option>
             <option value="汉族"  <s:if test="user.nation.equals('汉族')">selected</s:if>>汉族</option>
             <option value="满族"  <s:if test="user.nation.equals('满族')">selected</s:if>>满族</option>
             <option value="回族"  <s:if test="user.nation.equals('回族')">selected</s:if>>回族</option>
             <option value="藏族"  <s:if test="user.nation.equals('藏族')">selected</s:if>>藏族</option>
             <option value="苗族"  <s:if test="user.nation.equals('苗族')">selected</s:if>>苗族</option>
             <option value="维吾尔族"  <s:if test="user.nation.equals('维吾尔族')">selected</s:if>>维吾尔族</option>
             <option value="其他"  <s:if test="!user.nation.equals('汉族')&&!user.nation.equals('满族')&&!user.nation.equals('回族')&&!user.nation.equals('藏族')&&!user.nation.equals('苗族')&&!user.nation.equals('维吾尔族')||user.nation.equals('其他')">selected</s:if>>其他</option>
           </select>
           <input name="nation"   value="<s:property value="user.nation" />"  class="form-control f-ib nation1" type="text" style="display:none;placeholder:'请填写';width:38%; border:1px solid #ccc;"/>
           </td>
	       
	     </tr>
	     <tr>
	       <td width="100" align="right">行政职务：</td>
	       <td width="36%"><input class="form-control f-ib" style="width:65%"  value="<s:property value="user.duty" />"  name="user.duty" ></td>
	       <td width="12%" align="right">担任导师：</td>
	       <td>
	         <select name="user.isTutor" style="width:65%;border:1px solid #ccc;" class="form-control f-ib">
	           <option value="是"  <s:if test='user.isTutor.equals("是")'>selected</s:if>>是</option>
	           <option value="否"  <s:if test='user.isTutor.equals("否")'>selected</s:if>>否</option>
	         </select></td>
	       </tr>
	       <tr>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>专业职称：</td>
	       <td>
	       <select name="user.positionLevel" style="width:65%;border:1px solid #ccc;" class="form-control f-ib positionLevel" datatype="*">
	          <option value="" <s:if test="user.positionLevel.equals('')">selected</s:if>>--请选择职称--</option>
	          <option value="教授" <s:if test="user.positionLevel.equals('教授')">selected</s:if>>教授</option>
	           <option value="副教授" <s:if test="user.positionLevel.equals('副教授')">selected</s:if>>副教授</option>
	           <option value="讲师" <s:if test="user.positionLevel.equals('讲师')">selected</s:if> >讲师</option>
	           <option value="工程师" <s:if test="user.positionLevel.equals('工程师')">selected</s:if> >工程师</option>
	           <option value="研究员" <s:if test="user.positionLevel.equals('研究员')">selected</s:if>>研究员</option>
	           <option value="" <s:if test="!user.positionLevel.equals('教授')&&!user.positionLevel.equals('副教授')&&!user.positionLevel.equals('讲师')&&!user.positionLevel.equals('工程师')&&!user.positionLevel.equals('研究员')&&!user.positionLevel.equals('')">selected</s:if>>其他</option>
	         </select>
	            <input name="positionLevel"   value="<s:property value="user.positionLevel" />" class="form-control f-ib positionLevel1" type="text" style="display:none;placeholder:'请填写';width:38%; border:1px solid #ccc;"datatype="*"/><span class="Validform_checktip"></span>
	       </td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>研究专长：</td>
	       <td width="36%">
	         <select name="user.specialSkill" style="width:65%;border:1px solid #ccc;" class="form-control f-ib specialSkill" datatype="*">
	           <option value="" <s:if test="user.specialSkill.equals('')">selected</s:if>>--请选择研究专长--</option>
	           <option value="经济学类研究" <s:if test="user.specialSkill.equals('经济学类研究')">selected</s:if>>经济学类研究</option>
	           <option value="心理学研究" <s:if test="user.specialSkill.equals('心理学研究')">selected</s:if>>心理学研究</option>
	           <option value="教育管理" <s:if test="user.specialSkill.equals('教育管理')">selected</s:if>>教育管理</option>
	           <option value="考古学研究" <s:if test="user.specialSkill.equals('考古学研究')">selected</s:if>>考古学研究</option>
	           <option value="数字媒体传播研究" <s:if test="user.specialSkill.equals('数字媒体传播研究')">selected</s:if>>数字媒体传播研究</option>
	           <option value="" <s:if test="!user.specialSkill.equals('经济学类研究')&&!user.specialSkill.equals('心理学研究')&&!user.specialSkill.equals('教育管理')&&!user.specialSkill.equals('考古学研究')&&!user.specialSkill.equals('数字媒体传播研究')&&!user.specialSkill.equals('')">selected</s:if>>其他</option>
	         </select>
			<input name="specialSkill"   value="<s:property value="user.specialSkill" />" class="form-control f-ib specialSkill1" type="text" style="display:none;placeholder:'请填写';width:38%; border:1px solid #ccc;"datatype="*"/><span class="Validform_checktip"></span>
	     </tr>
	     <tr>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>最后学历：</td>
	       <td width="36%">
	         <select name="user.education" style="width:65%;border:1px solid #ccc;" class="form-control f-ib" datatype="*">
	           <option value=""  <s:if test="user.education.equals('')">selected</s:if>>--请选择学历--</option>
	           <option value="大学专科"  <s:if test="user.education.equals('大学专科')">selected</s:if>>大学专科</option>
	           <option value="大学本科"  <s:if test="user.education.equals('大学本科')">selected</s:if>>大学本科</option>
	           <option value="硕士研究生"  <s:if test="user.education.equals('硕士研究生')">selected</s:if>>硕士研究生</option>
	           <option value="博士研究生"  <s:if test="user.education.equals('博士研究生')">selected</s:if>>博士研究生</option>
	         </select><span class="Validform_checktip"></span></td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>最后学位：</td>
	       <td width="36%">
	         <select name="user.degree" style="width:65%;border:1px solid #ccc;" class="form-control f-ib degree"" datatype="*">
	           <option value=""  <s:if test="user.degree.equals('')">selected</s:if>>--请选择学位--</option>
	           <option value="学士"  <s:if test="user.degree.equals('学士')">selected</s:if>>学士</option>
	           <option value="硕士"  <s:if test="user.degree.equals('硕士')">selected</s:if>>硕士</option>
	           <option value="博士"  <s:if test="user.degree.equals('博士')">selected</s:if>>博士</option>
	           <option value="博士后"  <s:if test="user.degree.equals('博士后')">selected</s:if>>博士后</option>
	           <option value=""  <s:if test="!user.degree.equals('学士')&&!user.degree.equals('硕士')&&!user.degree.equals('博士')&&!user.degree.equals('博士后')&&!user.degree.equals('')">selected</s:if>>其他</option>
	         </select>
	        <input name="degree"   value="<s:property value="user.degree" />" class="form-control f-ib degree1" type="text" style="display:none;placeholder:'请填写';width:38%; border:1px solid #ccc;"datatype="*"/><span class="Validform_checktip"></span>
	       </td>
	       </tr>
	       <tr>
	       <td align="right"><font class="mustToWrite"> * </font>身份证号：</td>
	       <td ><input class="form-control f-ib" style="width:65%" value="<s:property value="user.postCardNumber"/>" name="user.postCardNumber" datatype="i"><span class="Validform_checktip"></span></td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>工作单位：</td>
	       <td  ><input class="form-control f-ib" style="width:65%" value="<s:property value="user.unit" />" name="user.unit" datatype="*"><span class="Validform_checktip"></span></td>
	     </tr>
	     <tr>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>通讯地址：</td>
	       <td ><input class="form-control f-ib" style="width:65%"  value="<s:property value="user.address" />" name="user.address" datatype="*"><span class="Validform_checktip"></span></td>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>邮政编码：</td>
	       <td ><input class="form-control f-ib" style="width:65%" value="<s:property value="user.postCode" />" name="user.postCode" datatype="p"><span class="Validform_checktip"></span></td>
	     </tr>
	     <tr>
	       <td width="12%" align="right"><font class="mustToWrite"> * </font>手机：</td>
	       <td><input class="form-control f-ib" style="width:65%" datatype="m" value="<s:property value="user.telephone" />" name="user.telephone" ><span class="Validform_checktip"></span></td>
	       <td width="12%" align="right">Email：</td>
	       <td><input class="form-control f-ib" style="width:65%" value="<s:property value="user.email" />" name="user.email" datatype="e" ignore="ignore"><span class="Validform_checktip"></span></td>
	     </tr>
	     <tr>
	     <td width="12%" align="right">办公电话：</td>
	       <td><input class="form-control f-ib" style="width:65%" value="<s:property value="user.officephone" />" name="user.officephone" datatype="c" ignore="ignore"><span class="Validform_checktip"></span></td>
	        <td width="12%" align="right">住宅电话：</td>
	       <td> <input class="form-control f-ib" style="width:65%" value="<s:property value="user.homephone" />" name="user.homephone" datatype="c" ignore="ignore"><span class="Validform_checktip"></span></td>
	    </tr>
	     <tr>
	     
	    </tr>
	   </table>
	   <br />
	   <input type="submit" class="btn btn-primary f-fr edit" target="right" style="width:80px;margin-right:17%;" value="确认修改" /> 
	 </form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/Validform_v5.3.2_min.js"></script>
<script>
$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
	
	$(".registerform").Validform({
		tiptype:2
	});
})
$('.datetimepicker').datetimepicker({
    language : 'fr',weekStart : 1,todayBtn : 1,autoclose : 1,
    todayHighlight : 1,startView : 2,minView : 2,forceParse : 0,
});
/* $('.datetimepicker').blur(function(){
	 var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;     
	if($(this).val().match(reg)==null) alert(111)
}) */
$('#TxtProduredDate').blur(function (){
	 $("#TxtProduredDate").change(function(){
		    $("#tip").css("display","none");
		  });
})

function inti(data,array,sel,inp){//刚加载页面时,data为数据库数据，array为选择框中的所有可选数据，sel为选择框,inp为选择其他时出现的inpu框
	var k=0;
	for(var i=0;i<array.length;i++){
		if(data==array[i]) k++;
	}
	if(k==0){
			sel.next().css("display","inline-block");
			sel.width("3%");
		}
	if(inp.val()){
		sel.children(":last").val("其他");
	}
}
function another(sel,inp){	//选择改变时 sel为选择框,inp为选择其他时出现的inpu框
	 sel.click(function(){
		if($(this).children('option:selected').html()=="其他"){
			$(this).next().css("display","inline-block");
			$(this).width("3%");
		}
		else{
			$(this).css("width","65%");
			$(this).next().css("display","none");
		}
	}) 
	inp.blur(function(){
		if($(this).val()){
			sel.children(":last").val("其他");
		}
	})
}
var degree1 ="${user.degree}";
var degree2 = new Array("学士","硕士","博士","博士后","");
var nation1 ="${user.nation}";
var nation2 = new Array("汉族","满族","回族","藏族","苗族","维吾尔族","");
var specialSkill1 = "${user.specialSkill}";
var specialSkill2 = new Array("经济学类研究","心理学研究","教育管理","考古学研究","数字媒体传播研究","");
var positionLevel1 = "${user.positionLevel}";
var positionLevel2 = new Array("教授","副教授","讲师","工程师","研究员","");
inti(degree1,degree2,$(".degree"),$(".degree1"));
another($(".degree"),$(".degree1"));
inti(nation1,nation2,$(".nation"),$(".nation1"));
another($(".nation"),$(".nation1"));
inti(specialSkill1,specialSkill2,$(".specialSkill"),$(".specialSkill1"));
another($(".specialSkill"),$(".specialSkill1"));
inti(positionLevel1,positionLevel2,$(".positionLevel"),$(".positionLevel1"));
another($(".positionLevel"),$(".positionLevel1"));

//当选择其他时，若input框为空提交会报错，所以赋值
$(".specialSkill").change(function(){
	if(!$(".specialSkill1").val()) $(".specialSkill1").val("其他");
})
$(".positionLevel").change(function(){
	if(!$(".positionLevel1").val()) $(".positionLevel1").val("其他");
})
$(".degree").change(function(){
	if(!$(".degree1").val()) $(".degree1").val("其他");
})
</script>
</html>
