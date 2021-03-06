<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在线选座</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/showBo.css">

</head>
<body onselectstart="return false;">
   <div class="g-main-content">
   		    <div class="nav-content">
				<div class="content-box">
					<ul class="content-box-li-hover">
					  <s:iterator value="seatList" id="entry">
						<li class="content-box-li " style="width:20%">
						  <form id="form" action="chooseSeatForm" method="post">
							<span>容纳人数：<s:property value="containPeople" /></span><br />
							<span>状态：<s:if test="state==0">可用</s:if><s:else>不可用</s:else></span><br />
							<span>备注：<s:property value="remark" /></span><br />
							<input type="hidden" name="seat.id" value="<s:property value="id" />"/>
							<input type="hidden" name="order.id" value="<s:property value="order.id" />"/>
							<input type="button" style="margin-top:15px;width:96%" class="btn chooseSeat btn-default" value="选定该座位"/>
						    <input type="hidden" value="<s:property value="state" />">
						  </form>
						</li>
					  </s:iterator>
					</ul>
				</div>   		    	
   			</div>
       	</div>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/showBo.js"></script>
   <script>
   	 $(".chooseSeat").click(function(){
   		 if($(this).next().attr("value")==1){
   			Showbo.Msg.confirm('该餐位不可用',function(flag){
   				if(flag=='yes'){
   					return false;		
   				}				
   			}); 
   		 }else{
   			 $(this).parent().submit();
   		 }
   	 })
   </script>
</body>

</html>