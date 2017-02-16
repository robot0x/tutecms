<?php
namespace app\admin\controller;
use app\model\UserGroupModel;                           // 用户组
use app\model\BlockModel;                               // 区块
use app\model\MenuModel;                                // 菜单
use app\model\BlockTypeModel;                           // 区块类型
use app\model\PositionModel;                            // 位置
use app\model\AccessUserGroupBlockModel;                // 权限：用户组-区块
use app\model\AccessMenuBlockModel;                     // 权限：菜单-区块
use app\Common;                                         // 通用函数库
use app\model\ComponentModel;                           // 组件
use app\model\ThemeModel;                               // 主题
use app\model\ExtendModel;                              // 扩展

class ExtendController extends AdminController
{
    public function indexAction()
    {
        // 将区块类型信息传入V层
        $BlockTypeModels = BlockTypeModel::paginate();
        $this->assign('BlockTypeModels', $BlockTypeModels);

        // 将组件信息传入V层
        $Components = ComponentModel::paginate();
        $this->assign('Components', $Components);

        // 将主题信息传入V层
        $ThemeModels = ThemeModel::paginate();
        $this->assign('ThemeModels', $ThemeModels);

        return $this->fetch();
    }

    public function createAction()
    {
        return 'hello';
    }

    public function scanAction () {
        $extendPaths = ['component', 'plugin', 'block', 'field', 'filter', 'theme'];
        $extends = [];
        foreach ($extendPaths as $extendPath) {
            $extends[$extendPath] = [];
            $path = APP_PATH . $extendPath . DS . 'install' . DS;
            $dir = new \DirectoryIterator($path);
            foreach ($dir as $fileinfo) {
                if (!$fileinfo->isDot()) {
                    $install = include $path . $fileinfo->getFilename();
                    $install['name'] = $fileinfo->getBasename('Install.php');
                    array_push($extends[$extendPath], $install);
                }
            }
        }
        $this->assign('extends', $extends);
        $this->assign('ExtendModel', new ExtendModel);
        return $this->fetch();
    }

    public function installAction ($type, $name) {
        // 扩展类型列表
        $types = ['component', 'plugin', 'block', 'field', 'filter', 'theme'];
        if (!in_array($type, $types)) {
            $this->error('未接收到正确的type值');
        };

        // 拼接需要读取的文件信息
        $string = APP_PATH . $type . DS . 'install' . DS . $name . 'Install.php';

        // 读取文件
        try {
            $installInfo = include $string;
        } catch (Exception $e) {
            $this->error('配置文件信息错误');
        }

        // 判断返回的数据是否为数组
        if (!is_array($installInfo)) {
            $this->error('配置文件必须返回一个数组');
        }

        // 检查配置信息中是否包含有必备的字段
        $checkKeys = ['title', 'description'];
        $extend = [];
        foreach ($checkKeys as $checkKey) {
            if (!array_key_exists($checkKey, $installInfo)) {
                return $this->error('缺少必要的字段');
            } else if (!is_string($installInfo[$checkKey])) {
                return $this->error('配置值必须为字符串');
            } else {
                $extend[$checkKey] = $installInfo[$checkKey];
            }
        }
        $extend['name'] = $name;

        // todo:新建扩展表，将所有的扩展类型全部写在扩展表中
        $ExtendModelImpl = null;
        if ($type === 'component') {
            $ExtendModelImpl = new ComponentModel;
        } else if ($type === 'plugin') {
            $ExtendModelImpl = new PluginTypeModel;
        } else if ($type === 'block') {
            $ExtendModelImpl = new BlockTypeModel;
        } else if ($type === 'field') {
            $ExtendModelImpl = new FieldTypeModel;
        } else if ($type === 'filter') {
            $ExtendModelImpl = new FilterTypeModel;
        } else if ($type === 'theme') {
            $ExtendModelImpl = new FilterTypeModel;
        } 

        $ExtendModelImpl->data($extend)->save();

    }
}
