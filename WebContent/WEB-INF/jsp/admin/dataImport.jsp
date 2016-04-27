<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库管理-数据导入</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body>
   <form method="post" action="DataImport" enctype="multipart/form-data">
    <fieldset class="fieldset" style="width:95%;margin:0 auto;">
		<legend class="legend" style="width:225px;margin-left:20px;">选择您需要导入的文件!</legend>
	    <div class="parent fieldsetSearch" style=" margin-left:2%">
        <%-- <span style="color:#f0ad4e"></span><br /><br /> --%>
	     <div class="fileUpload btn btn-primary">
		   <span>选择要导入的数据</span>
		   <input id="uploadBtn" value="1" type="file" name="file" class="upload  " />
		 </div>
		 <input type="text" class="form-control" placeholder="文件类型限制为excel" style="display:inline-block;width:25%" id="uploadFile" value="" />
		 <br /><br />
		 <input type="submit" class="btn btn-primary" value="确定导入">
		 </div>
	 </fieldset>
    </form>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
    <script>
    $("#uploadBtn").change(function(){
    	$("#uploadFile").attr("value",this.value);
    })
    //上传文件
    </script>
</body>
</html>