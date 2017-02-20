<?php
namespace app\filter;

class DateFilter {
    /**
     * 获取中文的星期几
     * @param    时间戳                   $datatime 
     * @return   
     * @author 梦云智 http://www.mengyunzhi.com
     * @DateTime 2017-02-20T19:43:24+0800
     */
    static public function getChineseWeek($datatime) {
        $week = date('w', $datatime);
        $chineseWeeks = ['日', '一', '二', '三', '四', '五', '六'];
        return $chineseWeeks[$week];
    }
}