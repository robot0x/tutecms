<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Config;

use app\model\AccessUserGroupBlockModel;        // 用户组区块权限
use app\model\AccessUserGroupPluginModel;       // 用户组插件权限
use app\model\AccessUserGroupFieldModel;        // 用户组字段权限
use app\model\BlockModel;                       // 区块模型
use app\block\controller\BlockController;       // 区块根控制器
use app\plugin\controller\PluginController;     // 插件控制器
use app\field\controller\FieldController;      // 字段控制器

class CallController extends Controller {
    protected $isAjax = false;

    public function __construct(Request $request = null) {
        if (Request::instance()->isAjax() || array_key_exists('isAjax', Request::instance()->param())) {
            $this->isAjax = true;
            Config::set('app_trace', false);
        }
        parent::__construct($request);
    }

    private function accessNotAllow() {
        if ($this->isAjax) {
            $data['status'] = 'error';
            $data['message'] = '您无此操作权限';
            header('Content-type: application/json');
            echo json_encode($data);
        } else {
            $this->error('您无此操作权限');
        }
    }


    /**
     * 调用字段
    **/
    public function blockAction($blockId = 0, $action = 'index'){
        if (!AccessUserGroupBlockModel::checkCurrentUserIsAllowedByBlockIdAndAction($blockId, $action)) {
            return $this->accessNotAllow();
        }

        return BlockController::call($blockId, $action);
    }

    public function pluginAction($pluginId = 0, $action = 'index') {
        if (!AccessUserGroupPluginModel::checkCurrentUserIsAllowedByPluginIdAndAction($pluginId, $action)) {
            return $this->accessNotAllow();
        }

        return PluginController::call($pluginId, $action);
    }

    public function fieldAction($fieldId = 0, $action = 'index') {
        if (!AccessUserGroupFieldModel::checkCurrentUserIsAllowedByFieldIdAction($fieldId, $action)) {
            return $this->accessNotAllow();
        }

        return FieldController::call($fieldId, $action);
    }
}