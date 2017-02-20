<?php
namespace app\model;

use app\Common;

class PluginDataFrontPageNewsModel extends ModelModel
{
    protected $data = ['content_id' => 0, 'type' => 1, 'weight' => 0];
    protected $ContentModel = null;

    public function ContentModel() {
        if (null === $this->ContentModel) {
            $map = ['id' => $this->getData('content_id')];
            $this->ContentModel = ContentModel::get($map);
        }
        
        return $this->ContentModel;
    }

    /**
     * 上下文是否被推荐到首页
     * @return   boolean                  是：true;否:false
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T19:45:31+0800
     */
    public function isShow() {
        if (0 === $this->getData('content_id')) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 上下文是否被推荐到首页
     * @return   string                  
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T19:46:12+0800
     */
    public function isShowForView() {
        if ($this->isShow()) {
            return 'true';
        } else {
            return 'false';
        }
    }

    /**
     * 是否为 推荐新闻  (news:推荐新闻, info:推荐通知)
     * @return   boolean                   
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T19:46:26+0800
     */
    public function typeIsNews() {
        if ('news' === $this->getData('type')) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 是否为 推荐新闻  (news:推荐新闻, info:推荐通知)
     * @return   String          
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T19:46:26+0800
     */
    public function typeIsNewsForView() {
        if ($this->typeIsNews()) {
            return 'true';
        } else {
            return 'false';
        }
    }
}