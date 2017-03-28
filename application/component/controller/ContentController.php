<?php
namespace app\component\controller;

use think\Request;                          // 请求

use app\Common;
use app\model\ContentModel;                 // 文章
use app\model\CategoryModel;                // 类别
use app\model\FieldModel;                   // 扩展字段类别
use app\model\PluginModel;                  // 插件


class ContentController extends ComponentController
{
    private $ContentModel = null;

    public function __construct()
    {
        parent::__construct();

        // 获取配置信息中的当前文章ID
        $id = 0;
        if (array_key_exists('id', $this->config))
        {
            $id = $this->config['id']['value'];
        }        

        $this->ContentModel = ContentModel::get($id);
    }

    public function editAction()
    {
        $this->assign('ContentModel', $this->ContentModel);
        return $this->fetch();
    }

    public function saveAction()
    {
        // 获取数据
        $data = Request::instance()->param();

        // 更新当前新闻信息
        $this->ContentModel->setData('title', $data['title']);
        $this->ContentModel->save();

        // 更新扩展数据字段
        if (isset($data['field_'])) {
            FieldModel::updateLists($data['field_'], $this->ContentModel->getData('id'));
        }

        // 更新插件信息
        if (isset($data['_plugin_'])) {
            PluginModel::initi($this->ContentModel, $data['_plugin_'], 'save');
        }

        // 成功返回
        return $this->success('操作成功', url('@' . $this->currentMenuModel->getData('url')));
    }

    public function indexAction()
    {
        $this->ContentModel->addHits();
        $this->assign('ContentModel', $this->ContentModel);
        return $this->fetch();
    }
}