<?php
namespace app\block\controller;

use think\Request;                          // 请求
use think\View;

use app\model\ContentModel;                 // 文章
use app\model\ContentFrontpageModel;        //首页推荐内容
use app\Common;                             // 通用模型
use app\model\BlockModel;                   // 区块模型
use app\model\FieldModel;                   // 字段模型
use app\model\AccessUserGroupBlockModel;    // 用户组区块权限

/**
 * 幻灯片
 */
class SliderController extends BlockController
{
    public function index() {
        // 获取扩展字段列表, 并传入V层
        $this->assign('titles',         $this->BlockModel->FieldModel('titles')->filter());
        $this->assign('urls',           $this->BlockModel->FieldModel('urls')->filter());
        $images = $this->BlockModel->FieldModel('images')->filter();
        foreach ($images as $key => $image) {
            $images[$key] = __PUBLIC__ . $image;
        }
        $this->assign('images',         $images);
        $this->assign('headers',        $this->BlockModel->FieldModel('headers')->filter());
        $this->assign('descriptions',   $this->BlockModel->FieldModel('descriptions')->filter());
        
        $totalCount = count($this->BlockModel->FieldModel('titles')->filter());
        $totalCount = (count($this->BlockModel->FieldModel('urls')->filter()) < $totalCount) ? count($this->BlockModel->FieldModel('urls')->filter()) : $totalCount;
        $totalCount = count($this->BlockModel->FieldModel('images')->filter()) < $totalCount ? count($this->BlockModel->FieldModel('images')->filter()) : $totalCount;
        $totalCount = count($this->BlockModel->FieldModel('headers')->filter()) < $totalCount ? count($this->BlockModel->FieldModel('headers')->filter()) : $totalCount;
        $totalCount = count($this->BlockModel->FieldModel('descriptions')->filter()) < $totalCount ? count($this->BlockModel->FieldModel('descriptions')->filter()) : $totalCount;

        $this->assign('totalCount', $totalCount);

        //获取新闻标题
        // 定义配置信息
        $map = [];
        $map['is_delete'] = 0;
        $map['content_type_name'] = 'news';
        $offset = 7;
        $order = ['weight'=>'desc', 'create_time'=>'desc'];

        // 取推荐新闻，并传给首页
        $ContentModel = new ContentModel;
        $ContentModels = $ContentModel->where($map)->order($order)->limit(0, $offset)->select();
        $this->assign('ContentModels', $ContentModels);

        unset($ContentModels);
        unset($ContentModel);


        $this->assign('editAction', $this->url('edit'));
        return $this->fetch();
    }
    
    public function save()
    {
        // 得到请求信息
        $Request = Request::instance();
        $param = $Request->param();
        
        // 判断传入的各个字段的个数是否相同，如果不同，报错提示各个字段个数必须相同!
        $fields = $param['field_'];
        $count = count(array_pop($fields));
        foreach ($fields as $value) {
            if ($count !== count($value)) {
                return $this->error('各字段设置的参数个数不统一，请检查');
            }
        }
        
        // 更新扩展数据字段
        if (array_key_exists('field_', $param)) {
            FieldModel::updateLists($param['field_'], $this->BlockModel->getData('id'));
        }

        $this->success('操作成功');
    }


    public function edit($data = [])
    {
        $this->assign('saveAction', $this->url('save'));
        return $this->view->fetch('block@Slider/edit');
    }
}