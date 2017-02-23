<?php
namespace app\model;
/**
 * 用户组 - 组件 权限
 */
class AccessUserGroupPluginModel extends ModelModel
{
    /**
     * 判断当前用户是否拥有插件的 ACTION权限
     * @param    integer                  $pluginId 插件ID
     * @param    string                   $action   触发器
     * @return   boolean                             
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-23T13:27:59+0800
     */
	static public function checkCurrentUserIsAllowedByPluginIdAndAction($pluginId = 0, $action = '') {
        $userGroupName = UserModel::getCurrentUserModel()->getData('user_group_name');
        return self::checkIsAllowedByUserGroupNameAndPluginIdAndAction($userGroupName, $pluginId, $action);
    }


    /**
     * 较验权限
     * @param    string                   $userGroupName 用户组名
     * @param    int                   $pluginId       插件id
     * @param    string                   $action        action名
     * @return   bool                                  
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-14T17:03:49+0800
     */
    static public function checkIsAllowedByUserGroupNameAndPluginIdAndAction($userGroupName, $pluginId, $action)
    {
        $map = [];
        $map['user_group_name'] = $userGroupName;
        $map['plugin_id'] = $pluginId;
        $map['action']  = $action;
        if ('' === self::get($map)->getData('plugin_id')) {
            return false;
        } else {
            return true;
        }
    }
}