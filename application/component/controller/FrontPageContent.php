<?php
namespace app\component\controller;
use app\model\FieldModel;           //字段模型
use think\Request;
/**
 * 首页新闻通知
 * 有图片的被推荐到首页的，为新闻
 * 没有图片被推荐到首页的，为通知
 */
class FrontContentController extends AdminController
{
    public function indexAction() {
        
    }
}