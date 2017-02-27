<?php
namespace app\test\controller;
use app\model\MenuModel;
use app\model\ContentModel;

use app\Common;
class addMenuIdForContentController {
    public function addMenuIdAction () {
        // 取所有菜单类型为ContentList和 Content的菜单
        $map = [];
        $map['component_name'] = 'ContentList';
        $MenuModels = MenuModel::all($map);

        $this->setMenuId($MenuModels);

        $map['component_name'] = 'Content';
        $MenuModels = MenuModel::all($map);
        $this->setMenuId($MenuModels);
        // 找出所有的新闻的content_type
        // 更新menuid 
    }

    private function setMenuId($MenuModels) {
        // 找出config中的categoryType
        foreach ($MenuModels as $MenuModel) {
            $config = json_decode($MenuModel->getData('config'));
            if (is_object($config)) {
                $contentTypeName = (String)$config->contentTypeName;
                $map = [];
                $map['content_type_name'] = $contentTypeName;
                $ContentModels = ContentModel::all($map);
                foreach ($ContentModels as $ContentModel) {
                    $ContentModel->setData('menu_id', $MenuModel->getData('id'));
                    $ContentModel->save();
                }
            }
           
        } 
    }
}