<?php
namespace app\component\controller;

use think\Request;

use app\model\UserModel;  
use app\model\ChuhangCurriculumModel; 
use app\model\ChuhangDayModel;
use app\model\ChuhangCourseModel;
use app\model\ChuhangClassroomModel;
use app\model\ChuhangKlassModel;
use app\model\ChuhangTermModel;
use app\model\ChuhangTimeModel;
use app\model\ChuhangTeacherModel;


class CourseController extends ComponentController
{
    public function __construct()
    {
        parent::__construct();

        //获取当前学期id
        $currentTermId = ChuhangTermModel::getCurrentTerm();
        $this->currentTermId = $currentTermId;
    }
    public function indexAction() 
    {
        //获取查询到的信息
        $getData = input('get.');
        //获取当前学期id
        $currentTermId = $this->currentTermId;

        //获取当前用户组信息
        $currentUserGroupModel = $this->currentFrontUserModel->getData('user_group_name');
        $this->assign('currentUserGroupModel', $currentUserGroupModel);

        //判断学期表中是否存在进行中的学期
        if (!$currentTermId) {
            if ($currentUserGroupModel === 'editor') {
                return $this->error('请选择进行中的学期', url('@curriculum/term'));
            }
            return $this->error('对不起，暂无课程信息');
        }
        //获取当前周次
        $currentWeek = ChuhangTermModel::getCurrentWeek($currentTermId);
        $this->assign('currentWeek', $currentWeek);
        //判断是否为全选
        $isAllWeeksSelected = ChuhangTermModel::getIsAllWeeksSelected($getData);
        $this->assign('isAllWeeksSelected', $isAllWeeksSelected);

        //获取显示的课表信息
        $ChuhangCurriculumModels = ChuhangCurriculumModel::getAllCurriculumsByTermId($currentTermId, $currentWeek, $isAllWeeksSelected, $getData);
        $this->assign('ChuhangCurriculumModels', $ChuhangCurriculumModels);
        $this->assign('getData', $getData);

        return $this->fetch();
    }

    public function editAction($id){
        $data = Request::instance()->param();
        //获取本学期的课程、教室、班级、教师、节次/天、天数/周、周次等信息
        $allInfo = ChuhangCurriculumModel::getAllInfo();
        $this->assign('allInfo', $allInfo);

        //获取要编辑的课程信息
        $ChuhangCurriculumModel = ChuhangCurriculumModel::get($id);
        $this->assign('ChuhangCurriculumModel', $ChuhangCurriculumModel);

        //查询编辑的课程的周次信息
        if ($data['isAll'] === '1') {
            $weekInfos = $ChuhangCurriculumModel->getEditCurriculumInfo();
        } else {
            $weekInfos[] = $ChuhangCurriculumModel;
        }
        
        $this->assign('weekInfos', $weekInfos);
        $this->assign('isAll', $data['isAll']);
        return $this->fetch();
    }

    public function addAction(){
        $data = Request::instance()->param();
        //判断是否有课程的位置信息
        if (empty($data)){
            $data['ve'] = 10;
            $data['id'] = 10;
        }
        $this->assign('data', $data);

        //获取本学期的课程、教室、班级、教师、节次/天、天数/周、周次等信息
        $allInfo = ChuhangCurriculumModel::getAllInfo();
        $this->assign('allInfo', $allInfo);
        
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
        if ($data['course_id'] === 'no') {
            return $this->error('请选择课程');
        }
        
        //判断是否选择教师信息
        if ($data['teacher_id'] === 'no') {
            return $this->error('请选择教师');
        }

        //判断是否选择教室信息
        if ($data['classroom_id'] === 'no') {
            return $this->error('请选择教室');
        }
        
        //判断是否存在week字段
        if (isset($data['week']) === false) {
            return $this->error('请选择周次');
        }
        //判断是否存在day字段
        if (isset($data['day_id']) === false) {
            return $this->error('请选择星期');
        }
        //判断是否存在time字段
        if (isset($data['time_id']) === false) {
            return $this->error('请选择节次');
        }
        //判断是否存在klass字段
        if (isset($data['klass']) === false) {
            return $this->error('请选择班级');
        }
        $klass = json_encode($data['klass']);

        //判断用户选择的课程的教室、时间段是否已有课程安排
        $ChuhangCurriculumModel = new ChuhangCurriculumModel;
        if ($ChuhangCurriculumModel->isHave($data, $this->currentTermId)) {
            return $this->error('您选择的课程所在的教室及对应的时间段已有课程安排');
        }

        //对课程所在的每个周次进行保存
        if ($ChuhangCurriculumModel->saveCurriculum($data, $klass, $this->currentTermId)) {
            return $this->error($ChuhangCurriculumModel->getError());
        }

        return $this->success('保存成功', url('@course'));

    }

