<?php
namespace app\model;
/**
* 课程菜单
*/
class ChuhangCurriculumModel extends ModelModel
{
	//获取课表显示的信息学
	public function getResult($data){
		//获取前台显示的每天含有的节次数
		$ChuhangTimeModels = ChuhangTimeModel::all();
		$countTime = count($ChuhangTimeModels);
		for ($i=0; $i<$countTime; $i++) {
			$time = $ChuhangTimeModels[$i]->getData('time');
			//获取前台显示的每周的天数
			$ChuhangDayModels = ChuhangDayModel::all();
			$countDay = count($ChuhangDayModels);

			for ($m=0; $m<$countDay; $m++) {
				$day = $ChuhangDayModels[$m]->getData('day');

				
				//查找对应的当前节次，当前天的课程信息
				$map['time_id'] = $time;
				$map['day_id'] = $day;
				if (isset($data['classroom_id'])) {
					$map['classroom_id'] = $data['classroom_id'];
				}
				
				$self = new self;
				//判断查询条件是否为全选
				if (isset($data['week_id']) && $data['week_id'] == 100) {
					
					$selfs[$m] = $self->where($map)->select();

					//查找除周次信息不同其它均相同的数据
					if (!empty($selfs[$m])) {
					$selfs[$m] = self::getCourseInfo($selfs[$m]);
					}
				//判断如果没有点击查询按钮，则显示所有的课程
				} elseif (isset($data['week_id']) === false) {
					$selfs[$m] = $self->where($map)->select();

					//查找除周次信息不同其它均相同的数据
					if (!empty($selfs[$m])) {
					$selfs[$m] = self::getCourseInfo($selfs[$m]);
					}
					//如果用于选择了查询的周次，则显示当前周次的信息
				} else {
					if (isset($data['week_id'])) {
						$map['week'] = $data['week_id'];
					}
					
					$selfs[$m] = $self->where($map)->select();
					//删除复合查询条件的数据的配置信息
					$count = count($selfs[$m]);
					for ($c=0; $c<$count; $c++) {
						$selfs[$m][$c]->setData('config', '');
						$selfs[$m][$c]->save();
					}
				}

				
			}
			//获取每个节次对应的课程信息
			$results[$i] = $selfs;
		}
		return $results;

	}

	//获取课程名称
	public function getCourseName($courseId) {
		$CourseName = ChuhangCourseModel::get($courseId)->getData('name');
		return $CourseName;
	}

	//获取教师名称
	public function getTeacherName($teacherId){
		$teacherName = ChuhangTeacherModel::get($teacherId)->getData('name');
		return $teacherName;
	}

	//获取班级名称
	public function getKlassName($data){
		$klassNames = json_decode($data, true);
		$count = count($klassNames);
		for ($i=0; $i<$count; $i++) {
			$klassName[$i] = ChuhangKlassModel::get($klassNames[$i])->getData('name');
		}
		return $klassName;
	}

	//获取数据的周次信息
	public function getWeekName($data){
		if (empty($data->getData('config'))) {
			$result = self::getChineseName($data->getData('week') - 1);
			return $result;
		}
		$weeks = json_decode($data->getData('config'));
		$weeks[] = $data->getData('week');
		sort($weeks);
		$count = count($weeks);
		for ($i=0; $i<$count; $i++) {
			$num[] = self::getChineseName($weeks[$i] - 1);
		}
		$num = implode($num, "、");
		return $num;
	}

	//获取周次,阿拉伯数字转化为中文数字
	static public function getChineseName($num){
		$num = $num + 1;
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
	    //如果是三位数去除第一位数字，如一十一（11），转化为十一
	    $first = substr($retval, 0, 3);
	    if (strlen($retval) === 9 && $first == '一') {
	    	$retval = substr($retval, 3, 8);
	    }
	    return $retval;
	}

	static public function getCourseInfo($arr){
		$count = count($arr);

		//找出数组中不重复的数字和重复的数字，如{1，2,3，2,3}，分为{1,2,3}、{2、3}
		for($i=0; $i<$count; $i++) {
		  $data1 = $arr[0]->getData();
		  unset($data1['update_time']);
		  unset($data1['create_time']);
		  unset($data1['config']);
		  $data2 = $arr[$i]->getData();
		  unset($data2['update_time']);
		  unset($data2['create_time']);
		  unset($data2['config']);
		  $data = array_diff_assoc($data2, $data1);
		  if ($i !== 0 && count($data) == 2 && isset($data['week'])) {
		    $result[] = $arr[$i];
		    unset($arr[$i]);
		    $arr = array_values($arr);
		    $i -= 1;
		    $count -= 1;
		  }
		  if ($i == ($count - 1)){
		    $new[] = $arr[0];
		    unset($arr[0]);
		    sort($arr);
		    $count -= 1;
		    $i = 0;
		  }
		}

		
		//判断数组中是否存在不重复的数字
		if (isset($result) === false) {
			return $new;
		}
		$count1 = count($new);  //不重合的数组
		$count2 = count($result);
		//将重复的数字保存在不其中一条数据的配置信息中，如{1，2,3，2,3}，分为{1,2,3}、{2、3}，则将第二个数组的2和3的周次信息保存到第一个数组的2,3中
		for ($x=0; $x<$count1; $x++) {
			for ($y=0; $y<$count2; $y++) {
				 $data3 = $new[$x]->getData();
				 unset($data3['update_time']);
				 unset($data3['create_time']);
				 unset($data3['config']);
				 $data4 = $result[$y]->getData();
				 unset($data4['update_time']);
				 unset($data4['create_time']);
				 unset($data4['config']);
				 $data5 = array_diff_assoc($data3, $data4);
				 if (count($data5) == 2 && isset($data5['week'])) {
				 	//设置在循环中变化的变量名
				 	${"config_".$x}[] = $result[$y]->getData('week');
				 }
			}
			//将config信息保存在表中
			if (isset(${"config_".$x})){
				${"config_".$x} = json_encode(${"config_".$x});
				$new[$x]->setData('config', ${"config_".$x});
				$new[$x]->save();
			}
		}
		return $new;
	}


