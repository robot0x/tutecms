<?php
namespace app\model;
/**
 * 用户组 - 字段 权限
 * 该表与其它权限表相反，如果存在记录，则表示不能显示该字段
 */
class AccessUserGroupFieldModel extends ModelModel
{   
    protected $autoWriteTimestamp = false;              // 关闭自动时间戳
    
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

    /**
     * 更新字段用户组权限信息
     * @param    int                   $blockId             
     * @param    array                   $userGroupNames 用户组
     * @return   [type]                                   [description]
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-22T21:04:47+0800
     */
    public function updateByFieldIdUserGroupNames($fieldId, $userGroupNames) {
        $map = ['field_id' => $fieldId];
        $this->where($map)->delete();

        $datas = array();
        $data = [];
        $data['field_id'] = $fieldId;
        foreach ($userGroupNames as $key => $value) {
            foreach ($userGroupNames[$key] as $key1 => $value1) {
                $data['user_group_name'] = $key;
                $data['action'] = $key1;
                array_push($datas, $data);
            }
        } 

        $this->saveAll($datas);
    }
}