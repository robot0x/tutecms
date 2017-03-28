<?php
namespace app\model;

class ContentFrontpageModel extends ModelModel
{
    protected $ContentModel;
    protected $pk = 'content_id';
    protected $data = ['content_id' => 0];

    public function ContentModel()
    {
        if (null === $this->ContentModel) {
            $this->ContentModel = ContentModel::get(['id' => $this->getData('content_id')]);
        }
        return $this->ContentModel;
    }
}