	//获取所有的教室，用于查询
	public function getAllClassroom(){
		$ChuhangClassroomModel = ChuhangClassroomModel::all();
		return $ChuhangClassroomModel;
	}

	//获取所有的周次，用于查询
	public function getAllWeek(){
		$ChuhangPeriodModel = ChuhangPeriodModel::get();
        $week = (int)((($ChuhangPeriodModel->getData('end_time') - $ChuhangPeriodModel->getData('start_time'))/86400)/7) + 1;
        for ($i=0; $i<$week; $i++) {
        	$weeks[] = (object)($i+1);
        }
        return $weeks;
	}

	//判断用于选择的当前的教室的当前周次，当前天，当前节次是否已有其他课程安排
	public function getJudge($data) {
		$map['classroom_id'] = $data['classroom'];
		//获取周次
		$countWeek = count($data['week']);
		for ($i=0; $i<$countWeek; $i++) {
			$map['week'] = $data['week'][$i];
			//获取当前天数
			$countDay = count($data['day']);
			for ($m=0; $m<$countDay; $m++) {
				$map['day_id'] = $data['day'][$m];
				//获取当前节次
				$countTime = count($data['time']);
				for ($n=0; $n<$countTime; $n++) {
					$map['time_id'] = $data['time'][$n];
					//查询课表中是否已有课程安排
					$ChuhangCurriculumModel = new ChuhangCurriculumModel;
					$result = $ChuhangCurriculumModel->where($map)->select();
					if (!empty($result)) {
						return true;
					}
				}
			}
		}

		return false;
	}

	//在update中判断用于选择的当前的教室的当前周次，当前天，当前节次是否已有其他课程安排
	public function getEditJudge($data) {
		$map['classroom_id'] = $data['classroom'];
		//获取要编辑的课程的周次信息
		$countWeek = count($data['week']);
		$curriculum = ChuhangCurriculumModel::get($data['id'])->getData();
		$search['classroom_id'] = $curriculum['classroom_id'];
		$search['teacher_id'] = $curriculum['teacher_id'];
		$search['time_id'] = $curriculum['time_id'];
		$search['day_id'] = $curriculum['day_id'];
		$search['klass'] = $curriculum['klass'];
		$CrriculumModel = new ChuhangCurriculumModel;
		$CrriculumModels = $CrriculumModel->where($search)->select();
		$countweek = count($CrriculumModels);
		for ($x=0; $x<$countweek; $x++) {
			$weeks[] = $CrriculumModels[$x]->getData('week');
		}

		for ($i=0; $i<$countWeek; $i++) {
			$map['week'] = $data['week'][$i];
			//获取当前天数
			$countDay = count($data['day']);
			for ($m=0; $m<$countDay; $m++) {
				$map['day_id'] = $data['day'][$m];
				//获取当前节次
				$countTime = count($data['time']);
				for ($n=0; $n<$countTime; $n++) {
					$map['time_id'] = $data['time'][$n];

					//判断的用户选择的课程是否已选择
					if (($map['day_id'] == $curriculum['day_id'] && $map['time_id'] == $curriculum['time_id'] && in_array($map['week'], $weeks)) == false) {
						
						//查询课表中是否已有课程安排
						$ChuhangCurriculumModel = new ChuhangCurriculumModel;
						$result = $ChuhangCurriculumModel->where($map)->select();
						
						if (!empty($result)) {
							return true;
						}
					}
					
				}
			}
		}

		return false;
	}

	//判断课程是否为全选，判断删除、编辑等操作的执行
	public function isAll($data){
		if (empty($data)) {
            $isAll = 1;
        } elseif ($data['week_id'] == 100) {
            $isAll = 1;
        } else {
        	$isAll = 0;
        }
        
        return $isAll;
	}

	public function getEditWeekInfo($weeks, $week_id) {
		$count = count($weeks);
		for ($i=0; $i<$count; $i++) {
			$week[] = $weeks[$i]->getData('week');
		}
		if (in_array($week_id, $week)) {
			return true;
		}
		return false;
	}
	


}
