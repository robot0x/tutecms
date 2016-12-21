<?php
namespace app\component\controller;

use think\Request;

use app\model\ChuhangDayModel;
use app\model\ChuhangCourseModel;
use app\model\ChuhangClassroomModel;
use app\model\ChuhangKlassModel;
use app\model\ChuhangPeriodModel;
use app\model\ChuhangTimeModel;
use app\model\ChuhangTeacherModel;
use app\model\UserModel;  


class CurriculumController extends ComponentController
{
	public function indexAction(){
		//查询信息，并显示信息
		$name = input('get.name');
		$ChuhangCourseModel  = new ChuhangCourseModel;
		$map['is_delete'] = 0;
        $ChuhangCourseModels = $ChuhangCourseModel->where($map)->where('name', 'like', '%' . $name . '%')->paginate($this->config['count']['value']);
		$this->assign('ChuhangCourseModels', $ChuhangCourseModels);
		//赋值左侧导航active
		$this->assign('course', 'active');
		return $this->fetch();
	}

	public function addCourseAction(){
		$this->assign('course', 'active');
		return $this->fetch();
	}

	//保存课程信息
	public function saveCourseAction(){
		$data = Request::instance()->param();
		$ChuhangCourseModel = new ChuhangCourseModel;
		$ChuhangCourseModel->setData('name', $data['name']);
        //保存数据
        if (false === $ChuhangCourseModel->validate()->save($data))
        {
            return $this->error($ChuhangCourseModel->getError());
        }

        return $this->success('操作成功', url('@curriculum/course'));
	}


	//删除课程信息
	public function deleteCourseAction($id){
		$ChuhangCourseModel = ChuhangCourseModel::get($id);
		$ChuhangCourseModel->setData('is_delete', 1);
		if (false === $ChuhangCourseModel->save()) {
			return ($ChuhangCourseModel->getError());
		}
		return $this->success('删除成功');
	}

	//编辑课程信息
	public function editCourseAction($id){
		$ChuhangCourseModel = ChuhangCourseModel::get($id);
		$this->assign('ChuhangCourseModel', $ChuhangCourseModel);
		$this->assign('course', 'active');
		return $this->fetch('editCourse');
	}

	//更新课程信息
	public function updateCourseAction($id){
		$data = Request::instance()->param();
		$ChuhangCourseModel = ChuhangCourseModel::get($id);
		$ChuhangCourseModel->setData('name', $data['name']);

		//更新数据
        if (false === $ChuhangCourseModel->validate()->isUpdate()->save($data))
        {
            return $this->error($ChuhangCourseModel->getError());
        }

        return $this->success('操作成功', url('@curriculum/course'));
	}

	//显示教师信息
	public function teacherAction(){
		//查询信息，并显示信息
		$name = input('get.name');
		$ChuhangTeacherModel  = new ChuhangTeacherModel;
		$map['is_delete'] = 0;
        $ChuhangTeacherModels = $ChuhangTeacherModel->where($map)->where('name', 'like', '%' . $name . '%')->paginate($this->config['count']['value']);
		$this->assign('ChuhangTeacherModels', $ChuhangTeacherModels);
		//赋值左侧导航active
		$this->assign('teacher', 'active');
		return $this->fetch();
	}

	//添加教师
	public function addTeacherAction(){
		$this->assign('teacher', 'active');
		return $this->fetch();
	}

	//保存教师信息
	public function saveTeacherAction(){
		$data = Request::instance()->param();
		$ChuhangTeacherModel = new ChuhangTeacherModel;
		$ChuhangTeacherModel->setData('name', $data['name']);
        //保存数据
        if (false === $ChuhangTeacherModel->validate()->save($data))
        {
            return $this->error($ChuhangTeacherModel->getError());
        }

        return $this->success('操作成功', url('@curriculum/teacher'));
	}

	//删除教师
	public function deleteTeacherAction($id){
		$ChuhangTeacherModel = ChuhangTeacherModel::get($id);
		$ChuhangTeacherModel->setData('is_delete', 1);
		if (false === $ChuhangTeacherModel->save()) {
			return ($ChuhangTeacherModel->getError());
		}
		return $this->success('删除成功');
	}

	//编辑教师
	public function editTeacherAction($id){
		$ChuhangTeacherModel = ChuhangTeacherModel::get($id);
		$this->assign('ChuhangTeacherModel', $ChuhangTeacherModel);
		$this->assign('teacher', 'active');
		return $this->fetch('editTeacher');

	}

