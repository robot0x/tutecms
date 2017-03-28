<?php
namespace app\model;
/**
 * 用户组
 */
class UserGroupModel extends ModelModel
{
    protected $pk = 'name';

    protected $data = ['name' => 'public'];

    public function isAllowedByFieldModelAction(FieldModel &$FieldModel, $action) {
        // 查找是否存在当前权限值
        $map = [];
        $map['field_id']         = $FieldModel->getData('id');
        $map['user_group_name'] = $this->getData('name');
        $map['action']          = $action;
        $AccessUserGroupFieldModel = AccessUserGroupFieldModel::get($map);
        if ('' === $AccessUserGroupFieldModel->getData('field_id')) {
            // 返回非默认值，有权限
            return false;
        } else {
            return true;
        }
    }

    public function isAllowedByFieldModelActionForView(FieldModel &$FieldModel, $action) {
        if ($this->isAllowedByFieldModelAction($FieldModel, $action)) {
            return 'true';
        } else {
            return 'false';
        }
    }

    /**
     * 获取 菜单 对本用户组的权限
     * @param  MenuModel &$MenuModel [description]
     * @return [type]                [description]
     */
    public function isAllowedByMenuModelAction(MenuModel &$MenuModel, $action)
    {
        // 查找是否存在当前权限值
        $map = [];
        $map['menu_id']         = $MenuModel->getData('id');
        $map['user_group_name'] = $this->getData('name');
        $map['action']          = $action;
        $AccessUserGroupMenuModel = AccessUserGroupMenuModel::get($map);
        if ('' === $AccessUserGroupMenuModel->getData('menu_id'))
        {
            // 返回非默认值，有权限
            return false;
        } else {
            return true;
        }
    }

    /**
     * 获取 用户组 对 区块的操作权限
     * @param  BlockModel &$BlockModel 区块对象
     * @param  string     $action      操作
     * @return boolean                 存在操作返回 true 不存在 false
     * @author huangshuaibin
     */
    public function isAllowedByBlockModelAction(BlockModel &$BlockModel, $action)
    {
        //查找是否存在当前权限值
        $map = [];
        $map['block_id']        = $BlockModel->getData('id');
        $map['user_group_name'] = $this->getData('name');
        $map['action']          = $action;
        $AccessUserGroupBlockModel = AccessUserGroupBlockModel::get($map);
        
        if ('' !== $AccessUserGroupBlockModel->getData('block_id')) {
            //返回非默认值有权限
            return true;
        } else {
            return false;
        }       
    }

    public function isAllowedByPluginModelAction(PluginModel &$PluginModel, $action) {
        //查找是否存在当前权限值
        $map = [];
        $map['plugin_id']       = $PluginModel->getData('id');
        $map['user_group_name'] = $this->getData('name');
        $map['action']          = $action;
        $AccessUserGroupPluginModel = AccessUserGroupPluginModel::get($map);
        
        if ('' !== $AccessUserGroupPluginModel->getData('plugin_id')) {
            //返回非默认值有权限
            return false;
        } else {
            return true;
        }   
    }

    public function isAllowedByPluginModelActionForView(PluginModel &$PluginModel, $action) {
        if ($this->isAllowedByPluginModelAction($PluginModel, $action)) {
            return 'true';
        } else {
            return 'false';
        }
    }


    /**
     * 是否当前菜单的的 列表(10000) 权限
     * @param  MenuModel &$MenuModel 菜单
     * @return boolean               
     */
    public function isIndexAllowedByMenuModel(MenuModel &$MenuModel)
    {
        return $this->isAllowedByMenuModelAction($MenuModel, 'index');
    }


    /**
     * 是否有当前菜单的 创建(01000) 权限
     * @param  MenuModel &$MenuModel [description]
     * @return boolean               [description]
     */
    public function isCreateAllowedByMenuModel(MenuModel &$MenuModel)
    {
        return $this->isAllowedByMenuModelAction($MenuModel, 'create');
    }

    /**
     * 是否拥有当前菜单的 更新（00100） 权限
     * @param  MenuModel &$MenuModel [description]
     * @return boolean               [description]
     */
    public function isUpdateAllowedByMenuModel(MenuModel &$MenuModel)
    {
        return $this->isAllowedByMenuModelAction($MenuModel, 'update');
    }

    /**
     * 是否当前菜单的的 读(00010) 权限
     * @param  MenuModel &$MenuModel 菜单
     * @return boolean               
     */
    public function isReadAllowedByMenuModel(MenuModel &$MenuModel)
    {
        return $this->isAllowedByMenuModelAction($MenuModel, 'read');
    }

    /**
     * 是否拥有当前菜单的 删除(00001) 权限
     * @param  MenuModel &$MenuModel [description]
     * @return boolean               [description]
     */
    public function isDeleteAllowedByMenuModel(MenuModel &$MenuModel)
    {
        return $this->isAllowedByMenuModelAction($MenuModel, 'delete');
    }

    /**
     * 获取当前用户组的所有用户
     * @param  string  $name 用户组name键值
     * @author  gaoliming
     */
    public function getAllUserModel($name)
    {
        //制定索引
        $map = array('user_group_name' => $name);

        //取出所有用户
        $UserModel = new UserModel;
        return $UserModel->where($map)->select();
    }


}