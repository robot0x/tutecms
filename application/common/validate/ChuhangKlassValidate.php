<?php
namespace app\common\validate;

use think\Validate;         //内置验证类

/**
 * 班级验证
 */
class ChuhangKlassValidate extends Validate
{
    protected $rule = [
        'name'         => 'require|length:2,25',
    ];
}