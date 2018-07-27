<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class backup extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Backups');
	}

	public function index($permission)
	{
		$data['list'] = null;//$this->Backups->Backup_List();
		$data['permission'] = $permission;
		echo json_encode($this->load->view('backups/list', $data, true));
	}

	public function generate()
	{
		$data = $this->Backups->Backup_Generate();
		echo json_encode($data);
	}

	public function create_fullbackup(){
		$this->load->dbutil();
		$backup =$this->dbutil->backup();
		
		$this->load->helper('file');
		$fileName = 'afernandez_'.date('Y_m_d_Hmi').'.sql.zip';
		write_file(BACKUPFOLDER.'/'.$fileName, $backup);
		  
		$this->load->helper('download');
		force_download($fileName, $backup);
		exit(3);
	}
}