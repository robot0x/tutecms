<?php
namespace app\model;
/**
 * 用户组 - 字段 权限
 * 该表与其它权限表相反，如果存在记录，则表示不能显示该字段
 */
class AccessUserGroupFieldModel extends ModelModel
{   
    /**
     * 判断当前用户是否可以访问该字段
     * @param    integer                  $fieldId 字段id
     * @return   bool                            
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-18T16:35:03+0800
     */
    static public function checkCurrentUserIsAllowedByFieldIdAction($fieldId = 0, $action = '') 
    {
        $userGroupName = UserModel::getCurrentUserModel()->getData('user_group_name');
        return self::checkIsAllowedByUserGroupNameAndFieldIdAction($userGroupName, $fieldId, $action);
    }

    /**
     * 判断是否可以访问该字段
     * 该表与其它权限表相反，如果存在记录，则表示不能显示该字段
     * @param    string                   $userGroupName 用户组名称
     * @param    int                   $fieldId       字段ID
     * @return   bool                                  能访问true, 不能访问false
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-18T16:35:31+0800
     */
    static public function checkIsAllowedByUserGroupNameAndFieldIdAction($userGroupName, $fieldId, $action)
    {
        $map = [];
        $map['user_group_name'] = $userGroupName;
        $map['field_id'] = $fieldId;
        $map['action']   = $action;
        if ('' === self::get($map)->getData('user_group_name')) {
            return false;
        } else {
            return true;
        }
    }
}