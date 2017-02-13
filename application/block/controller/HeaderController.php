<?php
namespace app\block\controller;
use app\model\MenuModel;                    // 菜单
use think\Cache;                            // 缓存
use think\Request;                          // 请求

use app\model\UserModel;                    // 用户
use app\Common;                             // 通用类
use app\model\BlockModel;                   // 区块
/**
 * 网页头
 */
class HeaderController extends BlockController
{
    public function index () {
        return $this->fetch();
    }
}