<?php
namespace app\component\controller;

use think\Request;

use app\model\CommentModel;
use app\model\UserModel;  
use app\model\ContentModel;                 // 文章
use app\model\FeedbackModel;

class FeedBackController extends ComponentController
{
	public function indexAction(){
		$FeedbackModel = new FeedbackModel;
        $FeedbackModels = $FeedbackModel->paginate(10);
        $this->assign('FeedbackModels', $FeedbackModels);
        //获取当前用户信息
        $User = UserModel::getCurrentFrontUserModel();
        $this->assign('User', $User);
        
		return $this->fetch();
	}

	public function readAction($id){
		//获取反馈信息
		$FeedbackModel = FeedbackModel::get($id);
		$this->assign('FeedbackModel', $FeedbackModel);
        //获取评论内容
        $CommentModel = new CommentModel();
        $map = [];
        $map['key_id'] = $id;
        $CommentModels = $CommentModel->where($map)->select();
        $this->assign('CommentModels', $CommentModels);

        // 增加一个点击量
        $ContentModel = new ContentModel();
        $ContentModel->hit = $ContentModel->hit + 1;
        $ContentModel->save();
        //获取当前用户信息
        $User = UserModel::getCurrentFrontUserModel();
        $this->assign('User', $User);
        //获取教室序号
		$map= [];
		$map['content_type_name'] = "classroom";
		$Classrooms = $ContentModel->where($map)->select();
		$this->assign('Classrooms', $Classrooms);

        return $this->fetch();
	}

	public function addAction(){
		//获取教室序号
		$ContentModel = new ContentModel();
		$map['content_type_name'] = "classroom";
		$Classrooms = $ContentModel->where($map)->select();
		$this->assign('Classrooms', $Classrooms);
		return $this->fetch();
	}

	public function saveAction(){
		$data = Request::instance()->param();
		//获取教室信息
		$ContentModel = new ContentModel();
		$map['title'] = $data['classroom'];
		$classroom = $ContentModel->where($map)->find()->getData('id');
		//保存反馈信息
		$FeedbackModel = new FeedbackModel();
		$FeedbackModel->setData('title', $data['comment']);
		$FeedbackModel->setData('number', $data['number']);
		$FeedbackModel->setData('email', $data['email']);
		$FeedbackModel->setData('classroom', $data['classroom']);
		if (false === $FeedbackModel->save()) {
			return $this->error($FeedbackModel->getError());
		}
		return $this->success('操作成功', url('@' . $this->currentMenuModel->getData('url')));
	}

	public function saveCommentAction(){
		$data = Request::instance()->param();
		//保存评论信息
		$CommentModel = new CommentModel;
		$CommentModel->setData('classroom', $data['classroom']);
		$CommentModel->setData('content', $data['comment']);
		$CommentModel->setData('number', $data['number']);
		$CommentModel->setData('email', $data['email']);
		$CommentModel->setData('key_id', $data['id']);
		if (false === $CommentModel->save()) {
			return $this->error($CommentModel->getError());
		}
		return $this->success('操作成功');
	}

	public function deleteAction() {
		$id = Request::instance()->param('id');

		//删除对应的评论信息
		$CommentModel = new CommentModel;
		$map['key_id'] = $id;
		$data = $CommentModel->where($map)->find()->getData();
		if (false === empty($data)) {
			$CommentModel = CommentModel::get($map);
			$CommentModel->delete();
		}

		//删除反馈信息
		$FeedbackModel = FeedbackModel::get($id);
		if (false === $FeedbackModel->delete()){
			return $this->error('删除失败');
		}
		return $this->success('删除成功');
	}

	public function deleteCommentAction(){
		$id = Request::instance()->param('id');
		$CommentModel = CommentModel::get($id);
		if (false === $CommentModel->delete()) {
			return $this->error($CommentModel->getError());
		}
		return $this->success('删除成功');
	}
}