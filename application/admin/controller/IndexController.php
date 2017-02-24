<?php
namespace app\admin\controller;

use think\Cache;                    // 缓存

class IndexController extends AdminController
{
    public function indexAction()
    {
        return $this->fetch();
    }

    public function cacheClearAction() {
        if (Cache::clear()) {
            return $this->success('操作成功');
        } else {
            return $this->error('系统发生错误');
        }
    }
}
