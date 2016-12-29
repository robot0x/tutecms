<?php
namespace app\block\controller;
use app\model\ContentModel;
use app\model\ContentTypeModel;

/**
 * 图文列表
 */
class PictureNewsController extends BlockController
{

    public function index()
    {
        // 获取内容类型
        $contentTypeName = (string)$this->config['content_type_name'];

        // 获取显示的数量
        $count = (int)$this->config['count'];

        // 获取新闻模型
        $map = ['is_delete' => 0];
        $ContentModel = new ContentModel;
        $contentModels = $ContentModel->where($map)->limit($count)->order('id desc')->select();
        $this->assign('contentModels', $contentModels);
        $this->assign('menuId', ContentTypeModel::get($contentTypeName)->getData('menu_id'));

        return $this->fetch();
    }
}
