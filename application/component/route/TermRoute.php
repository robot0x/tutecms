<?php
return [
    // 定义路由，原则：先长后短
    'index' => [
        'title'         => '浏览',
        'description'   => '浏览',
        'value'         => ['', 'GET']        
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
    'update' => [
        'title'         => '更新',
        'description'   => '更新',
        'value'         => ['/update/:id', 'POST']        
    ],
    'delete' => [
        'title'         => '删除',
        'description'   => '删除',
        'value'         => ['/delete/:id', 'GET']        
    ],
    'edit' => [
        'title'         => '编辑',
        'description'   => '编辑',
        'value'         => ['/edit/:id', 'GET']        
    ],
    'frozen' => [
        'title'         => '冻结',
        'description'   => '冻结',
        'value'         => ['/frozen/:id', 'GET']        
    ],
];