<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专家分派</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
</head>
<body>
    <form class="addProfessor">
    	<a class="btn btn-default f-f1" onclick="history.go(-1)" target="right" style="width:80px;">返 回</a>
        <input class="form-control f-ib" placeholder="输入专家姓名"/>
        <a class="btn btn-primary back f-ib">搜 索</a>
    </form>
    <br/>
      <table class="table table-hover table-borderSelf">
		<thead>
			<tr>
				<th></th>
				<th width="5.6%">序号</th>
				<th width="7.5%">姓名</th>
				<th width="12%">出生年月</th>
				<th width="11%">行政职务</th>
				<th width="11%">研究专长</th>
				<th width="7.3%">学位</th>
				<th width="7.3%">学历</th>
				<th width="10.7%">工作单位</th>
				<th>评审方式</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox"></td>
				<td>1 </td>
				<td>王晓</td>
				<td>1987-12-09</td>
				<td>评审员</td>
				<td>西湖学</td>
				<td>硕士</td>
				<td>硕士</td>
				<td>北京大学研究院</td>
			    <td>
			    	<input name="review" type="radio" value="线上">线上
			    	<input name="review" type="radio" value="线下">线下
			    </td>
			    <td>
					<a class="btn" href="ViewUser" target="right" title="查看用户详细信息">
					<i class="icon-exclamation"></i></a>
			    </td>
			</tr>
			
		</tbody>
	  </table>
	<a class="btn btn-primary submit" onclick="history.go(-1)" target="right" style="float:right;">增 加</a>	
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
</html>