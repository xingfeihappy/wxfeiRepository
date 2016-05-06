<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.projection.util.Constant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员首页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/page/index.css">

</head>
<body style="min-width:800px" onselectstart="return false;">
   <div class="g-top">
     <div class="f-clearSpace container">
       <div class="row">
          <div class="top">
			<!-- 管理员 -->
			<ul class="nav clearfix">
			   <li><span href="#" style="color:#000;margin-left: 30px;"><i class="logo1" style="margin-right: 8px;"></i>welcome：<s:property value="#session.user.username"/></span></li>
			   <li class="drop" style="height: 30px;"><span style="color:#000;margin-left: 70px;cursor: pointer;position: relative;">个人资料</span>
					<ul class="sub_menu">
						<li><a href="ModifyPassword"  target="right">密码修改</a></li>
					</ul>
				</li>
				<li class="topright"><span onclick="login()" style="color:#000;cursor:pointer"><i class="logo4" style="margin-right: 8px;"></i>退出</span></li>
				<li class="topright" ><span style="color:#000;"><i class="logo3" style="margin-right: 8px;"></i><span id="timer" style="color:#000;">2016-01-10</span></span></li>
			</ul>
	     </div>
       </div>
     </div>
   </div>
   <div class="g-banner">
     <div class="container">
       <div class="row">
         <div class="g-banner-content">
          <a class="logo">
            <div class="logo-img f-fl"></div>
            <div class="logo-text f-fl">
              <span class="logo-text-t1" style="font-size:25px; font-family: 微软雅黑, sans-serif;"></span><br />
              <span class="logo-text-t2">sea </span>
            </div>
          </a>
           <form class="search_box f-fr">
            <input type="text" class="search_input" placeholder="  输入检索内容" />
            <button class="btn-search">&nbsp;</button>
          </form>
         </div>
       </div>
     </div>
   </div>
   <br /><br />
   <!-- 管理员 -->
   <div class="g-main">
     <div class="container">
       <div class="row">
         <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 f-clearPadding">
         <div class="leftsidebar_box">   
            <!-- 管理员 -->
            <div class="roleManager">
              <dl class="project_application_manage">
                 <dt onClick="getclassname(this)"><a href="UserManage" target="right" style="display:block;" >用户管理</a></dt>
              </dl>
              <dl class="end_application_manage">
                 <dt onClick="getclassname(this)"><a href="DishesManage" target="right" style="display:block;" >菜品管理</a></dt>
              </dl>
              <dl class="end_application_manage">
                 <dt onClick="getclassname(this)"><a href="OrderManage" target="right" style="display:block;" >订单管理</a></dt>
              </dl>
              <dl class="end_application_manage">
                 <dt onClick="getclassname(this)"><a href="SeatManage" target="right" style="display:block;" >餐位管理</a></dt>
              </dl>
              <dl class="end_application_manage">
                 <dt onClick="getclassname(this)"><a href="MessageManage" target="right" style="display:block;" >留言管理</a></dt>
              </dl>
              <dl class="end_application_manage">
                 <dt onClick="getclassname(this)"><a href="LogManage" target="right" style="display:block;" >日志管理</a></dt>
              </dl>
               <dl class="general_query">
                 <a href="AllSearch" target="right" style="text-decoration:none;" > <dt onClick="getclassname(this)">汇总查询</dt></a>
              </dl>
           </div>
	      </div>
	      </div>
	     <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 kdLeft">
		     <div class="right_content_box">
		       <iframe name="right" src="AllSearch" id="iframe" scrolling="no"  marginWidth="0" onLoad="" frameborder="0" style="width: 100%;height:1000px;margin: 0px; padding: 0px;">
		       </iframe> 
		     </div>
	    </div> 
       </div>
     </div>
   </div>
   <!-- <div class="g-footer">
      <div class="container f-clearSpace">
       <div class="row">
          iopopopop
       </div>
      </div>
   </div> -->
     <script>
	   function getclassname(obj){
		if(document.getElementsByClassName('link_onclick').length==0){
			obj.className='link_onclick';
			obj.id='link_onclick';
			}else{
				var obj1=document.getElementById('link_onclick');
				obj1.className='111';
				obj1.id='1';
				obj.className='link_onclick';
			   obj.id='link_onclick';
			}
		}
	   function login(){
		   location.href='LoginPage'
	   }
	   
    </script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/common.js"></script>
</body>
</html>