<?php
return [
    // 定义路由，原则：先长后短
    'index' => [
        'title'         => '浏览',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['', 'GET']        
    ],
    'add' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/add', 'GET'],
    ],
    'addCourse' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/addCourse/:id', 'GET'],
    ],
    'save' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/save', 'POST'],
    ],
    'edit' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/edit/:id', 'GET'],
    ],
    'delete' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/delete/:id', 'GET'],
    ],
    'update' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/:id/isAll/:isAll/update', 'POST'],
    ],


];