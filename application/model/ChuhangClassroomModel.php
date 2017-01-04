<?php
namespace app\model;
/**
* 教室
*/
class ChuhangClassroomModel extends ModelModel
{
	//获取现有的教室信息
	static public function getClassroom() {
		$map['is_delete'] = 0;
		$self = new self;
		$selfs = $self->where($map)->select();
		return $selfs;
	}
}
