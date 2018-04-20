<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class sale extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Sales');
		$this->load->model('Lists');
		$this->load->model('Customers');
		$this->load->model('Vendedores');
		$this->Users->updateSession(true);
	}

	public function minorista(){
		$data['lists'] = $this->Lists->List_List();
		$data['final'] = $this->Customers->DefaultCustomer();
		$data['vendedores'] = $this->Vendedores->getActiveVendedores();
		echo json_encode($this->load->view('sales/minorista', $data, true));
	}

	public function setSaleMinorista(){
		echo json_encode($this->Sales->setSaleMinorista($this->input->post()));
	}

	public function mayorista(){
		$data['lists'] = $this->Lists->List_List();
		$data['final'] = $this->Customers->DefaultCustomer();
		$data['vendedores'] = $this->Vendedores->getActiveVendedores();
		echo json_encode($this->load->view('sales/mayorista', $data, true));
	}

	public function setSaleMayorista(){
		echo json_encode($this->Sales->setSaleMayorista($this->input->post()));
	}


	public function listado_minorista($permission){
		$data=array();
		$data['list'] = array();//$this->Lists->List_List();
		$data['permission'] = $permission;
		echo json_encode($this->load->view('sales/listado_minorista', $data, true));
	}

	public function datatable_minorista(){
		//var_dump($_REQUEST);
		//var_dump($this->input->post());

		$totalVentas= $this->Sales->getTotalSaleMinorista($_REQUEST);
		$ventas= $this->Sales->getSaleMinorista($_REQUEST);

		$response=array(
			'draw' => $_REQUEST['draw'],
			'recordsTotal' => $totalVentas,
			'recordsFiltered' => $totalVentas,
			'data' => $ventas
		);

		echo json_encode($response);

	}

	public function printComprobante(){
		$this->load->library('pdf');
		$data=array();
		$file_pdf = $this->pdf->generate_pdf('sales/print_orden',$data);

		echo json_encode(array('result'=>true,'filename_url'=>$file_pdf));
	}
}
