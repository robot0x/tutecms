<?php
return [
    // 在这，给出的是区块的action类型及说明，用于权限的更新与判断。
    // 由于并不是真正的路由，所以不会添加到路由表中
    
    'index' => [
        'title'         => '浏览',
        'description'   => '',
        'action'        => 'index'
    ],
    
    'edit' => [
        'title'         => '编辑',
        'description'   => '编辑',
        'action'        => 'edit',  
    ],

    'upload'  => [
        'title'         => '上传',
        'description'   => '上传新的图片',
        'action'        => 'upload',
    ],

];