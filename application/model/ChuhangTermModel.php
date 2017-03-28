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
	 * 使所有学期status值为0
	 */
	public function makeAllTermStatusZero() {
		$ChuhangTermModels = ChuhangTermModel::all();
		foreach ($ChuhangTermModels as $ChuhangTermModel) {
			$status = $ChuhangTermModel->getData('status');
			if ($status) {
				$ChuhangTermModel->setData('status', 0);
				$ChuhangTermModel->save();
			}
			
		}
	}

	//更新本学期对应的time表中的信息
	public function updateTimeInfo($data){
		//如果更新的节次和原数据的节次信息相同，则直接返回
		if ($data['time'] === $this->getData('time')) {
			return true;
		}

		//查询本学期的节次信息	
		$map['term_id'] = $data['id'];
		$map['is_delete'] = 0;
		$ChuhangTimeModel = new ChuhangTimeModel;
		$ChuhangTimeModels = $ChuhangTimeModel->where($map)->select();

		$time = $this->getData('time');

		//假设原来每学期有4节课，如果更新后的节次少于4节，如$data['time']为3， 则把原来的前三节节次信息保留，第四节的is_delete更新为1
		if ($data['time'] < $time) {
			$ChuhangTimeModels = array_reverse($ChuhangTimeModels);
			for ($i=0; $i<($time - $data['time']); $i++) {
				$ChuhangTimeModels[$i]->setData('is_delete', 1);
				$ChuhangTimeModels[$i]->save();
			}

		}

		//假设原来每学期有4节课，如果更新后的节次大于4节，如$data['time']为5， 则把原来的节次信息保留，新增一个节次
		if ($data['time'] > $time) {
			for ($i=$time; $i<$data['time']; $i++) {
				$ChuhangTimeModel = new ChuhangTimeModel;
				$ChuhangTimeModel->setData('time', $i+1);
				$ChuhangTimeModel->setData('term_id', $data['id']);
				$ChuhangTimeModel->save();
			}
		}
	}

	//更新本学期对应的day表中的信息
	public function updateDayInfo($data){
		//如果更新的天数和原数据中的天数相同，则直接返回
		if ($data['day'] === $this->getData('day')) {
			return true;
		}

		//查询本学期的天数信息	
		$map['term_id'] = $data['id'];
		$map['is_delete'] = 0;
		$ChuhangDayModel = new ChuhangDayModel;
		$ChuhangDayModels = $ChuhangDayModel->where($map)->select();

		$day = $this->getData('day');

		//假设原来每星期有4天上课，如果更新后的天数少于4天，如$data['day']为3， 则把原来的前三天天数信息保留，第四天的is_delete更新为1
		if ($data['day'] < $day) {
			$ChuhangDayModels = array_reverse($ChuhangDayModels);
			for ($i=0; $i<($day - $data['day']); $i++) {
				$ChuhangDayModels[$i]->setData('is_delete', 1);
				$ChuhangDayModels[$i]->save();
			}

		}

		//假设原来每星期有4天上课，如果更新后的天数大于4天，如$data['day']为5， 则把原来的天数信息保留，新增一个天数
		if ($data['day'] > $day) {
			for ($i=$day; $i<$data['day']; $i++) {
				$ChuhangDayModel = new ChuhangDayModel;
				$ChuhangDayModel->setData('day', $i+1);
				$ChuhangDayModel->setData('term_id', $data['id']);
				$ChuhangDayModel->save();
			}
		}
	}

	//获取当前学期
	static public function getCurrentTerm(){
		$ChuhangTermModels = ChuhangTermModel::all();
		foreach ($ChuhangTermModels as $ChuhangTermModel) {
			//如果term表中存在status字段为1的数据，获取该数据id
			if ($ChuhangTermModel->getData('status')) {
				$result = $ChuhangTermModel->getData('id');
			}

		}
		if (!isset($result)) {
			return false;
		}
		
		return $result;
	}

	//获取当前周次
	static public function getCurrentWeek($id){
		//获取当前学期的起始、结束时间
		$ChuhangTermModel = ChuhangTermModel::get($id);
		$startTime = $ChuhangTermModel->getData('start_time');
		$endTime = $ChuhangTermModel->getData('end_time');

		//判断当前时间是否在该学期时间跨度内
		if (time() >= $startTime && time() <= $endTime) {
			$date = date('Y-m-d', time());
			$d1 = strtotime($date);
			$d2 = ceil(($d1-$startTime)/60/60/24);
			$week = (int)($d2/7) + 1;
			return $week;
		}
		return 1;
	}


	//判断周次查询的信息是否为全选
	static public function getIsAllWeeksSelected($data) {
		if (!empty($data) && $data['week_id'] == 0) {
			return 1;
		}

		return 0;
	}

	//报错学期对应的节次信息和星期/周的信息
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

	//删除本学期对应的节次、天数表的信息
	public function deleteTimeDayInfo($id){
		$map['term_id'] = $id;
		$map['is_delete'] = 0;
		//删除time表中的对应本学期的信息
		$ChuhangTimeModel = new ChuhangTimeModel;
		$ChuhangTimeModels = $ChuhangTimeModel->where($map)->select();
		foreach ($ChuhangTimeModels as $ChuhangTimeModel) {
			$ChuhangTimeModel->setData('is_delete', 1);
			$ChuhangTimeModel->save();
		} 
		//删除day表的本学期的天数信息
		$ChuhangDayModel = new ChuhangDayModel;
		$ChuhangDayModels = $ChuhangDayModel->where($map)->select();
		foreach ($ChuhangDayModels as $ChuhangDayModel) {
			$ChuhangDayModel->setData('is_delete', 1);
			$ChuhangDayModel->save();
		} 
	}
}
