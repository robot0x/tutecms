<?php
return [
    // 定义路由，原则：先长后短
    'index' => [
        'title'         => '浏览',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['', 'GET']        
    ],
    'addCourse' => [
        'title'         => '添加课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/course/addCourse', 'GET']        
    ],
    'addKlass' => [
        'title'         => '添加课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/klass/addKlass', 'GET']        
    ],
    'addTerm' => [
        'title'         => '添加课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/term/addTerm', 'GET']        
    ],
    'addClassroom' => [
        'title'         => '添加课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/classroom/addClassroom', 'GET']        
    ],
    'saveCourse' => [
        'title'         => '保存课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/course/saveCourse', 'POST']        
    ],
    'saveClassroom' => [
        'title'         => '保存课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/Classroom/saveClassroom', 'POST']        
    ],
    'saveTeacher' => [
        'title'         => '保存课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/teacher/saveTeacher', 'POST']        
    ],
    'saveTerm' => [
        'title'         => '保存课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/term/saveTerm', 'POST']        
    ],
    'saveKlass' => [
        'title'         => '保存课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/klass/saveKlass', 'POST']        
    ],
    'deleteCourse' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/course/deleteCourse/:id', 'GET']        
    ],
    'deleteTeacher' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/teacher/deleteTeacher/:id/', 'GET']        
    ],
    'deleteClassroom' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/classroom/deleteClassroom/:id/', 'GET']        
    ],
    'deleteKlass' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/klass/deleteKlass/:id/', 'GET']        
    ],
    'deleteTerm' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/term/deleteTerm/:id', 'GET']        
    ],
    'editCourse' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/course/editCourse/:id', 'GET']        
    ],
    'editClassroom' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/classroom/editClassroom', 'GET']        
    ],
    'editTeacher' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/teacher/editTeacher', 'GET']        
    ],
    'editTerm' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/term/editTerm', 'GET']        
    ],
    'editKlass' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/klass/editKlass', 'GET']        
    ],
    'updateCourse' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/course/:id/updateCourse', 'POST']        
    ],
    'updateTerm' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/term/:id/updateTerm', 'POST']        
    ],
    'updateTeacher' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/teacher/:id/updateTeacher', 'POST']        
    ],
    'updateKlass' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/klass/:id/updateKlass', 'POST']        
    ],
    'updateClassroom' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/classroom/:id/updateClassroom', 'POST']        
    ],
    'teacher' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/teacher', 'GET']        
    ],
    'klass' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/klass', 'GET']        
    ],
    'classroom' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/classroom', 'GET']        
    ],
    'term' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/term', 'GET']        
    ],
    'addTeacher' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/teacher/addTeacher', 'GET']        
    ],
    'frozen' => [
        'title'         => '删除课程',
        'description'   => '用户登陆前和登陆后的form表单显示',
        'value'         => ['/term/frozen', 'GET']        
    ],
];