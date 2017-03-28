<?php
namespace app\model;
/**
* 班级
*/
class ChuhangKlassModel extends ModelModel
{
	//判断edit课程信息时判断班级信息是否已选
	public function getEditKlassInfo($klass ,$klassId) {
		$klass = json_decode($klass);
		if (in_array($klassId, $klass)) {
			return true;
		}
		return false;
	}

	//获取班级信息
	static public function getKlass() {
		$map = [];
		$map['is_delete'] = 0;
		$self = new self;
		$selfs = $self->where($map)->select();
		return $selfs;
	}
}
