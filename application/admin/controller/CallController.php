<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;

use app\model\AccessUserGroupBlockModel;        // 用户组区块权限
use app\model\AccessUserGroupPluginModel;       // 用户组插件权限
use app\model\AccessUserGroupFieldModel;        // 用户组字段权限
use app\model\BlockModel;                       // 区块模型
use app\block\controller\BlockController;       // 区块根控制器

class CallController extends Controller {
    /**
     * 调用字段
    **/
    public function blockAction($id = 0, $action = 'index'){
        if (!AccessUserGroupBlockModel::checkCurrentUserIsAllowedByBlockIdAndAction($id, $action)) {
            return $this->error('您无此操作权限');
        }

        return BlockController::call($id, $action, Request::instance()->param());
    }

    public function pluginAction($id = 0, $action = 'index') {
        if (!AccessUserGroupPluginModel::checkCurrentUserIsAllowedByPluginIdAndAction($id, $action)) {
            return $this->error('您无此操作权限');
        }
    }

    public function fieldAction($id = 0, $action = 'index') {
        if (!AccessUserGroupFieldModel::checkCurrentUserIsAllowedByFieldIdAction($id, $action)) {
            return $this->error('您无此操作权限');
        }
    }
}