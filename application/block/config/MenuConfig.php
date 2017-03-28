<?php
return [
    'pid' => [
        'value'         =>  '0',
        'title'         =>  '父ID',
        'description'   =>  '根菜单父ID为0',
        'type'          =>  'text',
    ],

    'cssId' => [
        'value' => 'cssmenu',
        'title' => '菜单ID前缀',
        'description'   =>  '生成的cssID,用于前台定制',
        'type'          =>  'text',
    ],

    'count' => [
        'value' => '5',
        'title' => '显示一级菜单的数量',
    ],
];