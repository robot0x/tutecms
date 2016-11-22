<?php
namespace app\model;
use app\Common;
/**
 * body字段
 */
class FieldDataBodyModel extends FieldModel
{
    /**
     * 更新字段
     * @param    int                   $fieldId 字段ID
     * @param    int                   $keyId   
     * @param    string                   $value   值
     * @return   int                            更新的结果
     * @author panjie panjie@mengyunzhi.com
     * @DateTime 2016-09-07T15:26:18+0800
     */
    static public function updateList($fieldId, $keyId, $value)
    {
        $Object = self::get(['field_id' => $fieldId, 'key_id' => $keyId]);
        $Object->setData('value', $value);
        return $Object->save();
    }

    /**
     * 用于截取首页图文列表的长度
     * @author chuhang 
     */
    public function substrArticle($string) {
        $length = '60';
        $etc = '...';
     
        $result = '';
        $string = html_entity_decode ( trim ( strip_tags ( $string ) ), ENT_QUOTES, 'UTF-8' );
        $strlen = strlen ( $string );
        for($i = 0; (($i < $strlen) && ($length > 0)); $i ++) {
            if ($number = strpos ( str_pad ( decbin ( ord ( substr ( $string, $i, 1 ) ) ), 8, '0', STR_PAD_LEFT ), '0' )) {
                if ($length < 1.0) {
                    break;
                }
                $result .= substr ( $string, $i, $number );
                $length -= 1.0;
                $i += $number - 1;
            } else {
                $result .= substr ( $string, $i, 1 );
                $length -= 0.5;
            }
        }
        $result = htmlspecialchars ( $result, ENT_QUOTES, 'UTF-8' );
        if ($i < $strlen) {
            $result .= $etc;
        }
        return $result;
    }
}

