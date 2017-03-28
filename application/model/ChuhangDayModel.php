<?php
namespace app\model;
/**
* 天数每周
*/
class ChuhangDayModel extends ModelModel
{
	public function getDay($num)
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


	/**
	 * 获取当前学期每周含有的天数
	 * @return array           当前学期每周含有的天数信息     
	 */
	static public function getCurrentTermDays() {
		$currentTermId = ChuhangTermModel::getCurrentTerm();
		$self = new self;
		$map['term_id'] = $currentTermId;
		$map['is_delete'] = 0;
		$results = $self->where($map)->select();
		return $results;
	}
}
