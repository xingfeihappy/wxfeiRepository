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
    <form class="addProfessor" method="post" action="ExpertDispatch" >
    <div style="float:left;width:370px;margin-top:3px;">
    <a class="btn btn-default f-f1" onClick="back()"  target="right" style="width:80px; margin-top:-3px;margin-right:20px;">返 回</a>
    <input class="btn btn-primary back f-ib"  target="right" style="width:80px; margin-top:-3px;margin-right:20px;" type="submit" value="分派专家"></input>
     <a class="btn btn-primary back f-ib" href="DownReviewFile?projection.id=<s:property value="projection.id"/>" style="width:90px; margin-top:-3px;margin-right:20px;">下载评分表</a>
    </div>
    <br/>
     <br/>
     <span><s:property value="reviewError" /></span>
      <br/>
     <input name="projection.id" value="<s:property value="projection.id" />" type="hidden"/>
     <input name="tag" value="<s:property value="tag" />" type="hidden"/>
      <table class="table table-hover table-borderSelf">
		<thead>
		    <tr><th colspan="10">该课题已分配专家列表</th></tr>
			<tr> 
				<th width="5.6%">序号</th>
				<th width="9%">姓名</th>
				<th width="12%">出生年月</th>
				<th width="11%">行政职务</th>
				<th width="14%">研究专长</th>
				<th width="7.3%">学位</th>
				<th width="7.3%">学历</th>
				<th width="15%">工作单位</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="userList" status="index">
				<tr>
					<td ><s:property value="#index.index+1" /></td>
					<td ><s:property value="username" /></td>
					<td><s:property value="birthday"></s:property></td>
					<td><s:property value="userType"></s:property></td>
					<td ><s:property value="specialSkill" /></td>
					<td><s:property value="degree" /></td>
					<td><s:property value="education" /></td>
					<td><s:property value="unit" /></td>
					<td>
					<s:if test="isDelete.get(id)==1">
					    <a href="ViewUser?user.id=<s:property value="id" />" target="right" title="查看用户详细信息"> 查看</a>&nbsp;&nbsp;
					</s:if>
					<s:else>
					    <a href="ViewUser?user.id=<s:property value="id" />" target="right" title="查看用户详细信息"> 查看</a>&nbsp;&nbsp;
						<a href="javascript:fun('DelExpertDispatch?projection.id=<s:property value="projection.id" />&user.id=<s:property value="id" />&tag=<s:property value="tag" />'), void(0);"  target="right" title="删除该用户">删除</a>
					</s:else>
			        </td>
				</tr>
			  </s:iterator>
		</tbody>
	  </table>
</form> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/bootstrap/dataTables.bootstrap.min.js"></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/table2.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>

<script type="text/javascript">
var tag=${tag};
var state="${projection.state}";
function back(){
	if(state=="申报待评审"||state=="申报评审中"||state=="拒绝立项"||state=="申报待修改")
	 window.location.href="operatorApplyManage?tag="+tag;
	else{
		window.location.href="operatorApplyEndManage?tag="+tag;
	}
}
</script>
<script>

function fun(x){
	Showbo.Msg.confirm('确定删除专家？',function(flag){
			if(flag=='yes')
				location.href =x;
		}); 
};
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

$(function () {
    Array.prototype.contains = function (element) {  //利用Array的原型prototype点出一个我想要封装的方法名contains
        for (var i = 0; i < this.length; i++) {
            if (this[i] == element) {                                     //如果数组中某个元素和你想要测试的元素对象element相等，则证明数组中包含这个元素，返回true
                return true;
            }
        }
  }
    
});

</script>
</body>
</html>