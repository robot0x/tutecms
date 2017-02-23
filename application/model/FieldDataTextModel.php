<?php
namespace app\model;
use app\Common;
use think\File;
/**
 * text字段
 */
class FieldDataTextModel extends FieldModel 
{
    protected $data = ['field_id' => 0, 'key_id' => 0];
    public function filter($value = null)
    {
        return $this->getData('value');
    }
}