<?php
namespace app\model;

use app\Common;


class ContentTypeModel extends ModelModel
{
    private $MenuModel = null;                     // 对应的菜单模型
    private $FieldModels = null;

    protected $pk = 'name';


    public function getName()
    {
        return $this->name;
    }

    public function MenuModel()
    {
        if (null === $this->MenuModel) {
            $this->MenuModel = MenuModel::get(['id' => $this->getData('menu_id')]);
        }
        return $this->MenuModel;
    }

    /**
     * 当前菜单类型对应的所有的字段模型 1:n
     * @return lists FieldModel
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-02T12:18:22+0800
     */
    public function FieldModels()
    {
        if (null === $this->FieldModels) {
            $this->FieldModels = FieldModel::getListsByRelateTypeRelateValue('Content', $this->getData('name'));
        }

        return $this->FieldModels;
    }

    /**
     * 获取对应的menu
     * @param int  $menu_id 
     * @return  object menu
     * @author  gaoliming 
     */
    public function getMenu($menu_id)
    {
        return $this->getMenuModelByMenuId($menu_id);
    }

    /**
     * 重构getMenu 该方法不应该写在这.... 用menuId获取MenuModel应该直接调用MenuModel的get()方法
     * @param    int                   $menuId 菜单id
     * @return   MennModel                           
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2016-12-30T09:45:52+0800
     */
    public function getMenuModelByMenuId($menuId) {
        return MenuModel::get((int)$menuId);
    }

    /**
     * 通过菜单ID获取对应的内容类型
     * @param    int                   $menuId 菜单id
     * @return   $this                           
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2016-12-30T09:49:30+0800
     */
    static public function getContentTypeModelByMenuId($menuId) {
        $map = [];
        $map['menu_id'] = (int)$menuId;
        return self::get($map);
    }

    /**
     * 获取菜单类平铺式的树状结果
     * @return   array                   
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-13T16:59:19+0800
     */
    static public function getContentTypeModelTree() {
        $map = array("is_delete" => 0);
        // 获取所有的数据
        $ContentTypes = $ContenTypeModels = self::all($map);

        // 获取字段数据
        $datas = [];
        foreach($ContentTypes as $value) {
            array_push($datas, $value->getData());
        }

        // 转化树，再转回来
        $tree = Common::listToTree($datas, $pk = 'name', $pid = 'pname', $child = '_child', $root = '');
        $lists = Common::treeToList($tree);

        return $lists;
    }
}