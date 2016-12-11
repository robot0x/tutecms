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
    	$ChuhangCurriculumModel = new ChuhangCurriculumModel;
    	//获取显示的课表
        $results = $ChuhangCurriculumModel->getResult();
        $this->assign('results', $results);
        $this->assign('ChuhangCurriculumModel', $ChuhangCurriculumModel);

        //获取当前用户信息
        $User = UserModel::getCurrentFrontUserModel();
        $this->assign('User', $User);
    	return $this->fetch();
    }

    public function editAction(){
        return $this->fetch();
    }

    public function addAction(){
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
        $week = (int)((($ChuhangPeriodModel->getData('end_time') - $ChuhangPeriodModel->getData('start_time'))/86400)/7) + 5;
        $weeks = $ChuhangPeriodModel->getWeek($week);
        $this->assign('weeks', $weeks);

        return $this->fetch();
    }


    //保存课程信息
    public function saveAction(){
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


}
?> 