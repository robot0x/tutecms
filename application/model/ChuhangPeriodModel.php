<?php
namespace app\model;
/**
* 周期
*/
class ChuhangPeriodModel extends ModelModel
{
	//获取对应的周次
	public function getWeek($week){
		for ($i=0; $i<$week; $i++) {
			$results[$i] = $i+1;
			$results[$i] = self::getNumber($results[$i]);
			//如果是三位数去除第一位数字，如一十一（11），转化为十一
			$first = substr($results[$i], 0, 3);
			if (strlen($results[$i]) === 9 && $first == '一'){
				$results[$i] = substr($results[$i], 3, 8);
			}
		}
		return $results;
	}

	//将阿拉伯数字转化为简体中文
	public function getNumber($num)
	{
	    $char = array("零","一","二","三","四","五","六","七","八","九");
	    $dw = array("","十");
	    $retval = "";
	    $proZero = false;
	    for($i = 0;$i < strlen($num);$i++)
	    {
	        if($i > 0)    $temp = (int)(($num % pow (10,$i+1)) / pow (10,$i));
	        else $temp = (int)($num % pow (10,1));
	        
	        if($proZero == true && $temp == 0) continue;
	        
	        if($temp == 0) $proZero = true;
	        else $proZero = false;
	        
	        if($proZero)
	        {
	            if($retval == "") continue;
	            $retval = $char[$temp].$retval;
	        }
	        else $retval = $char[$temp].$dw[$i].$retval;
	    }
	    if($retval == "一十") $retval = "十";
	    return $retval;
	}
}
