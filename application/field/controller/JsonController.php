<?php
namespace app\field\controller;

use think\Request;                                  // 请求

use app\Common;
use app\model\FieldDataJsonModel;                    // json模型
class JsonController extends FieldController
{
    public function edit()
    {
        // 增加token,用于字段个数的修改
        $this->assign('addSubCountAction', $this->url('addSubCount'));

        return $this->view->fetch('field@Json/edit');
    }

    /**
     * 添加1个或是减少一个子元素
     * @param    array                    $data 传入值
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-09T12:13:10+0800
     */
    public function addSubCount()
    {
        // 获取请求信息
        $param = Request::instance()->param();
        if (!array_key_exists('id', $param)) {
            $this->error('未传入参数id');
        }
        
        $map = ['id' => $param['id']];
        // 获取当前数据字段对象
        $FieldDataJsonModel = FieldDataJsonModel::get($map);
        $array = json_decode($FieldDataJsonModel->getData('value'), true);

        // 判断是添加还是减小
        if (array_key_exists('type', $param) && $param['type'] === 'add') {
            array_push($array, ''); 
        } else {
            array_pop($array);
        }

        // 保存数据
        $value = json_encode($array);
        $FieldDataJsonModel->setData('value', $value);
        $FieldDataJsonModel->save();

        // 返回到调用前的url
        return $this->success('操作成功');
    }
}