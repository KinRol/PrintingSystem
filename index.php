<?php
	// 前台项目，优先级第二
	// define('APP_NAME', 'index');//定义项目名称
	// define('APP_PATH', './index/');//定义项目路径
	

	// 后台项目，优先完成。完成后将项目移交admin.php文件完成这项工作。
	define('APP_NAME', 'admin');//定义项目名称
	define('APP_PATH', './admin/');//定义项目路径


	// 开启项目调试模式，项目开发时请设置打开。网站部署时请删除或关闭。
	define('APP_DEBUG', TRUE);

	require './ThinkPHP/ThinkPHP.php';