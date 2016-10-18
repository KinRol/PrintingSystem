<?php if (!defined('THINK_PATH')) exit();?>﻿<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/loginstyles.css">
</head>
<body>
<?php echo ($msg); ?>
<div class="htmleaf-container">
	<div class="wrapper">
		<div class="container">
			<h1>欢迎登陆文印系统</h1>
			
			<form class="form" method="POST" action="./Login/loginCheck">
				<input type="text" name="userName" placeholder="用户名">
				<input type="password" name="userPwd" placeholder="用户密码">
				<!-- <button type="submit" id="login-button">Login</button> -->
				<input type="submit" class='loginbutton' id="login-button" value="登录系统">
			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>

<script src="__PUBLIC__/Js/jquery-2.1.1.min.js" type="text/javascript"></script>
<!-- <script>
$('#login-button').click(function (event) {
	event.preventDefault();
	$('form').fadeOut(500);
	$('.wrapper').addClass('form-success');
});
</script> -->


</body>
</html>