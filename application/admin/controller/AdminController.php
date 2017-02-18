<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use app\model\UserModel;
use think\Session; 

class AdminController extends Controller
{
    protected $currentUserModel = null;
    protected $backUrl = null;

    /**
     * 后台模块统一加登录验证
     * @Author   litian,                  1181551049@qq.com
     * @DateTime 2016-09-23T17:04:38+0800
     */
    public function __construct()
    {
        parent::__construct();

        // 将请求信及当URL信息息传入V层
        $this->assign('Request', Request::instance());
        $this->assign('url', urlencode(Request::instance()->url()));
        $this->backUrl = Request::instance()->param('backUrl');
        $this->assign('backUrl', urlencode($this->backUrl));

        //获取用户登录时间
        $loginTime = session('loginTime');

        if (false === UserModel::isLogin() || (time() - $loginTime > 30 * 60))
        {
            return $this->error('请登录', url('Login/index'));
        } else {
            session('loginTime', time());
        }

    }
}
