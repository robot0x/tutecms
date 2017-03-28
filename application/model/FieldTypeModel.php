<?php
namespace app\model;
use think\Db;
use think\Loader;
/**
 * 字段类型
 */
class FieldTypeModel extends ModelModel
{
    protected $pk           = 'name';
    private $config         = null;                 // 配置信息
    private $filter         = null;                 // 过滤器信息

    /**
     * 读取相关配置文件后，得出配置信息
     * @return array 
     */
    public function getConfig()
    {
        if (null === $this->config) {
            $configFilePath = APP_PATH . 
                'field' . DS . 
                'config' . DS .
                $this->getData('name') . 'Config.php';
            $configFilePath = realpath($configFilePath);
            if (false === $configFilePath) {
                $this->config = [];
            } else {
                $this->config = include $configFilePath;
            }
        }

        return $this->config;
    }
}