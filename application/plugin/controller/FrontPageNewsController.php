<?php
namespace app\plugin\controller;
use app\model\ContentModel;                 // 文章
use app\Model\PluginDataFrontPageNewsModel;     // 插件对应模型

/**
 * 首页推荐新闻
 */
class FrontPageNewsController extends PluginController
{
    public function index(ContentModel $ContentModel)
    {
        // 取V层
        return $this->fetch();
    }

    /**
     * 编辑 
     * @param    ContentModel             $ContentModel 上下文
     * @return   html                                 
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T19:35:26+0800
     */
    public function edit(ContentModel $ContentModel) {
        $map = ['content_id' => $ContentModel->getData('id')];
        $this->assign('PluginDataFrontPageNewsModel', PluginDataFrontPageNewsModel::get($map));
        // 取V层
        return $this->fetch();
    }

    /**
     * 保存操作
     * @param    ContentModel             $ContentModel 上下文
     * @param    传入数据                    $data         
     * @return   [type]                                 [description]
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T18:45:16+0800
     */
    static public function save(ContentModel $ContentModel, $data) {
        // 获取当前上下文对应的插件数据
        $map = ['content_id' => $ContentModel->getData('id')];
        $PluginDataFrontPageNewsModel = PluginDataFrontPageNewsModel::get($map);

        // 如果为取消取操作，则删除表中数据
        if ($data['value'] === 'false') {
            $PluginDataFrontPageNewsModel->delete();
        } else {
            // 如果为设置为首页新闻，则按情况不同新增或更新数据
            $PluginDataFrontPageNewsModel->setData('weight', (int)$data['weight']);
            $PluginDataFrontPageNewsModel->setData('type', ($data['type'] === 'news' ? 'news' : 'info'));
            if (0 === $PluginDataFrontPageNewsModel->getData('content_id')) {
                $PluginDataFrontPageNewsModel->setData('content_id', $ContentModel->getData('id'));
                $isUpdate = false;
            } else {
                $isUpdate = true;
            }

            $PluginDataFrontPageNewsModel->isUpdate($isUpdate)->save();
        }
        
        return;
    }
}