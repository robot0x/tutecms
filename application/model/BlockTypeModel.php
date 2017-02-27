<?php
namespace app\model;
/**
 * 模块
 */
class BlockTypeModel extends ModelModel
{
    protected $pk           = 'name';
    private $config         = null;                 // 配置信息
    private $filter         = null;                 // 过滤器信息
    protected $autoWriteTimestamp = false;

    /**
     * 读取相关配置文件后，得出配置信息
     * @return array 
     */
    public function getConfig()
    {
        if (null === $this->config) {
            $configFilePath = APP_PATH . 
                'block' . DS . 
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

    /**
     * 读取相关 过滤器配置 文件后，得出过滤器信息
     * @return array 
     */
    public function getFilter()
    {
        if (null === $this->filter) {
            $filterFilePath = APP_PATH . 
                'block' . DS . 
                'filter' . DS .
                $this->getData('name') . 'Filter.php';
            $filterFilePath = realpath($filterFilePath);
            if (false === $filterFilePath) {
                $this->filter = [];
            } else {
                $this->filter = include $filterFilePath;
            }
        }

        return $this->filter;
    }
}