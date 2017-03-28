<?php
namespace app\block\controller;

use think\Controller;
use think\Config;
use think\Request;

use app\Common;
use app\model\BlockModel;                       // 区块 模型
use app\model\BlockMenuModel;                   // 区块-菜单 模型
use app\model\MenuModel;                        // 菜单模型
use app\model\ThemeModel;                       // 主题
use app\model\UserModel;                        // 用户


class BlockController extends Controller
{
    static private $instance            = null;

    protected $config                   = null;         // 配置信息
    protected $filter                   = null;         // 过滤器信息
    protected $BlockModel               = null;         // 区块模型
    protected $currentThemeModel        = null;         // 当前主题
    protected $requestController        = '';           // 请求控制器信息
    protected $token                    = null;         // token

    public function __construct()
    {
        // 取出当前主题信息，供模板渲染使用
        $this->currentThemeModel = ThemeModel::getCurrentThemeModel();
        parent::__construct();

        // 传入Common，供模板渲染输出区块css,js使用
        $this->assign('Common', new Common);
    }

    /**
     * 生成直接直接显示在前台的URL地址
     * @param    string                   $action 触发器
     * @param    array                $param  其它参数
     * @return   
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-23T19:44:59+0800
     */
    protected function url($action = 'index', $param = []) {
        return url('admin/call/block?blockId=' . $this->BlockModel->getData('id') . '&action=' . $action, $param);
    }

    static public function instance(BlockModel $BlockModel)
    {
        // todo: 
        // new self() 不管是谁继承的我，实例化的时候，只实例化当前类。
        // new static() 如果现在是其它继承于我的类进行调用，实例化的为继承我的那个类
        $Object = new static();
        $Object->BlockModel = $BlockModel;

        // 取配置过滤器信息
        $Object->config = $BlockModel->getSampleConfig();

        // 送配置 过滤器至V层
        $Object->assign('config', $Object->config);
        $Object->assign('BlockModel', $BlockModel);

        return $Object;
    }

    /**
     * 初始化，供Cx中position标签调用
     * @param  string positionName 位置名字
     * @return string       html文本
     * @author panjie
     */ 
    static public function init($positionName)
    {
        // 找出所有在当前position下的block
        $BlockModel = new BlockModel;
        $blockModels = $BlockModel->getActiveListsByPositionName($positionName);

        $resultHtml = '';
        
        // 依次进行渲染，拼接
        foreach ($blockModels as $blockModel)
        {
            $className = 'app\block\controller\\' . $blockModel->block_type_name . 'Controller';
            try 
            {
                // 实例化类 并调用
                $Object = call_user_func_array([$className, 'instance'], [$blockModel]); 
                $result = $Object->index(); 
                if ($result)
                {
                    $resultHtml .= $result;
                }
            } catch(\Exception $e) {
                if (config('app_debug'))
                {
                    throw $e;
                }
            } 
        }
        
        // 返回拼接后的字符串
        echo $resultHtml;
    }


    static public function call($blockId, $action) {
        $BlockModel = BlockModel::get($blockId);
        $className = 'app\block\controller\\' . $BlockModel->getData('block_type_name') . 'Controller';
        try 
        {
            // 实例化类 并调用
            $Object = call_user_func_array([$className, 'instance'], [$BlockModel]); 
            if (method_exists($Object, $action)) {
                $result = $Object->$action(); 
            }
            
        } catch(\Exception $e) {
            if (config('app_debug')) {
                throw $e;
            }
        } 

        return $result;
    } 


    /**
     * 加载模板输出
     * @access protected
     * @param string    $template 模板文件名
     * @param array     $vars     模板输出变量
     * @param array     $replace     模板替换
     * @param array     $config     模板参数
     * @return mixed
     */
    protected function fetch($template = '', $vars = [], $replace = [], $config = [])
    {
        $module = 'block';
        $controller = Common::getControllerName(get_called_class());
        $action = debug_backtrace()[1]['function'];
        
        return Common::fetchByMCA($this->view, $module, $controller, $action, $template, $vars, $replace, $config, $this->BlockModel);
    }
}