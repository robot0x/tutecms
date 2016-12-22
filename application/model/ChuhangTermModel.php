<?php
namespace app\model;
/**
* 周期
*/
class ChuhangTermModel extends ModelModel
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

	/**
	 * 保存节次表和天数表中对应该学期对应的信息
	 * @param  [type] $data [description]
	 * @return [type]       [description]
	 */
	public function saveTimeDay($data){
		for ($i=0; $i<$data['time']; $i++) {
			$ChuhangTimeModel = new ChuhangTimeModel;
			$ChuhangTimeModel->setData('term_id', $this->getData('id'));
			$ChuhangTimeModel->setData('time', $i+1);
			$ChuhangTimeModel->save();
		}	
		for ($i=0; $i<$data['day']; $i++) {
			$ChuhangDayModel = new ChuhangDayModel;
			$ChuhangDayModel->setData('term_id', $this->getData('id'));
			$ChuhangDayModel->setData('day', $i+1);
			$ChuhangDayModel->save();
		}	
	}

	/**
	 * 使所有学期status值为0
	 */
	public function makeAllTermStatusZero() {
		$ChuhangTermModels = ChuhangTermModel::all();
		foreach ($ChuhangTermModels as $ChuhangTermModel) {
			$ChuhangTermModel->setData('status', 0);
			$ChuhangTermModel->save();
		}
	}

	//删除本学期对应的time和day表中的信息
	public function deleteTimeDayInfo($id){
		//删除time表中信息
		$ChuhangTimeModel = new ChuhangTimeModel;
		$map['term_id'] = $id;
		$ChuhangTimeModels = $ChuhangTimeModel->where($map)->select();
		foreach ($ChuhangTimeModels as $ChuhangTimeModel) {

			$ChuhangTimeModel->setData('is_delete', 1);
			$ChuhangTimeModel->save();

		}
		//删除day表中的信息
		$ChuhangDayModel = new ChuhangDayModel;
		$map['term_id'] = $id;
		$ChuhangDayModels = $ChuhangDayModel->where($map)->select();
		foreach ($ChuhangDayModels as $ChuhangDayModel) {
			$ChuhangDayModel->setData('is_delete', 1);
			$ChuhangDayModel->save();
		}
	}

	// public function updateTimeDayInfo($data){
	// 	$ChuhangTimeModel = new ChuhangTimeModel;
	// 	$map['term_id'] = $data['id'];
	// 	$ChuhangTimeModels = $ChuhangTimeModel->where($map)->select();
	// 	if (count($ChuhangTimeModels) != $data['term_id']) {
			
	// 	}
	// }
}
