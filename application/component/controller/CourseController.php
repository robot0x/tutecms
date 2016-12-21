<?php
namespace app\component\controller;

use think\Request;

use app\model\UserModel;  
use app\model\ChuhangCurriculumModel; 
use app\model\ChuhangDayModel;
use app\model\ChuhangCourseModel;
use app\model\ChuhangClassroomModel;
use app\model\ChuhangKlassModel;
use app\model\ChuhangPeriodModel;
use app\model\ChuhangTimeModel;
use app\model\ChuhangTeacherModel;


class CourseController extends ComponentController
{
    public function indexAction() 
    {
        //获取查询到的信息
        $getData = input('get.');

        //获取当前用户信息
        $User = UserModel::getCurrentFrontUserModel();
        $this->assign('User', $User);

    	// 所有周次课表
        //$isAllWeeksSelected = $getData[''] ? true : false;

        // 取学期
        $currentPeriod = ChuhangPeriodModel::getCurrentPeriod();
        
        $ChuhangCurriculumModel = new ChuhangCurriculumModel;
        if ($isAllWeeksSelected) {
            $ChuhangCurriculumModels = $ChuhangCurriculumModel->getAllDatasByPeriodId($currentPeriod->getData('id'));
        } else {
            $ChuhangCurriculumModels = $ChuhangCurriculumModel->getDatasByWeekNumPeriodId($currentPeriod->getData('id'));
        }
        // 用户选择周次课表 
        $this->assign('ChuhangCurriculumModels', $ChuhangCurriculumModels);

        
        //获取每星期的天数信息
        $ChuhangDayModel = ChuhangDayModel::all();
        $this->assign('ChuhangDayModel', $ChuhangDayModel);

        //判断课程是否为全选，判断删除、编辑等操作的执行
        $isAll = $ChuhangCurriculumModel->isAll($getData);
        $this->assign('isAll', $isAll);

        

    	return $this->fetch();
    }

    public function editAction($id){
        //获取编辑的基本信息
        //获取课程信息
        $ChuhangCourseModels = ChuhangCourseModel::all();
        $this->assign('ChuhangCourseModels', $ChuhangCourseModels);
        //获取教师信息
        $ChuhangTeacherModels = ChuhangTeacherModel::all();
        $this->assign('ChuhangTeacherModels', $ChuhangTeacherModels);
        //获取教室信息
        $ChuhangClassroomModels = ChuhangClassroomModel::all();
        $this->assign('ChuhangClassroomModels', $ChuhangClassroomModels);
        //获取班级信息
        $ChuhangKlassModels = ChuhangKlassModel::all();
        $this->assign('ChuhangKlassModels', $ChuhangKlassModels);
        //获取节次信息
        $ChuhangTimeModels = ChuhangTimeModel::all();
        $this->assign('ChuhangTimeModels', $ChuhangTimeModels);
        //获取星期信息
        $ChuhangDayModels = ChuhangDayModel::all();
        $this->assign('ChuhangDayModels', $ChuhangDayModels);
        //获取周次信息,取起始时间和结束时间的时间戳获取周次数
        $ChuhangPeriodModel = ChuhangPeriodModel::get();
        $week = (int)((($ChuhangPeriodModel->getData('end_time') - $ChuhangPeriodModel->getData('start_time'))/86400)/7) + 1;
        $weeks = $ChuhangPeriodModel->getWeek($week);
        $this->assign('weeks', $weeks);

        //获取要编辑的课程信息
        $ChuhangCurriculumModel = ChuhangCurriculumModel::get($id);
        $this->assign('ChuhangCurriculumModel', $ChuhangCurriculumModel);
        //查询编辑的课程的周次信息
        $map['classroom_id'] = $ChuhangCurriculumModel->getData('classroom_id');
        $map['teacher_id'] = $ChuhangCurriculumModel->getData('teacher_id');
        $map['course_id'] = $ChuhangCurriculumModel->getData('course_id');
        $map['time_id'] = $ChuhangCurriculumModel->getData('time_id');
        $map['day_id'] = $ChuhangCurriculumModel->getData('day_id');
        $map['klass'] = $ChuhangCurriculumModel->getData('klass');
        $ChuhangCurriculumModel = new ChuhangCurriculumModel;
        $ChuhangCurriculumModels = $ChuhangCurriculumModel->where($map)->select();
        $this->assign('ChuhangCurriculumModels', $ChuhangCurriculumModels);
        return $this->fetch();
    }

