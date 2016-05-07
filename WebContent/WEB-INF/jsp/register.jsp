<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新用户注册</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/page/index.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/jquery.idealforms.css">
<style>
html {
	min-width: 800px; margin: 0 auto;
}

body {
	max-width: 770px; height: 100%; margin: 2em auto; color: #353535;
	overflow-y: auto; background-color: rgb(239, 239, 239) !important;
}

.container {
	margin: 5% auto; position: relative; vertical-align: middle;
	background-color: white; box-shadow: 0px 0px 2px #888888;
}

.content {
	padding: 35px 60px; vertical-align: middle;
}

.idealsteps-nav {
	width: 600px;
}

.field.buttons button {
	margin-right: .5em;
}

#invalid {
	display: none; float: left; width: 290px; margin-left: 120px;
	margin-top: .5em; color: #CC2A18; font-size: 130%; font-weight: bold;
}

.idealforms.adaptive #invalid {
	margin-left: 0 !important;
}

.idealforms.adaptive .field.buttons label {
	height: 0;
}

.line {
	height: 10px; font-size: 13px;
}

#footer, h1 {
	text-align: center; font-family: "Microsoft YaHei"
}
</style>
</head>
<body>
	<h1 style="font-size: 22px;">新用户注册</h1>
	<div class="container">
		<div class="content">
			<div class="idealsteps-container">
				<form id="form1" action="registerForm" novalidate
					autocomplete="off" class="idealforms" style="margin-left: 20px;">
					<div class="idealsteps-wrap">
						<!-- 步骤 1 -->
						<section class="idealsteps-step" name="第一步">
						<div class="field">
							<label class="main">用户名:</label> <input name="user.username"
								type="text"> <span class="error"></span>
						</div>
						<div class="field">
							<label class="main">真实姓名:</label> <input name="user.name"
								type="text"> <span class="error"></span>
						</div>
						<div class="field">
							<label class="main">密码:</label> <input id="password"
								name="user.password" type="password"> <span
								class="error"></span>
						</div>
						<div class="field">
							<label class="main">确认密码:</label> <input name="confirmpass"
								type="password"> <span class="error"></span>
						</div>
						<div class="field">
							<label class="main">邮箱:</label> <input name="user.email"
								type="email"> <span class="error"></span>
						</div>

						<div class="field">
							<label class="main">性别:</label> <label><input
								name="user.sex" type="radio" value="0">男</label> <label><input
								name="user.sex" type="radio" value="1">女</label> <span
								class="error"></span>
						</div>
						<div class="field">
							<label class="main">出生日期:</label> <input name="user.birthday"
								type="text" placeholder="年-月-日" class="datepicker"> <span
								class="error"></span>
						</div>
						<div class="field">
							<label class="main">通讯地址:</label> <input name="user.address"
								type="text"> <span class="error"></span>
						</div>
						<div class="field">
							<label class="main">手机:</label> <input name="user.telephone"
								type="text" id="tel"> <span class="error telerror"></span>
						</div>
						<div class="field buttons">
							<div class="line"></div>
							<label class="main">&nbsp;</label>
							<button type="submit" class="submit">提交</button>
						</div>
						</section>
					</div>
					<span id="invalid"></span>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		<span>版权所有© 2016</span>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/js/vendor/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/js/vendor/jquery-ui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/js/vendor/jquery.idealforms.js"></script>
	<script>
		$('form.idealforms')
				.idealforms(
						{
							silentLoad : false,
							rules : {
								'user.name' : 'required nameerror',
								'user.username' : 'required',
								'user.password' : 'required pass',
								'confirmpass' : 'required equalto:user.password',
							},
							errors : {
								'username' : {
									ajaxError : 'Username not available'
								}
							},

							onSubmit : function(
									invalid, e) {
								if (invalid) {
									e
											.preventDefault();
								} else {
									$('#invalid')
											.toggleClass(
													'valid',
													!invalid)
								}
								$('#invalid')
										.show()
										.text(
												invalid ? (invalid + ' 个无效')
														: '');
							}

						});

		$('form.idealforms').find(
				'input, select, textarea').on(
				'change keyup', function() {
					$('#invalid').hide();
				});

		$((function($) {
			$.datepicker.regional['zh-CN'] = {
				clearText : '清除',
				clearStatus : '清除已选日期',
				closeText : '关闭',
				closeStatus : '不改变当前选择',
				prevText : '<上月',
				prevStatus : '显示上月',
				prevBigText : '<<',
             prevBigStatus: '显示上一年',
             nextText: '下月>',
				nextStatus : '显示下月',
				nextBigText : '>>',
				nextBigStatus : '显示下一年',
				currentText : '今天',
				currentStatus : '显示本月',
				monthNames : [ '一月', '二月', '三月',
						'四月', '五月', '六月', '七月',
						'八月', '九月', '十月', '十一月',
						'十二月' ],
				monthNamesShort : [ '一', '二', '三',
						'四', '五', '六', '七', '八',
						'九', '十', '十一', '十二' ],
				monthStatus : '选择月份',
				yearStatus : '选择年份',
				weekHeader : '周',
				weekStatus : '年内周次',
				dayNames : [ '星期日', '星期一', '星期二',
						'星期三', '星期四', '星期五', '星期六' ],
				dayNamesShort : [ '周日', '周一', '周二',
						'周三', '周四', '周五', '周六' ],
				dayNamesMin : [ '日', '一', '二', '三',
						'四', '五', '六' ],
				dayStatus : '设置 DD 为一周起始',
				dateStatus : '选择 m月 d日, DD',
				dateFormat : 'yy-mm-dd',
				firstDay : 1,
				initStatus : '请选择日期',
				isRTL : false
			};
			$.datepicker
					.setDefaults($.datepicker.regional['zh-CN']);
		})(jQuery));
		/*  $(function() {
		     $( ".datepicker" ).datepicker({
		       changeMonth: true,
		       changeYear: true
		     });
		   }); */
		$('form.idealforms')
				.idealforms(
						'addRules',
						{
							'comments' : 'required minmax:50:200'
						});

		$('.prev')
				.click(
						function() {
							$('.prev').show();
							$('form.idealforms')
									.idealforms(
											'prevStep');
						});
		$('.next')
				.click(
						function() {
							$('.next').show();
							$('form.idealforms')
									.idealforms(
											'nextStep');
						});
	</script>
	<script>
var telList=${telList};//数据库中存在的电话号码
var usernameStr="${usernameStr}"; 
var usernameList=usernameStr.split(",");//数据库中存在的用户名
</script>
</body>
</html>
