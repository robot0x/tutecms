<?php
namespace app\component\controller;

use think\Request;                          // 请求

use app\Common;
use app\model\FieldModel;                   // 扩展字段类别
use app\model\UserModel;                    // 用户
/**
 * 登陆注销与个人信息管理组件
 */
class LoginController extends ComponentController
{
    public function indexAction()
    {
        // 判断登陆状态，如果已登陆，则显示注销信息。如果未登陆，则显示登陆信息
        if (UserModel::isLogin()) {
            return $this->userInfo();
        } else {
            return $this->loginInfo();
        }
    }

    /**
     * 登录
     * @return         
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-13T11:16:29+0800
     */
    public function loginAction()
    { 
        // 获取请求信息
        $param = Request::instance()->param();

        // 登录
        if (array_key_exists('username', $param) && array_key_exists('password', $param)) {
            if (UserModel::login($param['username'], $param['password'])) {
                return $this->success('操作成功', url('@' . $this->currentMenuModel->getData('url') . '/index'));
            } else {
                return $this->error('用户名或密码错误');
            }
        } else {
            return $this->error('传入的参数有误');
        }
    }

    /**
     * 注销
     * @return                      
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-12T14:52:04+0800
     */
    public function logoutAction()
    {
        // login or logout
        if (UserModel::logout()) {
            return $this->success('注销成功');
        } else {
            return $this->error('操作失败');
        }
    }

    /**
     * 登陆
     * @return                      
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-12T14:52:15+0800
     */
    public function checkAction()
    {
        $param = Request::instance()->param();

        // 查找用户名
        if (array_key_exists('username', $param)) {
            $username = $param['username'];
        } else {
            $this->error('传入数据有误');
        } 

        // 查找密码
        if (array_key_exists('password', $param)) {
            $password = $param['password'];
        } else {
            $this->error('传入数据有误');
        }

        // 登录
        if (UserModel::login($username, $password)) {
            $this->success('登录成功');
        } else 
        {
            $this->error('用户名或密码错误');
        }
    }

    /**
     * 登陆界面
     * @return   html                   
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-13T10:39:27+0800
     */
    private function loginInfo()
    {
        // 注意，该函数虽被调用，但是触发的action是index,所以必须给出全路径
        return $this->fetch('loginInfo');   
    }

    /**
     * 个人信息界面
     * @return   html                   
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-13T10:40:13+0800
     */
    private function userInfo()
    {
        //取出当前用户数据
        $userModel = UserModel::getCurrentFrontUserModel();

        // 传入V层
        $this->assign('userModel', $userModel);
        return $this->fetch('userInfo'); 
    }

    /**
     * 个人信息保存
     * @return
     * @author fanhaoling
     */
    public function updateAction()
    {
        $datas = Request::instance()->param();
       
        //取出当前用户数据
        $UserModel = UserModel::getCurrentFrontUserModel();
        $UserModel->setData('name', $datas['name']);
        if ('' !== (String)$datas['repassword']) {
            $UserModel->setPassword($datas['repassword']);
        }
        
        $UserModel->save();
        return $this->success('更新成功', Common::url('/index'));
    }

    /**
     * 个人信息修改
     * @return
     * @author fanhaoling
     */
    public function editAction()
    {

        $UserModel = new UserModel;

        //取出当前用户数据
        $UserModel = UserModel::getCurrentUserModel();

        // 传入V层
        $this->assign('UserModel', $UserModel);
        return $this->fetch('edit');
    }

    /**
     * 新用户注册
     * @return                      
     * @author fanhaoling
     */
    public function addAction()
    {
        return $this->fetch('component@Login/add');
    }

    /**
     * 新用户信息保存
     * @return                      
     * @author fanhaoling
     */
    public function saveAction()
    {
        $data = Request::instance()->Param();
       
        //保存数据
        $UserModel = new UserModel;
        $UserModel->setData('name', $data['name']);
        $UserModel->setData('username', $data['username']);
        $UserModel->setData('password', $data['password']);

        //验证并保存数据
        if (false === $UserModel->save($data))
        {
            return $this->error($UserModel->getError());
        }

        return $this->success('注册成功', Common::url('/loginInfo'));
    }

}
