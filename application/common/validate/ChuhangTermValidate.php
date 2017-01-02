<?php
namespace app\common\validate;

use think\Validate;         //内置验证类

/**
 * 课表验证
 */
class ChuhangTermValidate extends Validate
{
    protected $rule = [
        'name'         => 'require|length:2,25',
        'start_time'         => 'require',
        'end_time'         => 'require',
    ];
}