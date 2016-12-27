<?php
namespace app\model;
use think\Exception;
/**
 * 用户组 - 菜单 权限
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
            return false;
        } else {
            return true;
        }
    }
}