	//更新教师
	public function updateTeacherAction($id){
		$data = Request::instance()->param();
		$ChuhangTeacherModel = ChuhangTeacherModel::get($id);
		$ChuhangTeacherModel->setData('name', $data['name']);

		//更新数据
        if (false === $ChuhangTeacherModel->validate()->isUpdate()->save($data))
        {
            return $this->error($ChuhangTeacherModel->getError());
        }

        return $this->success('操作成功', url('@curriculum/teacher'));
	}

	//获取班级信息
	public function klassAction(){
		//查询信息，并显示信息
		$name = input('get.name');
		$ChuhangKlassModel  = new ChuhangKlassModel;
		$map['is_delete'] = 0;
        $ChuhangKlassModels = $ChuhangKlassModel->where($map)->where('name', 'like', '%' . $name . '%')->paginate($this->config['count']['value']);
		$this->assign('ChuhangKlassModels', $ChuhangKlassModels);
		//赋值左侧导航active
		$this->assign('klass', 'active');
		return $this->fetch();
	}


	public function addKlassAction(){
		$this->assign('klass', 'active');
		return $this->fetch();
	}

	public function saveKlassAction(){
		$data = Request::instance()->param();
		$ChuhangKlassModel = new ChuhangKlassModel;
		$ChuhangKlassModel->setData('name', $data['name']);
        //保存数据
        if (false === $ChuhangKlassModel->validate()->save($data))
        {
            return $this->error($ChuhangKlassModel->getError());
        }

        return $this->success('操作成功', url('@curriculum/klass'));
	}

	public function deleteKlassAction($id){
		$ChuhangKlassModel = ChuhangKlassModel::get($id);
		$ChuhangKlassModel->setData('is_delete', 1);
		if (false === $ChuhangKlassModel->save()) {
			return ($ChuhangKlassModel->getError());
		}
		return $this->success('删除成功');
	}

	public function editKlassAction($id){
		$ChuhangKlassModel = ChuhangKlassModel::get($id);
		$this->assign('ChuhangKlassModel', $ChuhangKlassModel);
		$this->assign('klass', 'active');
		return $this->fetch();
	}

	public function updateKlassAction($id){
		$data = Request::instance()->param();
		$ChuhangKlassModel = ChuhangKlassModel::get($id);
		$ChuhangKlassModel->setData('name', $data['name']);

		//更新数据
        if (false === $ChuhangKlassModel->validate()->isUpdate()->save($data))
        {
            return $this->error($ChuhangKlassModel->getError());
        }

        return $this->success('操作成功', url('@curriculum/klass'));
	}

	public function classroomAction(){
		//查询信息，并显示信息
		$name = input('get.name');
		$ChuhangClassroomModel  = new ChuhangClassroomModel;
		$map['is_delete'] = 0;
        $ChuhangClassroomModels = $ChuhangClassroomModel->where($map)->where('name', 'like', '%' . $name . '%')->paginate($this->config['count']['value']);
		$this->assign('ChuhangClassroomModels', $ChuhangClassroomModels);
		//赋值左侧导航active
		$this->assign('classroom', 'active');
		return $this->fetch();
	}

	public function addClassroomAction(){
		$this->assign('classroom', 'active');
		return $this->fetch();
	}

	public function saveClassroomAction(){
		$data = Request::instance()->param();
		$ChuhangClassroomModel = new ChuhangClassroomModel;
		$ChuhangClassroomModel->setData('name', $data['name']);
        //保存数据
        if (false === $ChuhangClassroomModel->validate()->save($data))
        {
            return $this->error($ChuhangClassroomModel->getError());
        }

        return $this->success('操作成功', url('@curriculum/classroom'));
	}

	public function deleteClassroomAction($id){
		$ChuhangClassroomModel = ChuhangClassroomModel::get($id);
		$ChuhangClassroomModel->setData('is_delete', 1);
		if (false === $ChuhangClassroomModel->save()) {
			return ($ChuhangClassroomModel->getError());
		}
		return $this->success('删除成功');
	}

	public function editClassroomAction($id){
		$ChuhangClassroomModel = ChuhangClassroomModel::get($id);
		$this->assign('ChuhangClassroomModel', $ChuhangClassroomModel);
		$this->assign('classroom', 'active');
		return $this->fetch();
	}

