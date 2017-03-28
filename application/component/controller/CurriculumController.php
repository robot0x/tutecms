<?php
namespace app\component\controller;

use think\Request;

use app\model\ChuhangCurriculaModel;

class CurriculumController extends ComponentController
{
	public function __construct()
    {
        parent::__construct();

        //获取当前菜单对应的数据表名称
        $url = $this->currentMenuModel->getData('url');
        $table = 'app\model\Chuhang' . ucfirst($url) . 'Model';
        $this->url = $url;
        $this->table = $table;
        
    }

	public function indexAction(){
		//查询信息，并显示信息
		$name = input('get.name');
		$map['is_delete'] = 0;
		$ChuhangXXXModel = new $this->table;
        $ChuhangXXXModels = $ChuhangXXXModel->where($map)->where('name', 'like', '%' . $name . '%')->paginate($this->config['count']['value']);
		$this->assign('ChuhangXXXModels', $ChuhangXXXModels);
		//赋值左侧导航active
		$this->assign($this->url, 'active');
		//传递路由信息
		$this->assign('url', $this->url);
		return $this->fetch();
	}

	public function addAction(){
		//根据路由获取对应菜单名称
		$ChuhangCurriculaModel = new ChuhangCurriculaModel;
		$chineseName = $ChuhangCurriculaModel->getChinieseNameByUrl($this->url);
		$this->assign('chineseName', $chineseName);

		$this->assign($this->url, 'active');
		return $this->fetch();
	}

	//保存课程信息
	public function saveAction(){
		$data = Request::instance()->param();
		$ChuhangXXXModel = new $this->table;
		$ChuhangXXXModel->setData('name', $data['name']);
        //保存数据
        if (false === $ChuhangXXXModel->validate()->save($data))
        {
            return $this->error($ChuhangXXXModel->getError());
        }

        return $this->success('操作成功', url("@$this->url"));
	}


	//删除课程信息
	public function deleteAction($id){
		$ChuhangXXXModel = new $this->table;
		$ChuhangXXXModel = $ChuhangXXXModel->find($id);
		$ChuhangXXXModel->setData('is_delete', 1);
		if (false === $ChuhangXXXModel->save()) {
			return ($ChuhangXXXModel->getError());
		}
		return $this->success('删除成功');
	}

	//编辑课程信息
	public function editAction($id){
		$map['id'] = $id;
		$ChuhangXXXModel = new $this->table;
		$ChuhangXXXModel = $ChuhangXXXModel->find($id);
		$this->assign('ChuhangXXXModel', $ChuhangXXXModel);
		$this->assign($this->url, 'active');
		//根据路由获取对应菜单名称
		$ChuhangCurriculaModel = new ChuhangCurriculaModel;
		$chineseName = $ChuhangCurriculaModel->getChinieseNameByUrl($this->url);
		$this->assign('chineseName', $chineseName);
		//传递路由信息
		$this->assign('url', $this->url);
		return $this->fetch();
	}

	//更新课程信息
	public function updateAction($id){
		$data = Request::instance()->param();
		$ChuhangXXXModel = new $this->table;
		$ChuhangXXXModel = $ChuhangXXXModel->find($id);
		$ChuhangXXXModel->setData('name', $data['name']);

		//更新数据
        if (false === $ChuhangXXXModel->validate()->isUpdate()->save($data))
        {
            return $this->error($ChuhangXXXModel->getError());
        }

        return $this->success('操作成功', url("@$this->url"));
	}
}