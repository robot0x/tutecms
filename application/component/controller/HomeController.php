<?php
namespace app\component\controller;
use app\model\ContentModel;                 // 文章
use app\model\ContentFrontpageModel;        // 首页推荐内容
use app\model\PluginDataFrontPageNewsModel;      // 首页推荐内容插件

class HomeController extends ComponentController
{
    public function indexAction()
    {
        // 获取推荐新闻
        $newsCount = $this->getSampleConfig('newsCount');
        $map = ['type' => 'news'];
        $PluginDataFrontPageNewsModel = new PluginDataFrontPageNewsModel;
        $newsContentModels = $PluginDataFrontPageNewsModel->where($map)->limit($newsCount)->order('weight desc, create_time desc')->select();

        // 获取推荐通知
        $infoCount = $this->getSampleConfig('infoCount');
        $map = ['type' => 'info'];
        $infoContentModels = $PluginDataFrontPageNewsModel->where($map)->limit($infoCount)->order('weight desc, create_time desc')->select();

        $this->assign('newsContentModels', $newsContentModels);
        $this->assign('infoContentModels', $infoContentModels);
        return $this->fetch();
    }

    public function readAction($id)
    {
        var_dump($id);
    }
}