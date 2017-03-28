<?php
namespace app\test\controller;

use app\Common;

class appCommonController {
    public function makeUrlByMenuIdActionParamAction () {

        var_dump(Common::makeUrlByMenuIdActionParam(0, 'update', []));
    }
}