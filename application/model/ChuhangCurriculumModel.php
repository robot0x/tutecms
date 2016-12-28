<?php
namespace app\model;
/**
* 课程菜单
*/
class ChuhangCurriculumModel extends ModelModel
{
	/**
	 * 获取显示的课表信息
	 * @param  [int] $currentTermId        [当前学期id]		
	 * @param  [int] $currentWeek        [获取当前周次]
	 * @param  [bool] $isAllWeeksSelected [判断查询条件是否为全选]
	 * @param  [array] $Data [获取查询信息]
	 * @return [array]                     [课表信息]
	 * @author chuhang 
	 */
	static public function getAllCurriculumsByTermId($currentTermId, $currentWeek, $isAllWeeksSelected, $data){
		//获取当前学期每天含有的节次数
		$ChuhangTimeModels = ChuhangTimeModel::getCurrentTermTimes($currentTermId);
		$countTime = count($ChuhangTimeModels);
		for ($i=0; $i<$countTime; $i++) {
			$time = $ChuhangTimeModels[$i]->getData('id');
			//获取当前学期每周含有的天数
			$ChuhangDayModels = ChuhangDayModel::getCurrentTermDays();
			$countDay = count($ChuhangDayModels);

			for ($m=0; $m<$countDay; $m++) {
				$day = $ChuhangDayModels[$m]->getData('id');

				//查找对应的当前节次，当前天的课程信息
				$map['time_id'] = $time;
				$map['day_id'] = $day;
				$map['term_id'] = $currentTermId;
				//若果没有查询信息，则取第一个教室的课程信息，如果有，按查询条件查找教室
				if (!empty($data['classroom_id'])) {
					$map['classroom_id'] = $data['classroom_id'];
				} else {
					$ChuhangClassroomModel = ChuhangClassroomModel::find();
					$classroomId = $ChuhangClassroomModel->getData('id');
					$map['classroom_id'] = $classroomId;
				}
				$self = new self;
				//判断查询条件是否为全选
				if ($isAllWeeksSelected) {
					
					$selfs[$m] = $self->where($map)->select();
					//查找除周次信息不同其它均相同的数据
					if (!empty($selfs[$m])) {
					$selfs[$m] = self::getCourseInfo($selfs[$m]);
					}
				//若没有查询信息，则显示当前周次的课程信息，若有，按照查询条件显示课程信息
				} else {
					if (isset($data['week_id'])) {
						$map['week'] = $data['week_id'];
					} else {
						$map['week'] = $currentWeek;
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



	//获取课表显示的信息
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

	//找出数组中不重复的数字和重复的数字，如{A,a,B}，分为{A,B}、{a},此函数中，curriculum表中的三条数据，其中A、a两条数据除周次外，其他信息均相同，则此时只需要显示A、a两条数据中的一条。并将a的元素的周次信息放在A的配置信息中,即返回{A、B}。$result = {a}, $new = {A、B}
	static public function getCourseInfo($arr){
		$count = count($arr);

		//找出数组中不重复的数字和重复的数字，如{2,1,2}，分为{1,2,}、{1}
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
		  if ($count == 1) {
		  	$new[] = $arr[0];
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

	//获取所有的周次，用于查询
	static public function getAllWeeks(){
		$currentTermId = ChuhangTermModel::getCurrentTerm();
		$ChuhangTermModel = ChuhangTermModel::get($currentTermId);
        $week = (int)((($ChuhangTermModel->getData('end_time') - $ChuhangTermModel->getData('start_time'))/86400)/7) + 1;
        for ($i=0; $i<$week; $i++) {
        	$weeks[] = $i+1;
        }
        return $weeks;
	}

	//判断用于选择的当前的教室的当前周次，当前天，当前节次是否已有其他课程安排
	public function isHave($data, $termId) {
		$map['classroom_id'] = $data['classroom_id'];
		$map['term_id'] = $termId;
		$map['is_delete'] = 0;
		//获取周次
		$countWeek = count($data['week']);
		for ($i=0; $i<$countWeek; $i++) {
			$map['week'] = $data['week'][$i];
			//获取当前天数
			$countDay = count($data['day_id']);
			for ($m=0; $m<$countDay; $m++) {
				$map['day_id'] = $data['day_id'][$m];
				//获取当前节次
				$countTime = count($data['time_id']);
				for ($n=0; $n<$countTime; $n++) {
					$map['time_id'] = $data['time_id'][$n];
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

	//对用户编辑的课程信息判断是否在同一教室时间段内有其他课程安排，若有，返回提示信息，若没有，进行更新
	static public function isHaveAssociateCurriculum($data, $currentTermId, $klass) {

		//获取要编辑的课程的信息(多条数据)
		$countWeek = count($data['week']);
		$curriculum = ChuhangCurriculumModel::get($data['id'])->getData();
		$search['term_id'] = $currentTermId;
		$search['classroom_id'] = $curriculum['classroom_id'];
		$search['course_id'] = $curriculum['course_id'];
		$search['teacher_id'] = $curriculum['teacher_id'];
		$search['time_id'] = $curriculum['time_id'];
		$search['day_id'] = $curriculum['day_id'];
		$search['klass'] = $curriculum['klass'];

		$ChuhangCurriculumModel = new ChuhangCurriculumModel;
		$ChuhangCurriculumModels = $ChuhangCurriculumModel->where($search)->select();
		//对要编辑的课程信息软删除
		foreach ($ChuhangCurriculumModels as $ChuhangCurriculumModel) {
			//将is_delete设置为1并保存
            $ChuhangCurriculumModel->setData('is_delete', 1);
            $ChuhangCurriculumModel->save();
		}
		//如果用户选择的课程在同一教室的同一时间段已有其他课程安排，则把软删除的数据恢复，返回提示信息
		if ($ChuhangCurriculumModel->isHave($data, $currentTermId)){
			foreach ($ChuhangCurriculumModels as $ChuhangCurriculumModel) {
				$ChuhangCurriculumModel->setData('is_delete', 0);
				$ChuhangCurriculumModel->save();
			}
			return true;
		}
		//把原数据删除
		foreach ($ChuhangCurriculumModels as $ChuhangCurriculumModel) {
			//删除课程信息
            $ChuhangCurriculumModel->delete();
		}
		
		//对课程所在的每个周次进行保存
        $ChuhangCurriculumModel->saveCurriculum($data, $klass, $currentTermId);
		
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

	//获取本学期的课程、教室、班级、教师、节次/天、天数/周、周次等信息
	static public function getAllInfo(){
		$allInfo = [];
		$allInfo['course'] = ChuhangCourseModel::all();
		$allInfo['teacher'] = ChuhangTeacherModel::all();
		$allInfo['classroom'] = ChuhangClassroomModel::all();
		$allInfo['klass'] = ChuhangKlassModel::all();
		//获取本学期的节次信息
		$currentTermId = ChuhangTermModel::getCurrentTerm();
		$map['term_id'] = $currentTermId;
		$map['is_delete'] = 0;
		$ChuhangTimeModels = new ChuhangTimeModel;
		$allInfo['time'] = $ChuhangTimeModels->where($map)->select();

		//获取本学期的天数/周的信息
		$ChuhangDayModel = new ChuhangDayModel;
		$allInfo['day'] = $ChuhangDayModel->where($map)->select();

		//获取本学期的周次信息
		$allInfo['week'] = ChuhangCurriculumModel::getAllweeks();
		return $allInfo;

	}


	//保存用户添加的课程信息
	public function saveCurriculum($data, $klass, $currentTermId) {
		for ($i=0; $i<count($data['week']); $i++) {
            //对课程所在的天进行保存
            for ($m=0; $m<count($data['day_id']); $m++) {
                //对课程所在的节次进行保存
                for ($n=0; $n<count($data['time_id']); $n++) {
                    $ChuhangCurriculumModel = new ChuhangCurriculumModel;
                    $ChuhangCurriculumModel->setData('course_id', $data['course_id']);
                    $ChuhangCurriculumModel->setData('teacher_id', $data['teacher_id']);
                    $ChuhangCurriculumModel->setData('classroom_id', $data['classroom_id']);
                    $ChuhangCurriculumModel->setData('klass', $klass);
                    $ChuhangCurriculumModel->setData('time_id', (int)$data['time_id'][$n]);
                    $ChuhangCurriculumModel->setData('day_id', (int)$data['day_id'][$m]);
                    $ChuhangCurriculumModel->setData('week', (int)$data['week'][$i]);
                    //获取课程所在的学期，并保存
                    $ChuhangCurriculumModel->setData('term_id', $currentTermId);

                    if (false === $ChuhangCurriculumModel->save()) {
                        return true;
                    }
                }
            }
        }
        return false;
	}
	
	//获取要编辑的课程信息，除周次外其他信息均与此条信息相同
	public function getEditCurriculumInfo() {
		$map['classroom_id'] = $this->getData('classroom_id');
        $map['teacher_id'] = $this->getData('teacher_id');
        $map['course_id'] = $this->getData('course_id');
        $map['time_id'] = $this->getData('time_id');
        $map['day_id'] = $this->getData('day_id');
        $map['klass'] = $this->getData('klass');
        $self = new self;
        $results = $self->where($map)->select();
        return $results;
	}

	//键名isAll的值为1，代表删除关联的课程,删除此条数据config信息中的对应信息
	public function deleteAssociateInfo($currentTermId) {
		$All = $this->getData('config');
		$All = json_decode($All);
		$map['term_id'] = $currentTermId;
		$map['course_id'] = $this->getData('course_id');
		$map['classroom_id'] = $this->getData('classroom_id');
		$map['day_id'] = $this->getData('day_id');
		$map['time_id'] = $this->getData('time_id');
		$count = count($All);
		for ($i=0; $i<$count; $i++) {
		    $map['week'] = $All[$i];
		    $self = self::get($map);
		    if ($self->delete() === false) {
		    	return true;
		    }
		}
		return false;
	}

	//如果删除删除的课表信息config字段不为空，则直接删除，如果为空，则将关联的课表信息中对应的config字段中的本周次信息删除
	public function deleteCurrentInfo($data, $currentTermId){
		$map['term_id'] = $currentTermId;
		$map['course_id'] = $this->getData('course_id');
		$map['classroom_id'] = $this->getData('classroom_id');
		$map['day_id'] = $this->getData('day_id');
		$map['time_id'] = $this->getData('time_id');
		$self = new self;
		$selfs = $self->where($map)->select();
		//删除关联的课表的config信息中的本周次信息
		$currentWeek = $this->getData('week');
		foreach ($selfs as $self) {
			if (!empty($self->getData('config'))) {
				$weekConfigs = $self->getData('config');	
				$weekConfigs = json_decode($weekConfigs);
				foreach ($weekConfigs as $key => $weekConfig) {
					if ($weekConfig === $currentWeek) {
						unset($weekConfigs[$key]);
						sort($weekConfigs);
					}
				}
				if (empty($weekConfigs)) {
					$self->setData('config', '');
					$self->save();
				} else {
					$weekConfigs = json_encode($weekConfigs);
					$self->setData('config', $weekConfigs);
					$self->save();
				}
			}
		}
		//删除信息
		if ($this->delete() === false) {
			return true;
		}
		return false;
	}

	// static public function isHaveAssociateCurriculum($data, $currentTermId) {
	// 	var_dump($data);var_dump($currentTermId);die();

	// }


}
