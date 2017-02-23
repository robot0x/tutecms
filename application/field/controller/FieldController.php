<?php
namespace app\field\controller;

use think\Controller;
use app\Common;
use think\Loader;
use think\Request;
use think\Config;

use app\model\ThemeModel;                           // 主题
use app\model\AccessUserGroupFieldModel;            // 用户组字段权限
use app\model\FieldModel;                           // 字段模型

class FieldController extends Controller
{
    protected $FieldDataXXXModel = null;                    // 某个扩展字段的模型
    protected $FieldModel;                                  // 字段模型
    private $nameTag;                                       // 字段输出时的 name 标签
    private $token;                                         // token
    protected $config;                                      // 配置信息
    protected $currentThemeModel        = null;         // 当前主题

    public function __construct()
    {
        // 取出当前主题信息，供模板渲染使用
        $this->currentThemeModel = ThemeModel::getCurrentThemeModel();
        parent::__construct();
    }

    /**
     * 生成前台可直接调用URL地址
     * @param    string                   $action 触发器
     * @param    array                   $param  GET参数
     * @return   string                           
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-23T19:00:15+0800
     */
    protected function url($action = 'index', $param = []) {
        return url('admin/call/field?fieldId=' . $this->FieldDataXXXModel->FieldModel()->getData('id') . '&action=' . $action, $param);
    }

    /**
     * 设置FieldModel, 为admin/call提供了set接口
     * @param    FieldModel               $FieldModel 字段模型
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-23T19:00:44+0800
     */
    public function setFieldModel(FieldModel $FieldModel) {
        $this->FieldModel = $FieldModel;
        return $this;
    }

    /**
     * 正式渲染字段模型的初始化工作，主要完成对CSS，JS信息的抓取。对其它配置信息的抓取。
     * @param    某个字段类型                   &$FieldDataXXXModel 
     * @return                                          
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-26T13:56:15+0800
     */
    public function init(&$FieldDataXXXModel = null)
    {
        $this->FieldDataXXXModel    = $FieldDataXXXModel;

        // 送入依赖css, 用于在footer中进行统一引用。
        if (array_key_exists('css', $FieldDataXXXModel->FieldModel()->getSampleConfig())) {
            Common::addCss($FieldDataXXXModel->FieldModel()->getSampleConfig()['css']);
        }

        // 送入依赖js, 用于在footer中进行统一引用。
        if (array_key_exists('js', $FieldDataXXXModel->FieldModel()->getSampleConfig())) {
            Common::addJs($FieldDataXXXModel->FieldModel()->getSampleConfig()['js']);
        }

        // 传入配置信息
        $this->config = $FieldDataXXXModel->FieldModel()->getSampleConfig();
        $this->assign('config', $this->config);
        $this->assign('FieldDataXXXModel', $FieldDataXXXModel);
        $this->assign('randId', rand(1,1023));    // 建立1个1023以内的随机数，防止ID重复
    }


    /**
     * 渲染字段模型（输出字段模型对应的HTML标签）
     * 被 FieldModel的render()函数 调用
     * @param    FieldDataXXXModel                   &$FieldDataXXXModel 字段数据模型
     * @return   String                                    对应的html标签代码
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-05T08:32:24+0800
     */
    static public function renderFieldDataModel(&$FieldDataXXXModel, $action)
    {
        // 首先对权限进行判断,不存在权限，则直接返回'' 
        if (!AccessUserGroupFieldModel::checkCurrentUserIsAllowedByFieldIdAction($FieldDataXXXModel->getData('field_id'), $action)) {
            return '';
        }

        $typeName = $FieldDataXXXModel->FieldModel()->getData('field_type_name');
        $className = 'app\field\controller\\' . ucfirst($typeName) . 'Controller';
        if (class_exists($className)) {
            // 实例化字段,然后调用init()进行实始化 ，调用fetchHtml()进行渲染
            $FieldXXXController = new $className();
            $FieldXXXController->init($FieldDataXXXModel);
            return $FieldXXXController->$action();
        } else {
            return 'field type is ' . $typeName . '. But ' . $className . '::' . 'index not found!';
        }
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
        $module = 'field';
        $controller = Common::getControllerName(get_called_class());
        $action = debug_backtrace()[1]['function'];
        
        return Common::fetchByMCA($this->view, $module, $controller, $action, $template, $vars, $replace, $config, $this->FieldDataXXXModel);
    }

    /**
     * 前台直接调用接口。前台生成URL后，直接触发该函数，该函数自动调用对应的ACTION
     * @param    int                   $fieldId 字段ID
     * @param    string                   $action  触发器
     * @return                               
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-23T19:01:43+0800
     */
    static public function call($fieldId, $action) {
        $FieldModel = FieldModel::get($fieldId);
        $className = 'app\field\controller\\' . $FieldModel->getData('field_type_name') . 'Controller';
        $result = '';
        try  {
            // 实例化类 并调用
            if (class_exists($className)) {
                $Object = new $className;
                $Object->setFieldModel($FieldModel);
                if (method_exists($Object, $action)) {
                    $result = $Object->$action(); 
                }
            }
            
        } catch(\Exception $e) {
            if (config('app_debug')) {
                throw $e;
            }
        } 

        return $result;
    } 
}