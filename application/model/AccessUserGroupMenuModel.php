<?php
namespace app\model;
use think\Exception;

/**
 * 用户组 - 菜单 权限
 * 数据表中存在记录：无此权限
 * 数据表中不存在记录：有此权限
 */
class AccessUserGroupMenuModel extends ModelModel
{
    protected $autoWriteTimestamp = false;
    
    /**
     * 获取当前用户 是否拥有当前菜单的 action权限
     * @param    string                   $action 触发器名
     * @return   boolean                           true:拥有权限； false:不拥有权限
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2016-12-27T08:34:47+0800
     */
    static public function checkCurrentUserCurrentMenuIsAllowedByAction($action)
    {
        $map = [];
        $map['user_group_name'] = UserModel::getCurrentUserModel()->getData('user_group_name');
        $map['menu_id']         = MenuModel::getCurrentMenuModel()->getData('id');
        $map['action']          = $action;
        if ('' !== self::get($map)->getData('action')) {
            return true;
        } else {
            return false;
        }
    }


    /**
     * 通过 二维数组 中定义的用户组名与action名 更新某个菜单ID的权限
     * @param    MenuModel                   $menuId        菜单ID
     * @param                       $groupAccesses 
     * @return                                     
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2016-12-29T08:45:21+0800
     */
    static public function updateAccessByMenuModelGroupsActions(MenuModel $MenuModel, $groupsActions) {
        // 清空关于此菜单的所有权限记录
        $self = new self();
        $map = [];
        $map['menu_id'] = (int)$MenuModel->getData('id');
        $self->where($map)->delete();

        // 查找该菜单对应组件的所有的action
        $routes = $MenuModel->ComponentModel()->getSampleRoute();
        // 取出所有的用户组信息
        $userGroupModels = UserGroupModel::all(['is_delete' => 0]);

        // 使用 用户组信息与action信息，拼接二维数组，并在接拼过程中，去除 groupsActions 已存在的键值
        $accesses = [];
        $access = ['menu_id' => $MenuModel->getData('id')];
        foreach($groupsActions as $groupName => $actions) {
            $access['user_group_name'] = $groupName;
            foreach ($actions as $action => $on) {
                $access['action'] = $action;
                array_push($accesses, $access);
            }
        }

        $self->saveAll($accesses);
        unset($self);
    }
}