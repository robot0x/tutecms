<?php
namespace app\field\controller;
use app\Common;
use think\Request;

use app\model\FieldDataImageModel;          // 附件

class ImageController extends FieldController
{

    public function index()
    {
        return $this->fetch();
    }


    /**
     * 文件上传，供api接口进行动态调用
     * @return                      
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-06T10:49:48+0800
     */
    static public function upload($param = [])
    {
        $result = ['status' => 'success'];
        // todo:讲解new self()与 new ImageController()的区别
        $FieldDataImageModel = new FieldDataImageModel;        
        $file = Request::instance()->file('Filedata');

        // 查看是否传入了文件信息
        if (null === $file) {
            $result = [
                'status' => 'error',
                'message'  => '传入的文件name值非Filedata,或未上传任何文件'
            ];
        } else {
            // 调用上传操作
            try {
                $result['data'] = $FieldDataImageModel->upload($file);
            } catch (\Exception $e) {
                $result = [
                    'status' => 'error',
                    'message'  => '上传文件发生错误，错误信息：' . $e->getMessage(),
                ];
            }
        }

        // 返回信息
        // var_dump(json_encode($result));
        return json_encode($result);
    }

    public function edit() {
        $this->assign('uploadAction', url('admin/call/block?id=' . $this->FieldDataXXXModel->getData('id') . '&action=upload&isAjax=1'));
        return $this->fetch();
    }
}