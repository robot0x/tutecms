<?php
namespace app\component\controller;

use think\Request;

use app\model\FieldDataBodyModel;
use app\model\UserModel;  
use app\model\ContentFrontpageModel;
use app\model\ContentModel;                 // 文章
use app\model\FieldModel;                   // 扩展字段
use app\model\MenuModel;                    // 菜单
use app\model\ContentTypeModel;             // 内容类别
use app\model\PluginModel;                  // 插件

/**
 * todo:权限判断。即当前新闻，是否属于当前这个菜单对应的那个 新闻类别
 */
class ContentListController extends ComponentController
{
    public function indexAction()
    {
        // 获取内容列表
        $ContentModels = $this->getContentModels();
        $this->assign('ContentModels', $ContentModels);

        // 获取当前菜单
        $this->assign('currentMenuModel', MenuModel::getCurrentMenuModel());

        //获取当前用户信息
        $User = UserModel::getCurrentFrontUserModel();
        $this->assign('User', $User);
        $this->assign('Url', $this->config['contentTypeName']['value']);
        return $this->fetch();
    }


    public function readAction($id)
    {
        $map = ['id' => $id];
        $ContentModel = ContentModel::get($map);
        if ('' === $ContentModel->getData('id')) {
            return $this->error('数据不存在或已删除');
        }

        // 查看是否拥有权限
        if ((int)MenuModel::getCurrentMenuModel()->getData('id') !== (int)$ContentModel->getData('menu_id')) {
            return $this->error('对不起，您无此权限');
        }

        $this->assign('ContentModel', $ContentModel);

        $ContentModels = $this->getContentModels();
        $this->assign('ContentModels', $ContentModels);

        // 增加一个点击量
        $ContentModel = ContentModel::get($id);
        $ContentModel->hit = $ContentModel->hit + 1;
        $ContentModel->save();
        //获取当前用户信息
        $User = UserModel::getCurrentFrontUserModel();
        $this->assign('User', $User);
        $this->assign('Url', $this->config['contentTypeName']['value']);

        return $this->fetch();
    }

    public function editAction($id)
    {
        // 更新当前新闻信息
        $ContentModel = ContentModel::get(['id' => $id]);
        $this->assign('ContentModel', $ContentModel);

        return $this->fetch();
    }


    public function updateAction($id)
    {
        // 获取数据
        $data = Request::instance()->param();
        $id = (int)$data['id'];

        // 更新当前新闻信息
        $ContentModel = ContentModel::get(['id' => $id]);

        // 更新当前新闻信息
        $ContentModel->setData('title', $data['title']);
        $ContentModel->save();

        // 更新扩展数据字段
        if (array_key_exists('field_', $data)) {
            FieldModel::updateLists($data['field_'], $ContentModel->getData('id'));
        }

        // 更新插件信息
        if (isset($data['_plugin_'])) {
            PluginModel::initi($ContentModel, $data['_plugin_'], 'save');
        }

        // 成功返回
        return $this->success('操作成功', url('@' . $this->currentMenuModel->getData('url') . '/read?id=' . $id));
    }

    //删除数据
    public function deleteAction($id) {
        //删除content表中对应的内容
        $ContentModel = ContentModel::get($id);
        $ContentModel->setData('is_delete', 1);
        $ContentModel->save();
        //删除fieldDataBody表中对应的内容
        $FieldDataBodyModel = FieldDataBodyModel::get($id);
        $FieldDataBodyModel->setData('is_delete', 1);
        $FieldDataBodyModel->save();
        // 删除contentFrontpage表中对应的内容
        $map['content_id'] = $id;
        $ContentFrontpageModel = ContentFrontpageModel::get($map)->getData();
        if (false === empty($ContentFrontpageModel)) {
            $ContentFrontpageModel = ContentFrontpageModel::get($map);
            $ContentFrontpageModel->delete();
        }
       
        return $this->success('删除成功');
    }

    public function addAction() {
        // 获取当前菜单，及当前菜单对应的内容类型
        $MenuModel = MenuModel::getCurrentMenuModel();

        // 获取内容 并设置内容的类型
        $ContentModel = new ContentModel;
        $ContentModel->setMenuModel($MenuModel);

        $this->assign('ContentModel', $ContentModel);
        return $this->fetch();
    }

    //保存信息
    public function saveAction() {
        $UserModel = UserModel::getCurrentUserModel();

        //将标题信息保存到content表中
        $data = Request::instance()->param();
        $ContentModel = new ContentModel();
        $ContentModel->setData('title', $data['title']);
        $ContentModel->setData('content_type_name', $this->config['contentTypeName']['value']);
        $ContentModel->setData('user_name', $UserModel->getData('user_name'));
        $ContentModel->setData('menu_id',  MenuModel::getCurrentMenuModel()->getData('id'));
        if (false === $ContentModel->save()) {
            return $this->error($ContentModel->getError());
        }

        // 更新扩展数据字段
        if (isset($data['field_'])) {
            FieldModel::updateLists($data['field_'], $ContentModel->getData('id'));
        }
        // 成功返回
        return $this->success('操作成功', url('@' . $this->currentMenuModel->getData('url')));
    }

    /**
     * 获取当前页文章
     * @return   array                   ContentModels
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2016-12-29T13:41:08+0800
     */
    private function getContentModels() {
        $ContentModel = new ContentModel();
        $map = [];
        $map['content_type_name'] = $this->config['contentTypeName']['value'];
        $map['is_freezed'] = '0';
        $map['is_delete'] = '0';
        $count = $this->getSampleConfig()['count'];
        $ContentModels = $ContentModel->where($map)->order('id desc')->paginate($count);

        unset($ContentModel);
        unset($map);
        unset($count);
        return $ContentModels;
    }
}
