<?php
namespace app\test\controller;
use app\model\AccessUserGroupMenuModel;
use app\model\MenuModel;

class appModelAccessUserGroupMenuModelTestController {
    public function updateAccessByMenuModelGroupsActionsAction() {
        $MenuModel = MenuModel::get(3);
        $groupsActions = [
            'admin' => [
                'index' =>  'on' ,
                'add' =>  'on' ,
                'addCourse' =>  'on' ,
                'save' =>  'on' ,
                'edit' =>  'on' ,
                'delete' =>  'on' ,
          
            ],

            'editor' => 
            [
                'index' =>  'on' ,
                'add' =>  'on' ,
                'addCourse' =>  'on' ,
                'save' =>  'on' ,
                'edit' =>  'on' ,
                'delete' =>  'on' ,
               
            ],

            'public' => 
            [
                'index' =>  'on' ,
                'add' =>  'on' ,
                'addCourse' =>  'on' ,
                'save' =>  'on' ,
                'edit' =>  'on' ,
            
            ]
        ];

        AccessUserGroupMenuModel::updateAccessByMenuModelGroupsActions($MenuModel, $groupsActions);

    }
}