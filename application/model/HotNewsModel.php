<?php
namespace app\model;

use think\Db;
use think\Cache;

class HotNewsModel {
    /**
     * 获取具有权限的内容模型列表
     * @param    string                   $userGroupName 用户组名称
     * @param    string                   $action        触发器
     * @param    integer                  $count         显示的文章个数
     * @param    integer                  $cacheTime     缓存时间
     * @return                                     array
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-27T14:46:55+0800
     */
    static public function getAccessContentModelsByUserGroupNameActionCountCacheTime($userGroupName, $action = 'index', $count = 10, $cacheTime = 300) {
        // 进行缓存设定
        $hashKey = 'app\modelHotNewsModel::getAccessContentModelsByUserGroupNameActionCountCacheTime.' . $userGroupName . '.' . $action;
        if (!$ContentModels = Cache::get($hashKey)) {
            // 进行视图查询
            $contents = Db::view('content','id,hit')
                ->view('access_user_group_menu','action,user_group_name','access_user_group_menu.menu_id=content.menu_id','LEFT')
                ->where('action','=',$action)
                ->where('user_group_name', '=', $userGroupName)
                ->order('content.hit desc')
                ->limit(0, $count)
                ->select();
            
            // 循环新建对象，并PUSH到数组当中
            $ContentModels = [];
            foreach ($contents as $content) {
                array_push($ContentModels, ContentModel::get($content['id']));
            }
            Cache::set($hashKey, $ContentModels, $cacheTime);
        }
        

        return $ContentModels;
    }
}