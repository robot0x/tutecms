<?php
namespace app\component\controller;

use app\model\UserModel;                            // 用户
use app\model\ContentModel;                         // 文章
use app\model\ContentFrontpageModel;                // 首页推荐内容
use app\model\PluginDataFrontPageNewsModel;         // 首页推荐内容插件

class HomeController extends ComponentController
{
    public function indexAction()
    {
        // 获取推荐新闻
        $newsCount = $this->getSampleConfig('newsCount');
        $newsContentModels = PluginDataFrontPageNewsModel::getAccessContentModelsByActionUserGroupNameTypeCount('index', UserModel::getCurrentUserModel()->UserGroupModel()->getData('name'), 'news');

        // 获取推荐通知
        $infoCount = $this->getSampleConfig('infoCount');
        $infoContentModels = PluginDataFrontPageNewsModel::getAccessContentModelsByActionUserGroupNameTypeCount('index', UserModel::getCurrentUserModel()->UserGroupModel()->getData('name'), 'info');
        
        $this->assign('newsContentModels', $newsContentModels);
        $this->assign('infoContentModels', $infoContentModels);
        return $this->fetch();
    }

    public function readAction($id)
    {
        var_dump($id);
    }
}