<?php
namespace app\block\controller;
use app\Common;
use app\model\MenuModel;                        // 菜单模型
/**
 * BreakCrumb
 */
class BreadCrumbController extends BlockController
{
    protected $currentMenuModel         = null;         // 当前菜单
    public function index() {
        $MenuModels = $this->currentMenuModel->getFatherMenuModleTree(false);

        // 获取输出的深度，从而进行数组POP
        $beginDepth = $this->config['beginDepth'];
        for ($i = 0; $i < $beginDepth; $i++) {
            array_pop($MenuModels);
        }
        
        $this->assign('MenuModels', array_reverse($MenuModels));
        return $this->fetch();
    }
}