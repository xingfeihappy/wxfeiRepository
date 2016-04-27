<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专家分派</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">
</head>
<body>
    <form class="addProfessor" >
    <div style="float:left;width:370px;">
	    <a class="btn btn-default f-f1" onclick="history.go(-1)" target="right" style="width:80px; margin-top:-3px;margin-right:20px;">返 回</a>
	    <a class="btn btn-primary f-ib" href="AddProfessor?projection.id=<s:property value="projection.id" />" target="right" style="width:80px;margin-top:-3px;margin-right:20px;">新增专家</a>
     <input class="form-control f-ib searchName" placeholder="专家姓名"  style="width:140px;"/>
     </div>
     <div style="float:right;margin-left:20px;margin-top:-9px;"><a class="btn btn-primary back f-ib search" >搜 索</a></div>
     <div style="overflow:hidden; "><input class="form-control f-ib searchSkill" placeholder="研究专长（以；间隔）" style="width:100%" /></div>
    </form>
    <br/>
    <form  method="post" action="Dispatch" onSubmit="return checkZero()">
     <input name="projectionId" value="<s:property value="projection.id" />" type="hidden"/>
      <input name="tag" value="<s:property value="tag" />" type="hidden"/>
      <table class="table table-hover table-borderSelf ">
		<thead>
			<tr><th colspan="10">全部专家列表</th></tr>
			<tr>
				<th></th>
				<th width="8%">序号</th>
				<th width="9%">姓名</th>
				<th width="12%">出生年月</th>
				<th width="11%">行政职务</th>
				<th width="14%">研究专长</th>
				<th width="7.3%">学位</th>
				<th width="7.3%">学历</th>
				<th width="15%">工作单位</th>
				<th width="12%">管理操作</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="userList" status="index">
				<tr class="line">
				    <th><input class="checkid" type="checkbox" name="chkUser" value="<s:property value="id" />"></th>
					<td ><s:property value="#index.index+1" /></td>
					<td class="name"><s:property value="username" /></td>
					<td><s:property value="birthday"></s:property></td>
					<td><s:property value="positionLevel"></s:property></td>
					<td  class="specialSkill"><s:property value="specialSkill" /></td>
					<td><s:property value="degree" /></td>
					<td><s:property value="education" /></td>
					<td><s:property value="unit" /></td>
					<td>
						<a class="btn " href="ViewUser?user.id=<s:property value="id" />" target="right" title="查看用户详细信息"> 查看</a>
			        </td>
				</tr>
			  </s:iterator>
		</tbody>
	  </table>
	  <br />
	  <input class="btn btn-primary f-fr" style="float:right;width:80px;" type="submit" value="分 派" ></input>
</form> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/dataTables.bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/table2.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
<script>

$(".search").click(function(){
	var l=0;
	var j=-1;
	var t=new Array();
	for(var k=0;k<$(".name").length;k++){//数组初始化
		t[k] = 0;
	}
	var searchName = $.trim($(".searchName").val());//专家名字
	var searchSkill = ($.trim($(".searchSkill").val())).split(/;|；/);//研究专长/;|；|,/
	$(".name").each(function(){
		$(this).parent().show();
	});
	$(".name").each(function(){
		if(searchName){
			if($(this).html().indexOf(searchName)<0&&searchName.indexOf($(this).html())<0)
				$(this).parent().hide();
		}
	});
	
	$(".specialSkill").each(function(){
		j++;
	if(searchSkill){
		for(var i=0;i<searchSkill.length;i++){
			if($(this).html().indexOf(searchSkill[i])<0&&searchSkill[i].indexOf($(this).html())<0)
				t[j]++;
		}
		if(t[j]==searchSkill.length){
			$(this).parent().hide();//所有搜索条件都不满足的时候隐藏
		}
	}
})	
	
	//l 为满足条件的数量 重新设定序号
	$(".line").each(function(){
		if($(this).css("display")!="none")
			l++;
		$(this).children(":eq(1)").html(l);
	})
});



function checkZero(){
	  var count=0; 
	  var reviewUserList=${reviewUserList};
	  var checkArray = document.getElementsByClassName("checkid");
	  for(i = 0; i < checkArray.length; i++){
		  if(checkArray[i].checked == true){
			  count++;
			  }  
		  }  
	  if(count==0){
		  Showbo.Msg.alert("请先选择专家！");
		  return false;
	  }
	  for(var n = 0; n < checkArray.length; n++){
		  if(checkArray[n].checked == true){
			  var repeat=checkArray[n].value;
			  if(reviewUserList.contains(repeat)){//contains下面有个函数
				  var re=true;
			      break;
			  }
		  }  
	  }
	  if(re){
		  Showbo.Msg.alert("对不起，您已经为该课题分配过此专家了！");
		  return false;
	  }
}
$(function () {
    Array.prototype.contains = function (element) {  //利用Array的原型prototype点出一个我想要封装的方法名contains
        for (var i = 0; i < this.length; i++) {
            if (this[i] == element) {                                     //如果数组中某个元素和你想要测试的元素对象element相等，则证明数组中包含这个元素，返回true
                return true;
            }
        }
  }
    
})
$(document).ready(function() {
    var t = $('.datatable').DataTable({
    	"sDom": 'T<"clear">lfrtp',
    	 "Processing": true,
    	 /*"oTableTools": {
             "sSwfPath": "/swf/copy_csv_xls_pdf.swf",
             "aButtons":[{"sExtends":"copy",
            	 "sButtonText":"Copy to clipboard"} ]
         },*/
    	 "bFilter":false,//搜索框
    	 "bScrollInfinite":true,
    	 "bPaginate":false,
    	 "sScrollY":"700px",
    	 "columnDefs": [{
            "searchable": false,
            "orderable": false,
            "sortable": false,
            "targets": 0
        },
        {
            "searchable": false,
            "orderable": false,
            "sortable": false,
            "targets": 9
        }], 
        "oLanguage": {
				//"sUrl":"http://sandbox.runjs.cn/uploads/rs/238/n8vhm36h/zh_CN.json"
			"sProcessing":   "处理中...",
		    "sLengthMenu":   "_MENU_ 记录/页",
		    "sZeroRecords":  "没有匹配的记录",
		    "sInfo":         "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
		    "sInfoEmpty":    "显示第 0 至 0 项记录，共 0 项",
		    "sInfoFiltered": "(由 _MAX_ 项记录过滤)",
		    "sInfoPostFix":  "",
		    "sSearch":       "模糊搜索:",
		    "sUrl":          "",
		    "oPaginate": {
		     "sFirst":    "首页",
		     "sPrevious": "上页",
		     "sNext":     "下页",
		     "sLast":     "末页"
		    }
		} 
    });
    t.on('order.dt search.dt',//第一列序号
    function() {
        t.column(1, {
            search: 'applied',
            order: 'applied'
        }).nodes().each(function(cell, i) {
            cell.innerHTML = i + 1;
        });
    }).draw();

});
</script>
</body>
</html>