<?php
namespace app\model;

use app\Common;
use think\Db;

class PluginDataFrontPageNewsModel extends ModelModel
{
    protected $data = ['content_id' => 0, 'type' => 1, 'weight' => 0];
    protected $ContentModel = null;

    public function ContentModel() {
        if (null === $this->ContentModel) {
            $map = ['id' => $this->getData('content_id')];
            $this->ContentModel = ContentModel::get($map);
        }
        
        return $this->ContentModel;
    }

    /**
     * 上下文是否被推荐到首页
     * @return   boolean                  是：true;否:false
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T19:45:31+0800
     */
    public function isShow() {
        if (0 === $this->getData('content_id')) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 上下文是否被推荐到首页
     * @return   string                  
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T19:46:12+0800
     */
    public function isShowForView() {
        if ($this->isShow()) {
            return 'true';
        } else {
            return 'false';
        }
    }

    /**
     * 是否为 推荐新闻  (news:推荐新闻, info:推荐通知)
     * @return   boolean                   
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T19:46:26+0800
     */
    public function typeIsNews() {
        if ('news' === $this->getData('type')) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 是否为 推荐新闻  (news:推荐新闻, info:推荐通知)
     * @return   String          
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-18T19:46:26+0800
     */
    public function typeIsNewsForView() {
        if ($this->typeIsNews()) {
            return 'true';
        } else {
            return 'false';
        }
    }


    static public function getAccessContentModelsByActionUserGroupNameTypeCount($action, $userGroupName, $type = 'news', $count = 6) {
        $contents = Db::view('plugin_data_front_page_news','content_id')
            ->view('content', 'id', 'content.id=plugin_data_front_page_news.content_id', 'LEFT')
            ->view('access_user_group_menu','action,user_group_name','access_user_group_menu.menu_id=content.menu_id','LEFT')
            ->where('access_user_group_menu.action','=',$action)
            ->where('access_user_group_menu.user_group_name', '=', $userGroupName)
            ->where('plugin_data_front_page_news.type', '=', $type)
            ->order('plugin_data_front_page_news.weight desc, plugin_data_front_page_news.update_time desc')
            ->limit($count)
            ->select();
            
        $ContentModels = [];
        foreach ($contents as $content) {
            array_push($ContentModels, ContentModel::get($content['content_id']));
        }

        return $ContentModels;
    }
}