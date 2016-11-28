<?php
namespace app\component\controller;

use think\Request;

use app\model\UserModel;  
use app\model\CourseModel; 



/**
 * todo:权限判断。即当前新闻，是否属于当前这个菜单对应的那个 新闻类别
 */
class CourseController extends ComponentController
{
    public function indexAction() 
    {
    	$CourseModel = new CourseModel;
    	//取每天第一节课
        for ($i=1; $i<5; $i++) {
            $map = [];
            $map['week'] = 1;
            $map['ranking'] = $i;
            $results[$i] = $CourseModel->where($map)->select();
        }
        $this->assign('results', $results);

        //获取当前用户信息
        $User = UserModel::getCurrentFrontUserModel();
        $this->assign('User', $User);
    	return $this->fetch();
    }
}
?> 