<?php
namespace app\model;
/**
* 课程
*/
class ChuhangCurriculaModel extends ModelModel
{
	public function getChinieseNameByUrl($url) {
		if ($url === 'curricula') {
			return '课程';
		}
		if ($url === 'teacher') {
			return '教师';
		}
		if ($url === 'classroom') {
			return '教室';
		}
		if ($url === 'klass') {
			return '班级';
		}
	}

	static public function getCourse(){
		$map = [];
		$map['is_delete'] = 0;
		$self = new self;
		$selfs = $self->where($map)->select();
		return $selfs;
	}
}
