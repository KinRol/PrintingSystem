<?php
	/**
	* 用户登录控制类
	*/
	class LoginAction extends Action
	{
		
		function loginCheck()
		{
			$loginData=array('UserName'=> I('userName'),'UserPwd'=>I('userPwd'));
			// var_dump($loginData);

			// 登录检查，判断用户名或密码是否错误
			$isLogin=D('User')->logincheck($loginData);
			// var_dump($isLogin);
			
			if($isLogin!=0)
			{
				if($isLogin!=1){
					$userGroup=session('userInfo')['groupId'];
					// var_dump($userGroup);
					if ($userGroup<=2 && $userGroup!=null) {
						$userID=session('userInfo')['userId'];
						$userNane=session('userInfo')['userName'];
						// $this->msg=$userID.'Welcome '.$userInfo['userName'].' login system';
						// $this->msg='Welcome '.$userNane.' login system! your id is '.$userID;
						// $this->display('msg');

						$this->redirect('Index/main','',0,'Jumping,Please later.');
					}else{
						$this->error('您没有权限，登录失败！');
					}
				}else{
					$this->error('您已被系统锁定，无法登录系统！请联系系统管理员解除锁定！');
				}
			}else{
				// $this->msg='error';
				$this->error('用户名或密码错误！');
			}
		}
	}