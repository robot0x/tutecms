<?php
return [
    // 定义路由，原则：先长后短
    'index' => [
        'title'         => '浏览',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['', 'GET']        
    ],
    'add' => [
        'title'         => '新增',
        'description'   => '新增数据',
        'value'         => ['/add/:id', 'GET'],
    ],
    'save' => [
        'title'         => '保存',
        'description'   => '保存数据',
        'value'         => ['/save', 'POST'],
    ],
    'edit' => [
        'title'         => '编辑',
        'description'   => '编辑数据',
        'value'         => ['/edit/:id', 'GET'],
    ],
    'delete' => [
        'title'         => '删除',
        'description'   => '删除数据',
        'value'         => ['/delete/:id', 'GET'],
    ],
    'update' => [
        'title'         => '更新',
        'description'   => '更新数据',
        'value'         => ['/:id/isAll/:isAll/update', 'POST'],
    ],
    'data' => [
        'title'         => '',
        'description'   => '',
        'value'         => ['/data', 'GET'],
    ],


];