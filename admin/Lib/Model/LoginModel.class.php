<?php
	/**
	* 登录模型类
	*/
	class LoginModel extends Model
	{
		
		function check($loginData)
		{
// 			ThinkPHP模型基础类提供的连贯操作方法，可以有效的提高数据存取的代码清晰度和开发效率，并且支持所有的CURD操作。使用也比较简单， 假如我们现在要查询一个User表的满足状态为1的前10条记录，并希望按照用户的创建时间排序 ，代码如下： 
// $User->where('status=1')->order('create_time')->limit(10)->select();
			

			$User=M('user');

			// var_dump($User);
			// $data=$User->select();//查询出数据库中所有的用户信息
			$condition['userName']=$loginData['UserName'];
			$condition['userPwd']=$loginData['UserPwd'];

			// select 查询数据集 
			// $data=$User->where($condition)->select();

			// find 查询数据. find方法也只会返回第一条记录。如果要读取某个字段的值，可以使用getField方法 
			$userData=$User->where($condition)->find();
			// return $userData;



			// 如果返回值不为零，表示有数据，判断用户登录成功，返回真，否则返回0表示假
			if ($userData!=0) {
				// 用户isLock字段为0表示用户不被锁定，为1表示用户已经被锁定。如果用户被锁定，返回1表示登录成功但被锁定。反之，返回2表示登录成功且不被锁定。
				if($userData['isLock']!=1)
				{
					// session('userId',$userInfo['userId']);
					// session('userName',$userInfo['userName']);
					// var_dump(session('userId'));
					// var_dump(session('userName'));

					// 清除用户的session
					session('userInfo',null);
					// 将用户信息添加到session中，用于系统调用
					session('userInfo',$userData);					
					return 2;
				}else{
					return 1;
				}
			}else{
				return 0;
			}
		}
	}