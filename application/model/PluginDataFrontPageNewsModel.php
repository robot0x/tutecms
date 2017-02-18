<?php
namespace app\model;

use app\Common;

class PluginDataFrontPageNewsModel extends ModelModel
{
    protected $data = ['content_id' => 0, 'type' => 1, 'weight' => 0];
    protected $ContentModel = null;

    public function ContentModel() {
        if (null === $ContentModel) {
            $map = ['id' => $this->getData('content_id')];
            $this->ContentModel = ContentModel::get($map);
        }
        
        return $this->ContentModel;
    }

}