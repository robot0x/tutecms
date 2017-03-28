<?php
namespace app\block\controller;

use app\model\UserModel;
use app\model\MenuModel;
use app\model\HotNewsModel;

class HotNewsController extends BlockController {
    public function index() {
        // 取当前登陆的用户组
        $UserModel = UserModel::getCurrentUserModel();                  
        $userGroupName = $UserModel->UserGroupModel()->getData('name');

        // 取配置信息
        $count = $this->config['count'];
        $cacheTime = $this->config['cacheTime'];

        // 设置action，并获取文章模型列表
        $action = 'index';
        $ContentModels = HotNewsModel::getAccessContentModelsByUserGroupNameActionCountCacheTime($userGroupName, $action, $count, $cacheTime);

        $this->assign('ContentModels', $ContentModels);
        return $this->fetch();
    }
}