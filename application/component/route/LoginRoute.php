<?php
return [
    'logout'    => [
        'title'         => '注销',
        'description'   => '用户点击用进行注销操作',
        'value'         => ['/logout', 'GET']    
    ],

    'index' => [
        'title'         => '登录',
        'description'   => '登录前显示登录form,登录后，显示个人中心',
        'value'         => ['', 'GET']        
    ],
    

    'edit' => [
        'title'         => '编辑',
        'description'   => '编辑用户信息',
        'value'         => ['/edit', 'GET']
    ],

    'update' => [
        'title'         => '保存',
        'description'   => '保存用户注册信息',
        'value'         => ['/update', 'POST']
    ],
];