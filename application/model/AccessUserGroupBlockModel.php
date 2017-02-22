<?php
namespace app\model;
/**
 * 用户组 - 区块 权限
 */
class AccessUserGroupBlockModel extends ModelModel
{
    protected $autoWriteTimestamp = false;

    /**
     * 检验当前登陆用户的相关权限
     * @param    integer                  $blockId 区块id
     * @param    string                   $action  action名
     * @return   bool                            
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-14T17:03:15+0800
     */
    static public function checkCurrentUserIsAllowedByBlockIdAndAction($blockId = 0, $action = '')
    {
        $userGroupName = UserModel::getCurrentUserModel()->getData('user_group_name');
        return self::checkIsAllowedByUserGroupNameAndBlockIdAndAction($userGroupName, $blockId, $action);
    }

    /**
     * 较验权限
     * @param    string                   $userGroupName 用户组名
     * @param    int                   $blockId       区块id
     * @param    string                   $action        action名
     * @return   bool                                  
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-14T17:03:49+0800
     */
    static public function checkIsAllowedByUserGroupNameAndBlockIdAndAction($userGroupName, $blockId, $action)
    {
        $map = [];
        $map['user_group_name'] = $userGroupName;
        $map['block_id'] = $blockId;
        $map['action']  = $action;
        if ('' === self::get($map)->getData('block_id')) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 更新区块用户组权限信息
     * @param    int                   $blockId             
     * @param    array                   $userGroupNames 用户组
     * @return   [type]                                   [description]
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-22T21:04:47+0800
     */
    public function updateByBlockIdUserGroupNames($blockId, $userGroupNames) {
        $map = ['block_id' => $blockId];
        $this->where($map)->delete();

        $datas = array();
        foreach ($userGroupNames as $key => $value) {
            foreach ($userGroupNames[$key] as $key1 => $value1) {
                $data = [];
                $data['block_id'] = $blockId;
                $data['user_group_name'] = $key;
                $data['action'] = $key1;
                array_push($datas, $data);
            }
        } 
        $this->saveAll($datas);
    }
        
}
