<?php
namespace app\block\controller;
use app\model\MenuModel;                    // 菜单
use think\Cache;                            // 缓存
use think\Request;                          // 请求

use app\model\UserModel;                    // 用户
use app\Common;                             // 通用类
use app\model\BlockModel;                   // 区块
/**
 * 菜单
 */
class MenuController extends BlockController
{
	public function index()
	{
        // 取配置信息中的父菜单ID
        $pid = $this->config['pid'];

        // 取当前菜单类型下可见的菜单列表
        $menuModels = MenuModel::getAvailableSonMenuModelsByPidUserGroupModel($pid, UserModel::getCurrentUserModel()->UserGroupModel());
        $this->assign('menuModels', $menuModels);
        $this->assign('length', count($menuModels));
        
        $this->assign('User', UserModel::getCurrentUserModel());
        $html = $this->fetch();
        

        return $html;
	}

    /**
     * 编辑区块，用于apiController根据token进行动态调用
     * @param    array                    $param menuId:生成token的用户触发的菜单 action:生成token时用户触发的action
     * @return   html                          
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-08T18:41:54+0800
     */
    static public function edit($param = []) {

    }
}