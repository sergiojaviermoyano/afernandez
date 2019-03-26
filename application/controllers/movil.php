<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class movil extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Sales');
		//$this->load->model('Lists');
		//$this->load->model('Customers');
		//$this->load->model('Vendedores');
		//$this->load->model('Orders');
		//$this->Users->updateSession(true);
	}


	public function ordenes(){
        $this->load->view('header');
        $data['list'] = $this->Sales->getSales();
        $this->load->view('movil/ordenes', $data);
		$this->load->view('footerdash');
		$this->load->view('footer');
    }
    
	public function printComprobante($id){
        $data['id'] = $id;
        $data['act'] = 'print';
		return  $this->Sales->getSaleByIdPrint($data);
	}
}
?>