<?php
/**
 * 当前菜单的二、三级菜单树
 * User: panjie
 * Date: 17/3/23
 * Time: 下午4:04
 */

namespace app\block\controller;


use app\model\MenuModel;
use app\model\UserModel;

class SubMenuController extends BlockController
{
    /**
     * @return mixed
     * Create by panjie@yunzhiclub.com
     */
    public function index()
    {

        // 取包含当前菜单的菜单树
        $fatherMenuTree = MenuModel::getCurrentMenuModel()->getFatherMenuModelTree();

        // 判断当前菜单树的总长度，如长度未达到设置的 开始根菜单 级数。则返回空
        $beginLevel = (int)$this->config['beginLevel'];
        if ($beginLevel > count($fatherMenuTree)) {
            return '';
        } else {
            $beginMenuModel = $fatherMenuTree[$beginLevel];
        }

        // 获取菜单列表并传入V层
        $menuModels = MenuModel::getAvailableSonMenuModelsByPidUserGroupModel($beginMenuModel->getData('id'), UserModel::getCurrentUserModel()->UserGroupModel());
        $this->assign('menuModels', $menuModels);

        return $this->fetch();
    }
}