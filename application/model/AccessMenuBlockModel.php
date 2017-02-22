<?php
namespace app\model;
/**
 * 菜单-区块 权限
 */
class AccessMenuBlockModel extends ModelModel
{
    // 关闭自动写入时间戳
    protected $autoWriteTimestamp = false;

    /**
     * 根据传入手区块ID和菜单数组，更新权限表信息
     * @param    int                   $blockId 区块ID
     * @param    array                   $menuIds 菜单树组
     * @return                               
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-22T20:38:31+0800
     */
    public function updateByBlockIdMenuIds($blockId, $menuIds) {
        // 删除所有的数据
        $map = ['block_id' => (int)$blockId];
        $this->where($map)->delete();

        // 取出所有的菜单
        $MenuModels = MenuModel::all();

        $datas = [];
        $data = ['block_id' => $blockId];
        foreach ($MenuModels as $key => $MenuModel) {
            $id = (int)$MenuModel->getData('id');
            if (!array_key_exists($id, $menuIds)) {
                $data['menu_id'] = $id;
                array_push($datas, $data);
            }
        }

        $this->saveAll($datas);
    }
}