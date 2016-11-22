<?php
return [
    // 注意注册路由的顺序：由长到短！
    'edit' => [
        'title'         => '编辑',
        'description'   => '编辑',
        'value'         => ['/:id/edit', 'GET'],
    ],

    'read'  => [
        'title'         => '查看单条信息',
        'description'   => '',
        'value'         => ['/:id', 'GET']    
    ],

    'index' => [
        'title'         => '浏览列表',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['', 'GET']        
    ],
    'update' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/:id', 'POST'],
    ],
    'delete' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/delete/id/:id', 'GET'],
    ],
    'add' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/add', 'GET'],
    ],
];