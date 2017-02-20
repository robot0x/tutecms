<?php
return [
    // 注意注册路由的顺序：由长到短！
    'edit' => [
        'title'         => '编辑',
        'description'   => '编辑',
        'value'         => ['/edit/id/:id', 'GET'],
    ],

    'delete' => [
        'title'         => '删除',
        'description'   => '删除',
        'value'         => ['/delete/id/:id', 'GET'],
    ],

    'update' => [
        'title'         => '更新',
        'description'   => '更新数据',
        'value'         => ['/update', 'POST'],
    ],

    'add' => [
        'title'         => '添加',
        'description'   => '添加',
        'value'         => ['/add', 'GET'],
    ],
    
    'save' => [
        'title'         => '保存',
        'description'   => '保存数据',
        'value'         => ['/save', 'POST'],
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
];