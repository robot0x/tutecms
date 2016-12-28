<?php
namespace app\filter\server;
/**
 * 字符串过滤器
 */
class StringServer
{
    /**
     * 字符串截取函数
     * @param  string $string 输入字符串
     * @param  array  $param 配置信息
     * $length 截取的长度
     * $etc 截取后缀
     * @return string         过滤后的字符串
     */
    static public function substr($string, $param = array()) {
        $length = '10';
        $etc = '...';
        if (array_key_exists('length', $param))
        {
            if (isset($param['length']['value'])) {
                $length = (int)$param['length']['value'];
            } else {
                $length = (int)$param['length'];
            }
        }

        if (array_key_exists('etc', $param))
        {
            if (isset($param['etc']['value'])) {
                $etc = (string)$param['etc']['value'];
            } else {
                $etc = (string)$param['etc'];
            }
        }

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

    /**
     * 去除html代码中的标记后截断 用于在在列表页显示文章的内容,避免了内容中有格式时，对版本的干扰
     * @param    string                   $htmlString html代码
     * @param    array                    $param      参数 
     * @return   [type]                               [description]
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2016-12-28T16:01:48+0800
     */
    static public function subHtmlString($htmlString, $param = array()) {
        $length = '10';
        $etc = '...';
        $decodeHtmlSpecialChars = true;
        if (array_key_exists('length', $param)) {
            $length = (int)$param['length'];
        }

        if (array_key_exists('etc', $param)) {
            $etc = (string)$param['etc'];
        }

        if (array_key_exists('decodeHtmlSpecialChars', $param)) {
            $decodeHtmlSpecialChars = (boolean)$param['decodeHtmlSpecialChars'];
        }

        if ($decodeHtmlSpecialChars) {
            $htmlString = htmlspecialchars_decode($htmlString);
        }

        $htmlString = strip_tags($htmlString);
        return self::substr($htmlString, ['length' => $length, 'etc' => $etc]);
    }
}