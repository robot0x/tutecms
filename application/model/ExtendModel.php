<?php
namespace app\model;

/**
 * 扩展
 */
class ExtendModel {
    static public function isInstall($extendType, $name) {
        $map = ['name' => $name];
        if ($extendType === 'component') {
            $model = ComponentModel::get($map);
        } else if ($extendType === 'block') {
            $model = BlockTypeModel::get($map);
        } else if ($extendType === 'plugin') {
            $model = PluginTypeModel::get($map);
        } else if ($extendType === 'theme') {
            $model = ThemeModel::get($map);
        } else if ($extendType === 'filter') {
            $model = FilterTypeModel::get($map);
        } else {
            return false; 
        }

        if ('' === $model->getData('name')) {
            return false;
        } else {
            return true;
        }
    }


    static public function isInstallForView($extendType, $name) {
        if (self::isInstall($extendType, $name)) {
            return 'true';
        } else {
            return 'false';
        }
    }
}