    public function addAction(){
        $data = Request::instance()->param();
        //判断是否有课程的位置信息
        if (empty($data)){
            $data['ve'] = '10';
            $data['id'] = '10';
        }

        $this->assign('data', $data);
        //获取课程信息
        $ChuhangCourseModels = ChuhangCourseModel::all();
        $this->assign('ChuhangCourseModels', $ChuhangCourseModels);
        //获取教师信息
        $ChuhangTeacherModels = ChuhangTeacherModel::all();
        $this->assign('ChuhangTeacherModels', $ChuhangTeacherModels);
        //获取教室信息
        $ChuhangClassroomModels = ChuhangClassroomModel::all();
        $this->assign('ChuhangClassroomModels', $ChuhangClassroomModels);
        //获取班级信息
        $ChuhangKlassModels = ChuhangKlassModel::all();
        $this->assign('ChuhangKlassModels', $ChuhangKlassModels);
        //获取节次信息
        $ChuhangTimeModels = ChuhangTimeModel::all();
        $this->assign('ChuhangTimeModels', $ChuhangTimeModels);
        //获取星期信息
        $ChuhangDayModels = ChuhangDayModel::all();
        $this->assign('ChuhangDayModels', $ChuhangDayModels);
        //获取周次信息,取起始时间和结束时间的时间戳获取周次数
        $ChuhangPeriodModel = ChuhangPeriodModel::get();
        $week = (int)((($ChuhangPeriodModel->getData('end_time') - $ChuhangPeriodModel->getData('start_time'))/86400)/7) + 1;
        $weeks = $ChuhangPeriodModel->getWeek($week);
        $this->assign('weeks', $weeks);

        return $this->fetch('add');
    }


    //在固定的节次、天增加课程
    public function addCourseAction(){
        $this->addAction();
    }


    //保存课程信息
    public function saveAction(){
        $data = Request::instance()->param();
        //判断是否选择课程信息
        if ($data['course'] === 'no') {
            return $this->error('请选择课程');
        }
        
        //判断是否选择教师信息
        if ($data['teacher'] === 'no') {
            return $this->error('请选择教师');
        }

        //判断是否选择教室信息
        if ($data['classroom'] === 'no') {
            return $this->error('请选择教室');
        }
        
        //判断是否存在week字段
        if (isset($data['week']) === false) {
            return $this->error('请选择周次');
        }
        //判断是否存在day字段
        if (isset($data['day']) === false) {
            return $this->error('请选择星期');
        }
        //判断是否存在time字段
        if (isset($data['time']) === false) {
            return $this->error('请选择节次');
        }
        //判断是否存在klass字段
        if (isset($data['klass']) === false) {
            return $this->error('请选择班级');
        }
        $klass = json_encode($data['klass']);

        //判断用户选择的课程的教室、时间段是否已有课程安排
        $ChuhangCurriculumModel = new ChuhangCurriculumModel;
        if ($ChuhangCurriculumModel->getJudge($data)) {
            return $this->error('您选择的课程所在的教室及对应的时间段已有课程安排');
        }

        //对课程所在的每个周次进行保存
        for ($i=0; $i<count($data['week']); $i++) {
            //对课程所在的天进行保存
            for ($m=0; $m<count($data['day']); $m++) {
                //对课程所在的节次进行保存
                for ($n=0; $n<count($data['time']); $n++) {
                    $ChuhangCurriculumModel = new ChuhangCurriculumModel;
                    $ChuhangCurriculumModel->setData('course_id', $data['course']);
                    $ChuhangCurriculumModel->setData('teacher_id', $data['teacher']);
                    $ChuhangCurriculumModel->setData('classroom_id', $data['classroom']);
                    $ChuhangCurriculumModel->setData('klass', $klass);
                    $ChuhangCurriculumModel->setData('time_id', (int)$data['time'][$n]);
                    $ChuhangCurriculumModel->setData('day_id', (int)$data['day'][$m]);
                    $ChuhangCurriculumModel->setData('week', (int)$data['week'][$i]);
                    if (false === $ChuhangCurriculumModel->save()) {
                        return $this->error($ChuhangCurriculumModel->getError());
                    }
                }
            }
        }

        return $this->success('保存成功', url('@course'));

    }

