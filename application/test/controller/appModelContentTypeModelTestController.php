<?php
namespace app\test\controller;
use app\model\ContentTypeModel;

use app\Common;

class appModelContentTypeModelTestController {
    public function getContentTypeModelTreeAction() {
        $ContentTypes = ContentTypeModel::getContentTypeModelTree();
        $datas = [];
        foreach($ContentTypes as $value) {
            array_push($datas, $value->getData());
        }
        var_dump($datas);
        $datas = Common::listToTree($datas, $pk = 'name', $pid = 'pname', $child = '_child', $root = '');

        $datas = Common::treeToList($datas);
        var_dump($datas);
    }
}