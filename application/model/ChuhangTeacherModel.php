<?php
namespace app\model;
/**
* 教师
*/
class ChuhangTeacherModel extends ModelModel
{
	//获取教师信息
	static public function getTeacher() {
		$map = [];
		$map['is_delete'] = 0;
		$self = new self;
		$selfs = $self->where($map)->select();
		return $selfs;
	}
}