	public function updateClassroomAction($id){
		$data = Request::instance()->param();
		$ChuhangClassroomModel = ChuhangClassroomModel::get($id);
		$ChuhangClassroomModel->setData('name', $data['name']);

		//更新数据
        if (false === $ChuhangClassroomModel->validate()->isUpdate()->save($data))
        {
            return $this->error($ChuhangClassroomModel->getError());
        }

        return $this->success('操作成功', url('@curriculum/classroom'));
	}

	public function periodAction(){
		$name = input('get.name');
		$ChuhangPeriodModel = new ChuhangPeriodModel;
		$ChuhangPeriodModels = $ChuhangPeriodModel->where('name', 'like', '%' . $name . '%')->paginate($this->config['count']['value']);
		$this->assign('ChuhangPeriodModels', $ChuhangPeriodModels);
		$this->assign('period', 'active');
		return $this->fetch('period');
	}

	public function addPeriodAction(){
		//获取周期表信息
		$ChuhangPeriodModel = ChuhangPeriodModel::find()->getData();
		$this->assign('ChuhangPeriodModel', $ChuhangPeriodModel);
		//获取节次表信息
		$ChuhangTimeModel = ChuhangTimeModel::all();
		$count = count($ChuhangTimeModel);
		$this->assign('count', $count);

		//获取天数表信息
		$ChuhangDayModel = ChuhangDayModel::all();
		$countDay = count($ChuhangDayModel);
		$this->assign('countDay', $countDay);

		$this->assign('period', 'active');
		return $this->fetch();
	}

	public function updatePeriodAction(){
		$data = Request::instance()->param();
		//将数据存入周期表中
		$start_time = strtotime($data['start_time']);
		$end_time = strtotime($data['end_time']);
		$ChuhangPeriodModel = ChuhangPeriodModel::find();
		$ChuhangPeriodModel->setData('start_time', $start_time);
		$ChuhangPeriodModel->setData('end_time', $end_time);
		$ChuhangPeriodModel->setData('is_create', $data['is_create']);
		if (false === $ChuhangPeriodModel->save()) {
			return $this->error($ChuhangPeriodModel->getError());
		}
		//将数据存入节次表中
		$ChuhangTimeModel = new ChuhangTimeModel;
		//删除所有数据
		$ChuhangTimeModel->where('1')->delete();
		$counts = array();
		for ($i=0; $i<$data['time']; $i++) {
			$ChuhangTimeModel = new ChuhangTimeModel;
			$ChuhangTimeModel->setData('time', $i+1);
			$ChuhangTimeModel->setData('id', $i+1);
			$ChuhangTimeModel->save();
		}

		//将数据存入天数表中
		$ChuhangDayModel = new ChuhangDayModel;
		//删除所有数据
		$ChuhangDayModel->where('1')->delete();
		$counts = array();
		for ($i=0; $i<$data['day']; $i++) {
			$ChuhangDayModel = new ChuhangDayModel;
			$ChuhangDayModel->setData('day', $i+1);
			$ChuhangDayModel->setData('id', $i+1);
			$ChuhangDayModel->save();
		}
		return $this->success('保存成功', url('@curriculum/period'));

	}

	public function savePeriodAction(){
		$data = Request::instance()->param();
		//将日期转化为时间戳
		$$data['start_time'] = strtotime($data['start_time']);
		$$data['end_time'] = strtotime($data['end_time']);

		$ChuhangPeriodModel = new ChuhangPeriodModel;
		$ChuhangPeriodModel->setData('name', $data['name']);
		$ChuhangPeriodModel->setData('start_time', $data['start_time']);
		$ChuhangPeriodModel->setData('end_time', $data['end_time']);
		$ChuhangPeriodModel->setData('is_create', $data['is_create']);
		$ChuhangPeriodModel->setData('time', $data['time']);
		$ChuhangPeriodModel->setData('day', $data['day']);
		if (false === $ChuhangPeriodModel->save()) {
			return $this->error($ChuhangPeriodModel->getError());
		}
		return $this->success('保存成功', url('@curriculum/period'));

	}

	public function editPeriodAction($id){
		$ChuhangPeriodModel = ChuhangPeriodModel::get(id);
		$this->assign('ChuhangPeriodModel', $ChuhangPeriodModel);
		return $this->fetch();
	}


}