    //对课程的删除操作
    public function deleteAction(){
        $data = Request::instance()->param();

        $ChuhangCurriculumModel = ChuhangCurriculumModel::get($data['id']);
        //键名isAll的值为1，代表删除关联的课程，0代表值删除一条数据
        //删除此条数据config信息中的对应信息
        if ($data['isAll'] === '1') {
            if ($ChuhangCurriculumModel->deleteAssociateInfo($this->currentTermId)) {
                return $ChuhangCurriculumModel->getError();
            }
        }
       
        //删除本条数据
         if ($ChuhangCurriculumModel->deleteCurrentInfo($data, $this->currentTermId)) {
            return $this->error($ChuhangCurriculumModel->getError());
         }


        return $this->success('删除成功', url('@course'));

    }

    //更新课程信息，先删除，在新增保存
    public function updateAction(){
        $data = Request::instance()->param();
        //判断是否存在week字段
        if (isset($data['week']) === false) {
            return $this->error('请选择周次');
        }
        //判断是否存在day字段
        if (isset($data['day_id']) === false) {
            return $this->error('请选择星期');
        }
        //判断是否存在time字段
        if (isset($data['time_id']) === false) {
            return $this->error('请选择节次');
        }
        //判断是否存在klass字段
        if (isset($data['klass']) === false) {
            return $this->error('请选择班级');
        }
        $klass = json_encode($data['klass']);

        //判断用户编辑此条数据选择的全选或仅选择一条数据，分为两种情况进行操作
        if ($data['isAll'] === '0') {
            //如果isAll为0，则先把此条数据is_delete设置为1，然后判断保存的课程是否和其他课程安排有冲突，如果没有把此条数据删除，保存添加的数据信息，如果有，吧is_delete字段修改为0并保存，然后返回
            $ChuhangCurriculumModel = ChuhangCurriculumModel::get($data['id']);
            //对编辑的课程信息软删除
            $ChuhangCurriculumModel->setData('is_delete', 1);
            $ChuhangCurriculumModel->save();
            //如果用户选择的课程在同一教室的同一时间段已有其他课程安排，则恢复软删除的数据，返回提示信息
            if ($ChuhangCurriculumModel->isHave($data, $this->currentTermId)) {

                $ChuhangCurriculumModel->setData('is_delete', 0);
                $ChuhangCurriculumModel->save();

                return $this->error('您选择的课程所在的教室及对应的时间段已有课程安排');
            }

            //删除原课程信息
            if ($ChuhangCurriculumModel->delete() === false) {
                return $ChuhangCurriculumModel->getError();
            }

            //对课程所在的每个周次、节次、星期进行保存
            if ($ChuhangCurriculumModel->saveCurriculum($data, $klass, $this->currentTermId)) {
                return $this->error($ChuhangCurriculumModel->getError());
            }
        } else {
            //isAll为1，同上，但是把一条数据改为多条数据
            if (ChuhangCurriculumModel::isHaveAssociateCurriculum($data,  $this->currentTermId, $klass)) {

                return $this->error('您选择的课程所在的教室及对应的时间段已有课程安排');
            }
        } 

        return $this->success('保存成功', url('@course'));
    }
}
?> 