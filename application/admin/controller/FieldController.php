<?php
namespace app\admin\controller;

use think\Request;

use app\model\FieldModel;                       // 字段模型
use app\model\UserGroupModel;                   // 用户组
use app\model\AccessUserGroupFieldModel;        // 用户组字段权限


class FieldController extends AdminController
{
    public function indexAction()
    {
        //获取传输过来的数据
        $request      = Request::instance();
        $relate_type = $request->param('relate_type');
        $FieldModel   = new FieldModel;
        $FieldModels = $FieldModel->getallrelatetypefield($relate_type);  

        //传值
        $this->assign('FieldModels', $FieldModels);
        return $this->fetch();
    }

    public function readAction($relateType, $relateValue, $backUrl = '') {
        //输入变量
        $request      = Request::instance();

        //查找数据
        $map          = array('relate_value' => $relateValue, 'relate_type' => $relateType);
        $FieldModel   = new FieldModel;
        $FieldModels  = $FieldModel->where($map)->order('weight', 'desc')->select();
        $this->assign('FieldModels', $FieldModels);

        return $this->fetch();
    }

    public function createAction() {
        $this->assign('FieldModel', new FieldModel);
        $this->assign('submitAction', 'save');

        //将用户组信息传入
        $UserGroupModels = UserGroupModel::all();
        $this->assign('UserGroupModels', $UserGroupModels);
        return $this->fetch('edit');
    }
    /**
     * 更新权重
     * @return  
     * @author  gaoliming 
     */
    public function weightAction()
    {
        $data['status']  = 'ERROR';
        $data['message'] = '';

        //判断传过来的值是否为空
        $weight = $_POST['weight'];
        $weight = isset($weight) ? $weight : array();

        //执行更新
        $FieldModel = new FieldModel;
        $id         = $FieldModel->updateFieldWeight($weight);
        if (false === $id) {
            $data['message'][] = $id;
        }

        //更新成功,返回
        if ("" === $data['message']) {
            $data['status'] = 'SUCCESS';
            return $data;
        }

        //更新失败
        $data['message'] = '排序失败-' . implode(',', $data['message']);
        return $data;
    }

    /**
     * 编辑
     * @param    int                   $id 
     * @return                          
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-17T21:35:11+0800
     */
    public function editAction($id) {
        $FieldModel = FieldModel::get($id);
        $this->assign('FieldModel',$FieldModel);

        //将用户组信息传入
        $UserGroupModels = UserGroupModel::all();
        $this->assign('UserGroupModels', $UserGroupModels);
        
        $this->assign('submitAction', 'update');
        return $this->fetch();
    }

    public function saveAction() {
        // 获取POST数据
        $data = Request::instance()->param();

        // 获取字段对象
        $FieldModel = new FieldModel;

        // 设置更新字段
        $FieldModel->setData('title', $data['title']);
        $FieldModel->setData('field_type_name', $data['field_type_name']);
        $FieldModel->setData('name', $data['name']);
        $FieldModel->setData('relate_type', $data['relate_type']);
        $FieldModel->setData('relate_value', $data['relate_value']);
        $FieldModel->setData('weight', $data['weight']);
        if (array_key_exists('config', $data)) {
            $FieldModel->setData('config', json_encode($data['config']));
        }

        // 更新用户组权限
        if (array_key_exists('usergroupname', $data)) {
            $AccessUserGroupFieldModel = new AccessUserGroupFieldModel;
            $AccessUserGroupFieldModel->updateByFieldIdUserGroupNames($FieldModel->getData('id'), $param['usergroupname']);
        }

        $FieldModel->save();
        return $this->success('操作成功', $this->backUrl);
    }

    /**
     * 更新
     * @return                      
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T13:08:24+0800
     */
    public function updateAction() {
        // 获取POST数据
        $data = Request::instance()->param();

        // 获取字段对象
        $id = (int)$data['id'];
        $FieldModel = FieldModel::get($id);
       
        if (0 === $FieldModel->getData('id')) {
            return $this->error('您所编辑的字段不存在，或已删除');
        }

        // 设置更新字段
        $FieldModel->setData('title', $data['title']);
        $FieldModel->setData('field_type_name', $data['field_type_name']);
        $FieldModel->setData('weight', $data['weight']);
        $FieldModel->setData('name', $data['name']);
        if (array_key_exists('config', $data)) {
            $FieldModel->setData('config', json_encode($data['config']));
        }

        // 更新用户组权限
        if (array_key_exists('usergroupname', $data)) {
            $AccessUserGroupFieldModel = new AccessUserGroupFieldModel;
            $AccessUserGroupFieldModel->updateByFieldIdUserGroupNames($FieldModel->getData('id'), $data['usergroupname']);
        }

        $FieldModel->save();
        return $this->success('操作成功', $this->backUrl);
    }

    /**
     * 删除
     * @param    id                   $id 
     * @return                          
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-23T19:31:56+0800
     */
    public function deleteAction($id) {
        $map = ['id' => $id];
        $FieldModel = new FieldModel();
        $FieldModel->where($map)->delete();
        return $this->success('操作成功');
    }
}