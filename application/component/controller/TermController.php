<?php
namespace app\component\controller;

use think\Request;

use app\model\ChuhangDayModel;
use app\model\ChuhangCurriculaModel;
use app\model\ChuhangTermModel;
use app\model\ChuhangTimeModel;
use app\model\ChuhangCurriculumModel;


class TermController extends ComponentController
{
	public function indexAction(){
		$name = input('get.name');
		$ChuhangTermModel = new ChuhangTermModel;
		$map['is_delete'] = 0;
		$ChuhangTermModels = $ChuhangTermModel->where('name', 'like', '%' . $name . '%')->where($map)->paginate($this->config['count']['value']);
		$this->assign('ChuhangTermModels', $ChuhangTermModels);
		$this->assign('term', 'active');
		return $this->fetch('term');
	}

	public function addAction(){
		//获取周期表信息
		$ChuhangTermModel = ChuhangTermModel::find()->getData();
		$this->assign('ChuhangTermModel', $ChuhangTermModel);
		//获取节次表信息
		$ChuhangTimeModel = ChuhangTimeModel::all();
		$count = count($ChuhangTimeModel);
		$this->assign('count', $count);

		//获取天数表信息
		$ChuhangDayModel = ChuhangDayModel::all();
		$countDay = count($ChuhangDayModel);
		$this->assign('countDay', $countDay);

		$this->assign('term', 'active');
		return $this->fetch();
	}

	public function updateAction($id){
		$data = Request::instance()->param();

		//将数据存入周期表中
		$data['start_time'] = strtotime($data['start_time']);
		$data['end_time'] = strtotime($data['end_time']);
		//对用户更新的名称进行验证
		if ($data['name'] === '') {
			return $this->error('名称不能为空');
		}
		$ChuhangTermModel = new ChuhangTermModel;
		
		//使所有学期status值为0
		if ($data['status'] == 1) {
			$ChuhangTermModel->makeAllTermStatusZero();
		}

		$ChuhangTermModel = ChuhangTermModel::get($id);

		//更新本学期对应的time表中的信息
		if ($ChuhangTermModel->updateTimeInfo($data) === false) {
			return $this->error($ChuhangTermModel->getError());
		}
		//更新本学期对应的day表中的信息
		if ($ChuhangTermModel->updateDayInfo($data) === false)	 {
			return $this->error($ChuhangTermModel->getError());
		}

		$ChuhangTermModel->setData('start_time', $data['start_time']);
		$ChuhangTermModel->setData('end_time', $data['end_time']);
		$ChuhangTermModel->setData('status', $data['status']);
		$ChuhangTermModel->setData('name', $data['name']);
		$ChuhangTermModel->setData('time', $data['time']);
		$ChuhangTermModel->setData('day', $data['day']);
		if (false === $ChuhangTermModel->save()) {
			return $this->error($ChuhangTermModel->getError());
		}
		
		
		return $this->success('保存成功', url('@term'));

	}

	public function saveAction(){
		$data = Request::instance()->param();

		//将日期转化为时间戳
		$data['start_time'] = strtotime($data['start_time']);
		if ($data['start_time'] === false) {
			$data['start_time'] = '';
		}
		$data['end_time'] = strtotime($data['end_time']);
		if ($data['end_time'] === false) {
			$data['end_time'] = '';
		}

		$ChuhangTermModel = new ChuhangTermModel;

		//使所有学期status值为0
		if ($data['status'] == 1) {
			$ChuhangTermModel->makeAllTermStatusZero($data);
		}
		$ChuhangTermModel->setData('name', $data['name']);
		$ChuhangTermModel->setData('start_time', $data['start_time']);
		$ChuhangTermModel->setData('end_time', $data['end_time']);
		$ChuhangTermModel->setData('status', $data['status']);
		$ChuhangTermModel->setData('time', $data['time']);
		$ChuhangTermModel->setData('day', $data['day']);
		if (false === $ChuhangTermModel->validate()->save($data)) {
			return $this->error($ChuhangTermModel->getError());
		}
		//保存节次表和天数表中对应该学期对应的信息
		$ChuhangTermModel->saveTimeDay($data);
			

		return $this->success('保存成功', url('@term'));

	}

	public function editAction($id){
		$ChuhangTermModel = ChuhangTermModel::get($id);
		$this->assign('ChuhangTermModel', $ChuhangTermModel);
		$this->assign('term', 'active');
		return $this->fetch();
	}

	public function frozenAction($id){
		$ChuhangTermModel = ChuhangTermModel::get($id);
		if ($ChuhangTermModel->getData('status') == 1) {
			$ChuhangTermModel->setData('status', 0);
			if (false !== $ChuhangTermModel->save()) {
				return $this->success('冻结成功');
			}
		} else {
			//使所有学期status值为0
			$ChuhangTermModel->makeAllTermStatusZero();
			$ChuhangTermModel->setData('status', 1);
			if (false !== $ChuhangTermModel->save()) {
				return $this->success('解冻成功');
			}
		}
	}


	public function deleteAction($id){
		//判断本学期是否有课程
		$ChuhangCurriculumModel = new ChuhangCurriculumModel;
		$map['term_id'] = (int)$id;
		$ChuhangCurriculumModels = $ChuhangCurriculumModel->where($map)->select();
		if (!empty($ChuhangCurriculumModels)) {
			return $this->error('本学期含有课程');
		}

		//删除学期表中对应的信息
		$ChuhangTermModel = ChuhangTermModel::get($id);
		$ChuhangTermModel->setData('is_delete', 1);
		if (false === $ChuhangTermModel->save()) {
			return $ChuhangTermModel->getError();
		}
		//删除本学期对应的time和day表中的信息
		$ChuhangTermModel->deleteTimeDayInfo($id);
		return $this->success('删除成功');
	}


}