    //对课程的删除操作
    public function deleteAction(){
        $data = Request::instance()->param();
        //键名isAll的值为1，代表删除关联的课程，0代表值删除一条数据
        //删除此条数据config信息中的对应信息
        if ($data['isAll'] == 1) {
            $ChuhangCurriculumModel = ChuhangCurriculumModel::get($data['id']);
            $All = $ChuhangCurriculumModel->getData('config');
            $All = json_decode($All);
            $map['course_id'] = $ChuhangCurriculumModel->getData('course_id');
            $map['classroom_id'] = $ChuhangCurriculumModel->getData('classroom_id');
            $map['day_id'] = $ChuhangCurriculumModel->getData('day_id');
            $map['time_id'] = $ChuhangCurriculumModel->getData('time_id');
            $count = count($All);
            for ($i=0; $i<$count; $i++) {
                $map['week'] = $All[$i];
                $ChuhangCurriculumModel = ChuhangCurriculumModel::get($map);
                if ($ChuhangCurriculumModel->delete() === false) {
                return $this->error($ChuhangCurriculumModel->getError());
                }
            }
        }

        //删除本条数据
        $ChuhangCurriculumModel = ChuhangCurriculumModel::get($data['id']);
         if ($ChuhangCurriculumModel->delete() === false) {
            return $this->error($ChuhangCurriculumModel->getError());
         }


        return $this->success('删除成功');

    }

    //更新课程信息，先删除，在新增保存
    public function updateAction(){
        $data = Request::instance()->param();
        //判断是否存在week字段
        if (isset($data['week']) === false) {
            return $this->error('请选择周次');
        }
        //判断是否存在day字段
        if (isset($data['day']) === false) {
            return $this->error('请选择星期');
        }
        //判断是否存在time字段
        if (isset($data['time']) === false) {
            return $this->error('请选择节次');
        }
        //判断是否存在klass字段
        if (isset($data['klass']) === false) {
            return $this->error('请选择班级');
        }
        $klass = json_encode($data['klass']);

        //TODO判断要编辑的课程是否已有课程安排
        //判断用户选择的课程的教室、时间段是否已有课程安排
        $ChuhangCurriculumModel = new ChuhangCurriculumModel;
        if ($ChuhangCurriculumModel->getEditJudge($data)) {
            return $this->error('您选择的课程所在的教室及对应的时间段已有课程安排');
        }

        //删除课程信息
        $map['course_id'] = $data['course'];
        $map['teacher_id'] = $data['teacher'];
        $map['classroom_id'] = $data['classroom'];
        $map['time_id'] = $data['time'][0];
        $map['day_id'] = $data['day'][0];

        $ChuhangPeriodModel = ChuhangPeriodModel::get();
        $week = (int)((($ChuhangPeriodModel->getData('end_time') - $ChuhangPeriodModel->getData('start_time'))/86400)/7) + 1;
        for ($i=0; $i<$week; $i++) {
            $map['week'] = $i+1;
            $ChuhangCurriculumModel = ChuhangCurriculumModel::get($map);
            if (!empty($ChuhangCurriculumModel->getData()) && $ChuhangCurriculumModel->delete() === false) {
                return $this->error($ChuhangCurriculumModel->getError());
            }
        }
        
         //对课程所在的每个周次进行保存
        $klass = json_encode($data['klass']);
        for ($i=0; $i<count($data['week']); $i++) {
            //对课程所在的天进行保存
            for ($m=0; $m<count($data['day']); $m++) {
                //对课程所在的节次进行保存
                for ($n=0; $n<count($data['time']); $n++) {
                    $ChuhangCurriculumModel = new ChuhangCurriculumModel;
                    $ChuhangCurriculumModel->setData('course_id', $data['course']);
                    $ChuhangCurriculumModel->setData('teacher_id', $data['teacher']);
                    $ChuhangCurriculumModel->setData('classroom_id', $data['classroom']);
                    $ChuhangCurriculumModel->setData('klass', $klass);
                    $ChuhangCurriculumModel->setData('time_id', (int)$data['time'][$n]);
                    $ChuhangCurriculumModel->setData('day_id', (int)$data['day'][$m]);
                    $ChuhangCurriculumModel->setData('week', (int)$data['week'][$i]);
                    if (false === $ChuhangCurriculumModel->save()) {
                        return $this->error($ChuhangCurriculumModel->getError());
                    }
                }
            }
        }
        return $this->success('保存成功', url('@course'));
    }


}
?> 