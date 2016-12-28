<?php
namespace app\component\controller;
use app\model\ContentModel;                 // 文章
use app\model\ContentFrontpageModel;        // 首页推荐内容

class HomeController extends ComponentController
{
    public function indexAction()
    {
        //获取图文列表
        $ContentModel = new ContentModel();
        
        $map = [];
        $map['content_type_name'] = $this->config['contentTypeName']['value'];
        $map['is_freezed'] = '0';
        $map['is_delete'] = '0';
        $ContentModels = $ContentModel->where($map)->order('create_time desc')->paginate($this->config['count']['value']);
        

        $this->assign('ContentModels', $ContentModels);
        return $this->fetch();
    }

    public function readAction($id)
    {
        var_dump($id);
    }
}