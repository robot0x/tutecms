<?php
namespace app\component\controller;
use think\Controller;
use think\Request;                              // think请求内置类
use think\Config;                               // 配置
use think\Session;

use app\Common;                                 // 通用接口
use app\component\ComponentInterface;           // 组件接口
use app\model\ComponentModel;                   // 组件
use app\model\MenuModel;                        // 菜单模型
use app\model\UserModel;                        // 用户
use app\model\ThemeModel;                       // 主题

class ComponentController extends Controller
{
    protected $config                   = null;         // 配置信息
    protected $fileter                  = null;         // 过滤器信息
    protected $Model                    = null;         // 模型
    protected $currentMenuModel         = null;         // 当前菜单
    protected $currentFrontUserModel    = null;         // 当前前台登陆用户
    protected $Request                  = null;         // 请求信息
    protected $currentThemeModel        = null;         // 当前主题
    protected $sampleConfig;                            // 配置（简）

    public function __construct(Request $request = null)
    {
        // 取组件对应的当前菜单。及组件的配置、过滤器信息.
        $this->currentMenuModel = MenuModel::getCurrentMenuModel();

        // 开发模式下，输出当前菜单信息
        if (Config::get('app_debug')) {
            trace('当前调用菜单ID：' . $this->currentMenuModel->getData('id'), 'debug');
        }

        // 取当前登陆用户信息
        $this->currentFrontUserModel = UserModel::getCurrentFrontUserModel();
        // 获取当前主题信息
        $this->currentThemeModel = ThemeModel::getCurrentThemeModel();
        // 设置视图输出的__THEME__ 该操作，必须在父类初始化以前，因为父类在初始化时，会自动调用config中的信息
        if (!defined ( '__THEME__' )) {
            define('__THEME__', __PUBLIC__ . DS . 'theme' . DS . $this->currentThemeModel->getData('name'));
        }

        // 在进行assign操作前进行父类初始化
        parent::__construct();

        // 获取当前请求信息
        $this->Request = Request::instance();
        // 根据action，计算访问权限值index->list
        $action = $this->Request->action();
        // 根据路由表中的action值，查找权限表,做出权限判断
        if (!$this->currentFrontUserModel->UserGroupModel()->isAllowedByMenuModelAction($this->currentMenuModel, $action))
        {
            return $this->error('您无权限访问该页面或您访问的页面不存在. TODO:404页面', url('@/'));
        }

        // 清空原来的tokens.有了安全性，同时也要求我们不能出现多余的默认请求。
        Common::clearTokens();


        // 传Common供前台使用
        $this->assign('Common', new Common);

        // 取配置信息、过滤器信息
        $this->config = $this->currentMenuModel->getConfig();
        $this->filter = $this->currentMenuModel->getFilter();
        $this->filterModels = $this->currentMenuModel->getFilterModels();

        // 配置信息，过滤器信息送入V层
        $this->assign('config', $this->config);
        $this->assign('filterModels', $this->filterModels);
        $this->assign('currentMenuModel', $this->currentMenuModel);
    }

    /**
     * 获取简单配置
     * @param    string                   $key 键值
     * @return   [type]                        [description]
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-20T12:30:36+0800
     */
    public function getSampleConfig($configKey = null) {
        if (null === $this->sampleConfig) {
            $this->sampleConfig = [];
            foreach ($this->config as $key => $config) {
                $this->sampleConfig[$key] =  $config['value'];
            }
        }

        // 传入键值，则返回具体信息，否则返回数组信息
        if (null !== $configKey) {
            $configKey = (string)$configKey;
            if (array_key_exists($configKey, $this->sampleConfig)) {
                return $this->sampleConfig[$configKey];
            } else {
                return '';
            }
        } else {
            return $this->sampleConfig;            
        }
    }
    /**
     * 重写 加载模板输出
     * @access protected
     * @param string    $template 模板文件名
     * @param array     $vars     模板输出变量
     * @param array     $replace     模板替换
     * @param array     $config     模板参数
     * @return mixed
     */
    protected function fetch($template = '', $vars = [], $replace = [], $config = [])
    {
        /**
         * $MCA = array(0 => 'module', 1 => 'controller', 2 => 'action');
         * @var [type]
         */
        $MCA = Request::instance()->dispatch()['module'];  
        $module = 'component';
        $controller = $MCA[1];
        $action = $MCA[2];
        
        return Common::fetchByMCA($this->view, $module, $controller, $action, $template, $vars, $replace, $config);
    }
}