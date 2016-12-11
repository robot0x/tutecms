<?php
namespace app\common\validate;

use think\Validate;         //内置验证类

/**
 * 课表验证
 */
class ChuhangCourseValidate extends Validate
{
    protected $rule = [
        'name'         => 'require|length:2,25',
    ];
}