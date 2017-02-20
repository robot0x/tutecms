<?php
namespace app\model;
use app\Common;
use think\File;
/**
 * image字段
 */
class FieldDataImageModel extends FieldDataAttachmentModel 
{   
    protected $data = ['id' => 0];
    /**
     * 获取url (相对于站点的路径)
     * @return   string                   
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-07T13:58:16+0800
     */
    public function getUrl()
    {
        if (null === $this->url) {
            if (0 === $this->getData('id')) {
                $this->url = __PUBLIC__ . DS . 'field' . DS . 'image' . DS . 'default.png';

            } else {
                $this->url = parent::getUrl();
            }
        }
        
        return $this->url;
    }
}