<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库管理-数据备份</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min1.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">

</head>
<body>
   <form method="post" action="DataBackupSingle" enctype="multipart/form-data">
   <fieldset class="fieldset" style="width:95%;margin:0 auto;">
		<legend class="legend" style="width:225px;margin-left:20px;">选择您需要备份的数据!</legend>
		<div class="parent fieldsetSearch" style=" margin-left:2%">
	     <%-- <span style="color:#f0ad4e"></span><br /><br /> --%>
	     <input type="checkbox" name="check1" id="check1" value="1"/><label class="labelFont" for="check1"><a class="btn" style="padding-top:10px">用户库</a></label>
	     <input type="checkbox" name="check2" id="check2" value="2"/><label class="labelFont" for="check2"><a class="btn" style="padding-top:10px">专家库</a></label>
	     <input type="checkbox" name="check3" id="check3" value="3"/><label class="labelFont" for="check3"><a class="btn" style="padding-top:10px">课题库</a></label>
		 <input type="checkbox" name="check4" id="check4" value="4"/><label class="labelFont" for="check4"><a class="btn" style="padding-top:10px">成果库</a></label>
	  	 <input type="checkbox" name="check5" id="check5" value="5"/><label class="labelFont" for="check5"><a class="btn" style="padding-top:10px">日志库</a></label>
	     <br />
	     <input type="submit" class="btn btn-primary submit" title=""  value="确定备份"/>
	    </div>
    </fieldset>
    </form>
    <br /><br /><br />
    <form method="post" action="DataBackup" enctype="multipart/form-data">
    <fieldset class="fieldset" style="width:95%;margin:0 auto;">
		<legend class="legend" style="width:160px;margin-left:20px;">备份全部数据!</legend>
	    <div class="parent fieldsetSearch" style=" margin-left:2%">
	     <span style="color:#f0ad4e"></span><br /><br />
	     <input type="hidden" name="check1" value="1" />
	     <input type="hidden" name="check2" value="2" />
	     <input type="hidden" name="check3" value="3" />
	     <input type="hidden" name="check4" value="4" />
	     <input type="hidden" name="check5" value="5" />
	     <input type="submit" class="btn btn-primary submit" title=""  style="margin-top:-28px" value="备份全部数据"/>
   	 	</div>
    </fieldset>
    </form>
</body>
</script>
</html>