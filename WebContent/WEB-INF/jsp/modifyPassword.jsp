<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="com.projection.util.MD5Util" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
<style>
body{font-size:15px ! important; font-family:"Microsoft YAHEI"}
</style>
</head>
<body>
<div class="container" style="margin-top:80px;width:800px; margin-left:180px; ">
  <form id="form1" name="form1" class="form-horizontal"  method="post"  action=""  onSubmit="return confirmModifyPassword()">
  <span class="tip" style="float:left; margin-top:-10px; margin-bottom:-300px; color:red; font-size:15px; "><s:property value="errorPassword" /></span>
    <div class="form-group">
      <label for="byname" class="col-sm-2 control-label">用户名</label>
      <div class="col-sm-10">
        <span  class="form-control" style="width:250px;" id="byname" name="user.byname"><s:property value="user.byname" /></span>
      </div>
    </div>
    <div class="form-group">
      <label for="telephone" class="col-sm-2 control-label">手机号</label>
      <div class="col-sm-10">
        <span  class="form-control" style="width:250px;" id="telephone" name="user.telephone"><s:property value="user.telephone" /></span>
      </div>
    </div>
<%--     <div class="form-group">
      <label for="oldpass" class="col-sm-2 control-label">旧密码</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" style="width:250px;" id="oldpass" placeholder="旧密码" name="user.passwords"><span id="oldpassTip" style="display:none;color:red;"></span>
      </div>
    </div>   --%>
    <div class="form-group">
      <label for="newpass" class="col-sm-2 control-label">新密码</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" style="width:250px;" id="newpass" placeholder="新密码" name="newPassword"><span id="newpassTip" style="display:none;color:red;"></span>
      </div>
    </div>
    <div class="form-group">
      <label for="newpassAgain" class="col-sm-2 control-label">确认新密码</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" style="width:250px;" id="newpassAgain" placeholder="确认新密码"><span id="newpassAgainTip" style="display:none;color:red;"></span>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">  </label>
     <input  type="button" class="btn btn-primary  btn-confirm"  style="text-align:center;margin-left:16px;" value="确认修改" onclick="conf()"></input >
    </div>
  </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script type="text/javascript" >
function conf(){
	Showbo.Msg.confirm('确认修改密码？请记住新密码哦！',function(flag){
		if(flag=='yes'){
			document.form1.attributes["action"].value  = "ModifyPasswordSuccess"; 
			$("#form1").submit();
		}
    });
}
</script>
<script type="text/javascript">
  $(document).ready(function(){
	    var error = false;

/*      $("#oldpass").blur(function(){
      var oldpass = $("#oldpass").val();
      if(oldpass =='') {
        showError('oldpass', '密码不能为空');
        error = true;
        //return;
      }else{
    	  $("#oldpass").css({"border-color":"green"});
          $("#oldpassTip").css({"display":"none"});
      }
    });  */

    $("#newpass").blur(function(){
      var newpass = $("#newpass").val();
      if(newpass == '') {
        showError('newpass', '新密码不能为空');
        error = true;
      }
      else {
        $("#newpass").css({"border-color":"green"});
        $("#newpassTip").css({"display":"none"});
      }
    });

    $("#newpassAgain").blur(function(){
      var newpass = $("#newpass").val();
      if(newpass == '') {
        showError('newpass', '新密码不能为空');
        error = true;
        return;
      }

      var newpassAgain = $("#newpassAgain").val();
      if(newpassAgain != newpass) {
        showError('newpassAgain', '与输入的新密码不一致');
        error = true;
      }
      else {
        $("#newpassAgain").css({"border-color":"green"});
        $("#newpassAgainTip").css({"display":"none"});
      }
    });
  });

  function showError(formSpan, errorText) {
    $("#" + formSpan).css({"border-color":"red"});
    $("#" + formSpan + "Tip").empty();
    $("#" + formSpan + "Tip").append(errorText);;
    $("#" + formSpan + "Tip").css({"display":"inline"});
  }
  var password='${user.password}';
  function confirmModifyPassword(){
	 /*  var oldpass = $("#oldpass").val();
        if(oldpass =='') {
          showError('oldpass', '密码不能为空');
          error = true;
        }else{
        	 error = false;
        } */  
        var newpass = $("#newpass").val();
        if(newpass == '') {
          showError('newpass', '新密码不能为空');
          error = true;
        }else{
        	 error = false;
        }
        var newpass = $("#newpass").val();
        if(newpass == '') {
          showError('newpass', '新密码不能为空');
          error = true;
        }else{
        	 error = false;
        }
        var newpassAgain = $("#newpassAgain").val();
        if(newpassAgain != newpass) {
          showError('newpassAgain', '与输入的新密码不一致');
          error = true;
        }
        if(error==true){
        	return false;
        }
  }
</script>
</body>
</html>