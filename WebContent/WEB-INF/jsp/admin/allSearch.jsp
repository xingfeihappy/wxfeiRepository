<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>汇总查询</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min1.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/dataTables.bootstrap.css">
</head>
	<body>
	<form action="AggregateQuerySearch" method="post">
	<fieldset class="fieldset" style="width:95%;margin:0 auto;">
		<legend class="legend" style="width:160px;margin-left:20px;">请选择汇总条件</legend>
	<div class="parent fieldsetSearch" style="padding:10px; margin-left:2%">
		<div style="margin-bottom:10px;">
			<label style="width:120px;">按申请时间汇总：</label>
			<input type="text"  placeholder=" 年-月-日"  name="searchCondition['applytime1']" data-date-format="yyyy-mm-dd" class="datetimepicker1 start1" style="width:20%; display:inline-block; height:30px;"> 至
			<input type="text"  placeholder=" 年-月-日"  name="searchCondition['applytime2']" data-date-format="yyyy-mm-dd" class="datetimepicker2 start2" style="width:20%; display:inline-block; height:30px;">
		</div>
		<div style="margin-bottom:10px;">
			<label style="width:120px;">按结题时间汇总：</label>
			<input type="text"  placeholder=" 年-月-日"  name="searchCondition['deadline1']" data-date-format="yyyy-mm-dd" class="datetimepicker3 end1" style="width:20%; display:inline-block; height:30px;"> 至
			<input type="text"  placeholder=" 年-月-日"  name="searchCondition['deadline2']" data-date-format="yyyy-mm-dd"  class="datetimepicker4 end2" style="width:20%; display:inline-block; height:30px;">
		</div>
		<div style="margin-bottom:10px;">
			<label style="width:120px;">按课题类型汇总：</label>
			  <input type="checkbox"  class="projectionType" name="searchCondition['projectionType']" value="一般类" style="margin-top:-3px;"> 一般类&nbsp;&nbsp;
			  <input type="checkbox"  class="projectionType" name="searchCondition['projectionType']" value="资助类" style="margin-top:-3px;margin-left:25px;"> 资助类&nbsp;&nbsp;
			  <input type="checkbox"  class="projectionType" name="searchCondition['projectionType']" value="招标类" style="margin-top:-3px;margin-left:25px;"> 招标类&nbsp;
			
		</div>
		<div style="margin-bottom:10px; vertical-align:center;">
			<label style="width:115px; float:left;margin-top:7px;margin-right:12px;">按学科分类汇总：</label>
			<table style="width:600px;display:inline-block; margin-left:-3px;">
			<tr>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="马列、科社" style="margin-top:-3px;"> 马列、科社&nbsp;&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="哲学" style="margin-top:-3px;"> 哲学&nbsp;&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="政法" style="margin-top:-3px;"> 政法&nbsp;&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="理论经济" style="margin-top:-3px;"> 理论经济&nbsp;&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="应用经济" style="margin-top:-3px;"> 应用经济&nbsp;&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="管理学" style="margin-top:-3px;"> 管理学&nbsp;&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="社会学" style="margin-top:-3px;"> 社会学&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="历史学" style="margin-top:-3px;"> 历史学&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="文学" style="margin-top:-3px;"> 文学&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="新闻学" style="margin-top:-3px;"> 新闻学&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="语言学" style="margin-top:-3px;"> 语言学&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="教育学" style="margin-top:-3px;"> 教育学&nbsp;</td>
				<td><input type="checkbox"  name="searchCondition['type']" class="type" value="文化学" style="margin-top:-3px;"> 文化学&nbsp;</td>
				<td><input type="checkbox" name="searchCondition['type']"  class="type"  value="其他" style="margin-top:-3px;"> 其他&nbsp;</td>
			</tr>
		    </table>
		</div>
   		<a class="btn btn-primary f-ib filter"  style="margin-left:230px;margin-right:20px;
   		margin-top:10px;width:80px;color:#fff;">搜 索</a>
		<a class="btn btn-primary f-ib clear" style="width:80px;margin-top:10px;color:#fff;">清 除</a>
	</div>
	</fieldset>	
    <br/> <br /> 
	<div class="container-fluid">
		<div class="row-fluid">
			<table class="table table-hover table-borderSelf3 datatable" width="100%">
				<thead>
					<tr>
						<th width="6%" style="padding:0">序号</th>
						<th width="18%" style="padding:0">课题名称</th>
						<th width="10%" style="padding:0">状态</th>
						<th width="10%" style="padding:0">学科分类</th>
						<th width="9%" style="padding:0">负责人</th>
						<th width="10%" style="padding:0">课题类型</th>
						<th width="14%" style="padding:0">起止日期</th>
						<th width="8%" style="padding:0">经费(万元)</th>
					</tr>
				</thead>
				<tbody >
	  	  			<s:iterator value="projectionList"  status="index">
					<tr class="line" >
					    <td style="text-align:center;padding:0"></td>
						<td style="text-align:center;padding:0"><a href="AdminProjectionView?projection.id=<s:property value="id" />"><s:property value="title" /></td>
						<td style="text-align:center;padding:0"><s:property value="state"></s:property></td>
						<td style="text-align:center;padding:0"><s:property value="type.split(',')[0]"></s:property></td>
						<td style="text-align:center;padding:0"><s:property value="user.username" /></td>
						<td style="text-align:center;padding:0">
				        	<s:if test="projectionType==11">一般类</s:if>
				        	<s:elseif test="projectionType==12">资助类</s:elseif>
				        	<s:elseif test="projectionType==13">招标类</s:elseif>
				        </td>
						<td class="date" style="text-align:center;padding:0"><s:date name="applyDate" format="yyyy-MM-dd"/>至<s:date name="deadline" format="yyyy-MM-dd"/></td>
						<td style="text-align:center;padding:0"><s:property value="money" /></td>
					</tr>
				  </s:iterator>
			  </tbody>
			</table>
		</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.min.js"></script>
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/page/mulSearch2.js"></script>-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/dataTables.bootstrap.min.js"></script>
<script>
$('.datetimepicker1, .datetimepicker2,.datetimepicker3,.datetimepicker4').datetimepicker({
    language : 'fr',weekStart : 1,todayBtn : 1,autoclose : 1,
    todayHighlight : 1,startView : 2,minView : 2,forceParse : 0,
});
$.fn.dataTable.ext.search.push(
	    function( settings, data, dataIndex ) {
	       // var min = parseInt( $('#min').val(), 10 );
	       // var max = parseInt( $('#max').val(), 10 );
			var start1 = new Date($(".start1").val().replace(/-/g,"-"));//
		    var start2 = new Date($(".start2").val().replace(/-/g,"-"));
			var end1 = new Date($(".end1").val().replace(/-/g,"-"));
			var end2 = new Date($(".end2").val().replace(/-/g,"-"));
	        var start = new Date(data[6].substring(0,data[6].indexOf("至")).replace(/-/g,"-"));
	        var end = new Date(data[6].substring(data[6].indexOf("至")+1,data[6].length).replace(/-/g,"-"));
	        var projectionType = data[5];
	        var pt = new Array();//存储选中的课题类型
		    var type = new Array();//存储选中的学科分类
        	$(".projectionType:checked").each(function(){
 	            pt.push($(this).val());
 	          })
 	          $(".type:checked").each(function(){
 	            type.push($(this).val());
 	          })
	        if ( (( isNaN( start1 ) && isNaN( start2 ) ) ||( isNaN( start1 ) && start <= start2 ) || ( start1  <= start   && isNaN( start2 ) ) ||( start1  <= start   && start <= start2 ) )&&
	        		(( isNaN( end1 ) && isNaN( end2 ) ) ||( isNaN( end1 ) && end <= end2 ) || ( end1  <= end   && isNaN( end2 ) ) ||( end1  <= end   && end <= end2 ) )&&
	        		((pt.length==0)||($.inArray(projectionType,pt)>=0))&&
	        		((type.length==0)||($.inArray(data[3],type)>=0)))
	        {
	            return true;
	        }
	        return false;
	    }
	);
	$(document).ready(function() {
	    var t = $('.datatable').DataTable({
	    	 "bLengthChange":false,
	        "columnDefs": [{
	            "searchable": false,
	            "orderable": false,
	            "targets": 0,    
	        }],
	        "order": [[1, 'asc']],
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
	        t.column(0, {
	            search: 'applied',
	            order: 'applied'
	        }).nodes().each(function(cell, i) {
	            cell.innerHTML = i + 1;
	        });
	    }).draw();

	    $('.filter').click( function() {
	        t.draw(); 
	    } );
	    $(".clear").click(function(){
	    	 $('.datetimepicker1, .datetimepicker2,.datetimepicker3,.datetimepicker4').val("");
	    	 $('.projectionType').removeAttr("checked");
	    	 $('.type').removeAttr("checked");
	    	 t.draw(); 
	    })
	});
</script>
	</div>
</form>
</body>
</html>