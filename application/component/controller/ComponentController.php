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

    public function __construct(Request $request = null)
    {
        // 取组件对应的当前菜单。及组件的配置、过滤器信息.
        $this->currentMenuModel = MenuModel::getCurrentMenuModel();
        // 取当前登陆用户信息
        $this->currentFrontUserModel = UserModel::getCurrentFrontUserModel();
        // 获取当前主题信息
        $this->currentThemeModel = ThemeModel::getCurrentThemeModel();
        // 设置视图输出的__THEME__ 该操作，必须在父类初始化以前，因为父类在初始化时，会自动调用config中的信息
        define('__THEME__', __PUBLIC__ . DS . 'theme' . DS . $this->currentThemeModel->getData('name'));

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
        // 获取配置信息的模板后缀
        $viewSuffix = Config::get('template.view_suffix');

        // 获取主题模板路径
        $themeTemplatePath = APP_PATH . 
            'theme' . DS . 
            $this->currentThemeModel->getData('name') . DS .
            'component' . DS .
            $this->Request->controller() . DS . $this->Request->action() . '.';

        // 判断是否对当前菜单进行了重写
        $themeTemplate      = $themeTemplatePath . $this->currentMenuModel->getData('id') . '.' . $viewSuffix;
        $themeTemplateCss   = $themeTemplatePath . $this->currentMenuModel->getData('id') . '.css.' . $viewSuffix;
        $themeTemplateJs    = $themeTemplatePath . $this->currentMenuModel->getData('id') . '.js.' . $viewSuffix;

        // 路径格式化，如果文件不存在，则返回false
        $themeTemplate      = realpath($themeTemplate);
        $themeTemplateCss   = realpath($themeTemplateCss);
        $themeTemplateJs    = realpath($themeTemplateJs);

        // 未对菜单进行重写，则尝试获取当前组件的重写模板
        if (false === $themeTemplate) {
            $themeTemplate = $themeTemplatePath . $viewSuffix;
            $themeTemplate = realpath($themeTemplate);
        }
        if (false === $themeTemplateCss) {
            $themeTemplateCss = $themeTemplatePath . 'css.' . $viewSuffix;
            $themeTemplateCss = realpath($themeTemplateCss);
        }
        if (false === $themeTemplateJs) {
            $themeTemplateJs = $themeTemplatePath . 'js.' . $viewSuffix;
            $themeTemplateJs = realpath($themeTemplateJs);
        }

        /**
         * $MCA = array(0 => 'module', 1 => 'controller', 2 => 'action');
         * @var [type]
         */
        $MCA = Request::instance()->dispatch()['module'];         
        
        // 主题文件存在，则调用主题文件进行渲染
        if (false !== $themeTemplate)
        {   
            $template = $themeTemplate;
        } else {
            $template = $MCA[0] . '@' . $MCA[1] . DS . $MCA[2];
        }

        //  CSS
        if (false !== $themeTemplateCss)
        {   
            $templateCss = $themeTemplateCss;
        } else {
            $templateCss = $MCA[0] . '@' . $MCA[1] . DS . $MCA[2] . '.css';
        }

        // JS
        if (false !== $themeTemplateJs)
        {   
            $templateJs = $themeTemplateJs;
        } else {
            $templateJs = $MCA[0] . '@' . $MCA[1] . DS . $MCA[2] . '.js';
        }

        // 非开发模式下，打印当前MCA触发信息
        if (Config::get('app_debug')) {
            trace('当前调用组件：' . $MCA[1] . '->' . $MCA[2], 'component');
            trace('当前组件模板：' . $template, 'component');
        }

        // 尝试渲染js及css
        $css = $js = '';
        try {
            $css = $this->view->fetch($templateCss);
            trace('当前组件CSS模板：' . $templateCss, 'component');
            $js = $this->view->fetch($templateJs);
            trace('当前组件JS模板：' . $templateJs, 'component');
        } catch (\Exception $e) {
            
        }

        // 获取当前主题
        return $this->view->fetch($template, $vars, $replace, $config) . $css . $js;
    }
}