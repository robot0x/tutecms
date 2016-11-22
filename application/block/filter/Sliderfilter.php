<?php
return [
    // 标题过滤
    'title' => [ 
        'type'      => 'String',
        'function'  => 'substr',
        'param'     => [
            'length'    =>  8,
            'etc'       =>  '..',
        ],
    ], 

    // 生成的链接
    'href' => [ 
        'type'        => 'System',
        'function'    => 'makeFrontpageContentUrl',
    ],  
    // 日期格式化
    'date' => [
        'type'      => 'date',
        'function'  => 'format',
        'param' => [
            'dateFormat'    => 'Y-m-d',
        ],
            
    ],  
];