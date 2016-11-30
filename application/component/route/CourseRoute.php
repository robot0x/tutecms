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
        'value'         => ['/read/add', 'GET'],
    ],
    'read' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/read', 'GET'],
    ],
    'edit' => [
        'title'         => '保存（更新）',
        'description'   => '保存数据',
        'value'         => ['/edit', 'GET'],
    ],

];