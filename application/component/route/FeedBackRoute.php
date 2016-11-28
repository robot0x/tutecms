<?php
return [
    // 定义路由，原则：先长后短
    'index' => [
        'title'         => '浏览',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['', 'GET']        
    ],
    'read'  => [
        'title'         => '查看单条信息',
        'description'   => '',
        'value'         => ['/:id', 'GET']    
    ],
    'add' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/add', 'GET'],
    ],
    'save' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/save', 'POST'],
    ],
    'saveComment' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/saveComment', 'POST'],
    ],
    'delete' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/delete/id/:id', 'GET'],
    ],
    'deleteComment' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/deleteComment/id/:id', 'GET'],
    ],

];